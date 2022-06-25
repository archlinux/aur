# Maintainer: kedap <kedap.dev@protonmail.com>

pkgname=apmpkg
pkgver=1.5.1
pkgrel=2
pkgdesc="Un administrador de paquetes universal para linux como modelo: PKGBUILD"
arch=('any')
url="https://github.com/Kedap/apmpkg"
license=('Apache')
optdepends=('flatpak: for install dependencies'
  'snapd: for install dependencies'
	'yarn: alternative for npm')
depends=('git' 'python-pip' 'wget' 'fakeroot' 'ruby-bundler' 'npm')
makedepends=('cargo')
conflicts=('apmpkg-git-dev' 'apmpkg-dev')
source=("https://github.com/Kedap/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('60d9462105fe3ee382c9bbd3ce9055eed7b2958c7337ed1584d07fb9a439e2f7')

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
	install -Dm 644 "completions/_${pkgname}" -t ${pkgdir}/usr/share/zsh/site-functions/
	install -Dm 644 "completions/${pkgname}.bash-completion" -t ${pkgdir}/usr/share/bash-completion/completions/
	install -Dm 644 "completions/${pkgname}.fish" -t ${pkgdir}/usr/share/fish/vendor_completions.d/
}
