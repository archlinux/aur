# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Jason A. Donenfeld <Jason@zx2c4.com>

pkgname=wireguard-tools-git
_pkgname=wireguard-tools
pkgver=r467.139aac5
pkgrel=1
pkgdesc='next generation secure network tunnel - tools for configuration'
arch=('x86_64')
url='https://www.wireguard.com/'
license=('GPL')
depends=('bash')
makedepends=('git')
conflicts=("$_pkgname")
optdepends=('openresolv: for DNS functionality'
            'sudo: elevate privileges')
source=(git+https://github.com/WireGuard/wireguard-tools.git)
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    find contrib/ -name '.gitignore' -delete
}

build() {
    cd "$_pkgname"
    make -C src/
}

package() {
    cd "$_pkgname"

	make -C src/ \
		DESTDIR="${pkgdir}/" \
		WITH_BASHCOMPLETION=yes \
                WITH_WGQUICK=yes \
                WITH_SYSTEMDUNITS=yes \
                install

	install -d -m0755 "${pkgdir}"/usr/share/${_pkgname}/
	cp -r contrib/ "${pkgdir}"/usr/share/${_pkgname}/examples/
}
