# Maintainer: Nico Ramlow <nico@nycode.de>
pkgname=mcserv-git
pkgver=r78.62306b0
pkgrel=1
pkgdesc="CLI utility to manage MC server installations."
arch=('x86_64')
url="https://github.com/DRSchlaubi/mcserv"
license=('GPL3')
makedepends=('git' 'java-runtime' 'dart')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/DRSchlaubi/mcserv')
noextract=()
options=('!strip')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
	dartSdk=$(readlink -f $(which dart))
	echo "dart.sdk=${dartSdk%/bin/dart}" > local.properties
	./gradlew dartPubGet
}

build() {
	cd "${pkgname%-git}"
	gitsha=$(git rev-parse --short HEAD)
	cd "$srcdir/${pkgname%-git}"
	GITHUB_SHA="$gitsha" ./gradlew clean copyReleasePackage
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "${pkgdir}/opt/${pkgname%-git}" "${pkgdir}/usr/bin"
	cp $srcdir/${pkgname%-git}/build/package/release/* ${pkgdir}/opt/${pkgname%-git}/
	chmod 755 "${pkgdir}/opt/${pkgname%-git}/mcserv"
	ln -s "/opt/${pkgname%-git}/mcserv" "${pkgdir}/usr/bin/${pkgname%-git}"
}
