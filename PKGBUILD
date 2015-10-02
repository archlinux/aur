# Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Geoff Hill <geoff@geoffhill.org>
# Contributor: Sebastien Bariteau <numkem@numkem.org>
# Contributor: Justin Dray <justin@dray.be>

pkgname="google-cloud-sdk"
pkgver=0.9.80
pkgrel=1
pkgdesc="Contains tools and libraries that enable you to easily create and manage resources on Google Cloud Platform"
url="https://developers.google.com/cloud/sdk/"
license=("Apache")
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz"
        "profile.sh")
depends=('python2')
makedepends=('python2')
optdepends=('go: for Go version of App Engine'
            'java-environment: for Java version of App Engine'
            'php: for PHP version of App Engine')
md5sums=('f8a2fabb13e9bd02c7f8b34eb7a4c908'
         'd7c7ccb7d32a871d67288228f5b4cd94')
options=('!strip' 'staticlibs')

pkgver() {
	grep '"version"' $srcdir/$pkgname/lib/googlecloudsdk/core/config.json | sed "s/.*:.*\"\(.*\)\".*/\1/"
}

package() {
	mkdir "$pkgdir/opt"
	cp -r "$srcdir"/"$pkgname" "$pkgdir"/opt

	msg2 "Running bootstrapping script"
	python2 "$pkgdir"/opt/google-cloud-sdk/bin/bootstrapping/install.py \
		--usage-reporting false --disable-installation-options \
		--path-update false --bash-completion true --rc-path="$srcdir"/fake.bashrc
	install -Dm755 "$pkgdir"/opt/google-cloud-sdk/completion.bash.inc "$pkgdir"/etc/bash_completion.d/google-cloud-sdk
	install -Dm755 "$srcdir"/profile.sh "$pkgdir"/etc/profile.d/google-cloud-sdk.sh

	msg2 "Fixing python references..."
	grep -rl 'python' "$pkgdir/opt/$pkgname" | xargs sed -i 's|#!.*python\b|#!/usr/bin/env python2|g'
	find "$pkgdir/opt/google-cloud-sdk/bin/" -maxdepth 1 -type f -exec sed -i 's/CLOUDSDK_PYTHON=python/CLOUDSDK_PYTHON=python2/g' {} \;

	# These were removed from 0.9.73 -> 0.9.74
	#msg2 "Installing man pages"
	#mkdir -p "$pkgdir/usr/share"
	#mv "$pkgdir"/opt/google-cloud-sdk/help/man "$pkgdir"/usr/share/

	msg2 "Creating symlinks for binaries"
	mkdir -p "$pkgdir/usr/bin"
	find "$pkgdir/opt/$pkgname/bin" -maxdepth 1 -type f -printf "/opt/$pkgname/bin/%f\n" | xargs ln -st "$pkgdir/usr/bin"

	msg2 "Cleaning files and folders"
	rm -rf "$pkgdir/opt/google-cloud-sdk/.install/"

	msg2 "Fixing files permissions"
	chown root:root -R "$pkgdir"
}
