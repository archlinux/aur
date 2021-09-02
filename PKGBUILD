# Maintainer: Nicolas FORMICHELLA <stigpro@outlook.fr>
pkgname=n-link-git 
_pkgname=n-link
pkgver=0.1.6.r3.g5ce4d8a
pkgrel=1
pkgdesc="Free, cross-platform, CX-II compatible computer linking program for the TI-Nspire."
arch=("x86_64")
url="https://lights0123.com/n-link/"
license=('GPL3')
groups=()
depends=("nodejs-lts-fermium" "webkit2gtk" "squashfs-tools")
makedepends=('git' 'rust')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install="${_pkgname}.install"
source=(git+"https://github.com/lights0123/${_pkgname}.git" 
        "69-${_pkgname}.rules" 
        "only-build-deb.patch")
noextract=()
md5sums=('SKIP'
         '2c9e778637586091f4d5cfd74b5ee6a5'
         '1a69d6a98b8d9e8de295750fec0b6475')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' 
}

prepare() {
	cd "$srcdir/${pkgname%-git}/desktop/src-tauri"
        patch -uN tauri.conf.json < ${srcdir}/only-build-deb.patch
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
        cd ..
        yarn install
}

build() {
	cd "$srcdir/${pkgname%-git}/desktop"
	yarn tauri:build
}

package() {
	cd "$srcdir/${pkgname%-git}/desktop/src-tauri/target/release/bundle/deb/"
	find . -type f -name *.deb -print0 | xargs -0 -I '{}' ar p {} data.tar.gz | bsdtar -C "${pkgdir}" -xf -
        find "${pkgdir}" -type d -exec chmod 755 {} \;
        mkdir -p "${pkgdir}/etc/udev/rules.d/"
        install -Dm644 "${srcdir}/69-${_pkgname}.rules" "${pkgdir}/etc/udev/rules.d/69-${pkgname}.rules"
}
