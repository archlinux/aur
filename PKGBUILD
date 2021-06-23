# Maintainer: kedap <kedap.dev@protonmail.com>

pkgname=apmpkg
pkgver=1.4.0
pkgrel=1
pkgdesc="Un administrador de paquetes universal para linux como modelo: PKGBUILD"
arch=('x86_64')
url="https://github.com/Kedap/apmpkg"
license=('Apache')
optdepends=('flatpak: for install dependencies'
  'snapd: for install dependencies'
  'npm: for install dependencies')
depends=('git' 'python-pip' 'python2-pip' 'wget' 'fakeroot' 'ruby-bundler' 'rsync')
makedepends=('cargo')
conflicts=('apmpkg-git-dev' 'apmpkg-dev')
source=("https://github.com/Kedap/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('919226f9937b4777b184dd5354f041507cb526aa7932a5bcff6af451d28a3d3c')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	mkdir -p ${pkgdir}/etc/apmpkg/iiabc
	cp -r src/iiabc/ ${pkgdir}/etc/apmpkg/
	mkdir -p ${pkgdir}/etc/apmpkg/paquetes
        install -Dm 644 "man/${pkgname}.1" -t ${pkgdir}/usr/share/man/man1
        install -Dm 644 "man/${pkgname}-en.1" -t ${pkgdir}/usr/share/man/man1
}
