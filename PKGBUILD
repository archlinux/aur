# Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Geoff Hill <geoff@geoffhill.org>
# Contributor: Sebastien Bariteau <numkem@numkem.org>
# Contributor: Justin Dray <justin@dray.be>

pkgname="google-cloud-sdk"
pkgver=106.0.0
pkgrel=1
pkgdesc="Contains tools and libraries that enable you to easily create and manage resources on Google Cloud Platform"
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2')
optdepends=('go: for Go version of App Engine'
            'java-environment: for Java version of App Engine'
            'php: for PHP version of App Engine')
options=('!strip' 'staticlibs')

# 64bit
source_x86_64=("https://dl.google.com/dl/cloudsdk/release/downloads/$pkgname-$pkgver-linux-x86_64.tar.gz"
               "profile.sh")
sha1sums_x86_64=('22fbe7226d4f7729f894512064af1226136b80cc'
                 '9c09e242b113e50e3f2fa05b6c6c7b0ff33b4b71')

# 32bit
source_i686=("https://dl.google.com/dl/cloudsdk/release/downloads/$pkgname-$pkgver-linux-x86.tar.gz"
             "profile.sh")
sha1sums_i686=('1a3a023a26fe92129ece3229e4c228fb5f3a6b92'
               '9c09e242b113e50e3f2fa05b6c6c7b0ff33b4b71')

prepare() {

  msg2 "Checking for newer upstream release"
  _LATEST=$(curl -s https://dl.google.com/dl/cloudsdk/release/sha1.txt | 
            egrep "google-cloud-sdk-.*-linux-x86_64.tar.gz" | \
            awk '{print $2}' | cut -d'-' -f4)
  if [ "$_LATEST" != "$pkgver" ]; then
    msg2 "This AUR release: $pkgver"
    msg2 "Latest upstream release: $_LATEST"
    msg2 "** Please flag out-of-date at https://aur.archlinux.org/packages/google-cloud-sdk"
  fi

}

package() {

  msg2 "Copying core SDK components"
  mkdir "$pkgdir/opt"
  cp -r "$srcdir/$pkgname" "$pkgdir/opt"

  # kubectl is not in the tarball, add it to the package bootstrap
  msg2 "Running bootstrapping script and adding kubectl"
  python2 "$pkgdir/opt/$pkgname/bin/bootstrapping/install.py" \
    --usage-reporting false --path-update false --bash-completion false \
    --rc-path="$srcdir/fake.bashrc" --additional-components="kubectl"

  # This is the strangest design they made to backup a fresh install
  msg2 "Removing unnecessary backups created by bootstrap"
  rm -rf "$pkgdir/opt/$pkgname/.install/.backup"
  mkdir "$pkgdir/opt/$pkgname/.install/.backup"

  msg2 "Setting up environment variables and shell completion"
  install -Dm755 "$pkgdir/opt/$pkgname/completion.bash.inc" \
    "$pkgdir/etc/bash_completion.d/google-cloud-sdk"
  install -Dm755 "$srcdir/profile.sh" \
    "$pkgdir/etc/profile.d/google-cloud-sdk.sh"

  msg2 "Fixing python references for python2"
  grep -rl 'python' "$pkgdir/opt/$pkgname" | \
    xargs sed -i 's|#!.*python\b|#!/usr/bin/env python2|g'
  find "$pkgdir/opt/$pkgname/bin/" -maxdepth 1 -type f -exec \
    sed -i 's/CLOUDSDK_PYTHON=python\b/CLOUDSDK_PYTHON=python2/g' {} \;

  # These are only present in the direct numbered downloads we use
  msg2 "Installing man pages"
  mkdir -p "$pkgdir/usr/share"
  mv -f "$pkgdir/opt/$pkgname/help/man" "$pkgdir/usr/share/"
  chmod 0755 "$pkgdir/usr/share/man"
  chmod 0755 "$pkgdir/usr/share/man/man1"

  msg2 "Creating symlinks for binaries"
  mkdir -p "$pkgdir/usr/bin"
  find "$pkgdir/opt/$pkgname/bin" -maxdepth 1 -type f -printf \
    "/opt/$pkgname/bin/%f\n" | xargs ln -st "$pkgdir/usr/bin"
  # this conflicts with google-appengine-python
  rm -f "$pkgdir/usr/bin/dev_appserver.py"

  # The tarball is rather sloppy with it's file permissions
  msg2 "Fixing file permissions"
  chown -R root:root "$pkgdir"
  chmod -x "$pkgdir"/usr/share/man/man1/*
  find "$pkgdir/opt/$pkgname" -name "*.html" -print0 | xargs -0 chmod -x
  find "$pkgdir/opt/$pkgname" -name "*.json" -print0 | xargs -0 chmod -x
  find "$pkgdir/opt/$pkgname" -name "*_test.py" -print0 | xargs -0 chmod +x

}

