# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=sasl-xoauth2-git
pkgver=r203.47ff232
pkgrel=2
pkgdesc="SASL plugin that enables client-side use of OAuth 2.0"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
arch=('x86_64')
url="https://github.com/tarickb/${pkgname%-git}"
license=('Apache')
depends=('libsasl' 'python-msal')
makedepends=('git' 'cmake>=3')
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$srcdir/${pkgname%-git}" \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_SYSCONFDIR='/etc' \
		-DCMAKE_BUILD_TYPE='None'
	cmake --build build
}

check() {
	cd build
	ctest --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "$srcdir/${pkgname%-git}"/COPYING
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "$srcdir/${pkgname%-git}"/README.md
}
