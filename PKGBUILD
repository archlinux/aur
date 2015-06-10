# Contributor: alphazo <alphazo@gmail.com>
# This version fetches and install master branch from Git repo.
pkgname=sshuttle-git
pkgver=20150104
pkgrel=1
pkgdesc="Transparent proxy server that works as a poor man's VPN. Forwards all TCP packets over ssh (and even DNS requests when using --dns option). Doesn't require admin privileges on the server side."
arch=('any')
url="https://github.com/apenwarr/sshuttle"
license=('GPL')
groups=()
depends=('python2' 'iptables')
makedepends=('git')
optdepends=()
provides=()
conflicts=('sshuttle')
replaces=()
backup=()
options=()

source=(arch-install.patch)
md5sums=('15ed72e2b68dd07ef97abfdcb828d188')


_gitroot="git://github.com/apenwarr/sshuttle.git"
_gitname="sshuttle"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Patch launcher with files location (/usr/share/sshuttle)
  patch -p1 -i "${srcdir}/arch-install.patch"

  #
  # BUILD HERE
  #
  # Original build
  #install -Dm755 $srcdir/$_gitname-build/sshuttle $pkgdir/usr/bin/sshuttle || return 1
  #mkdir -p $pkgdir/usr/share/sshuttle 
  #cp -r $srcdir/$_gitname-build/* $pkgdir/usr/share/sshuttle || return 1
  #

  # Modification proposed by bladud
  cd "$srcdir/$_gitname-build/Documentation"
  sed -i 's/python/python2/' md2man.py
  cd ..
  make  #Make the manpage
  cd "$srcdir/$_gitname-build"
  install -Dm755 $srcdir/$_gitname-build/sshuttle $pkgdir/usr/bin/sshuttle || return 1
  mkdir -p $pkgdir/usr/share/sshuttle 

  cp $srcdir/$_gitname-build/LICENSE $pkgdir/usr/share/sshuttle || return 1
  cp $srcdir/$_gitname-build/README.md $pkgdir/usr/share/sshuttle || return 1
  cp $srcdir/$_gitname-build/Documentation/sshuttle.md $pkgdir/usr/share/sshuttle || return 1
  cp $srcdir/$_gitname-build/*.py $pkgdir/usr/share/sshuttle || return 1
  mkdir $pkgdir/usr/share/sshuttle/version
  mkdir $pkgdir/usr/share/sshuttle/compat
  cp -R $srcdir/$_gitname-build/version/*.py $pkgdir/usr/share/sshuttle/version || return 1
  cp -R $srcdir/$_gitname-build/compat/*.py $pkgdir/usr/share/sshuttle/compat || return 1
}
