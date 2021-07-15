# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=ru-tts-git
pkgver=r1.e2732e9
pkgrel=1
pkgdesc="Compact and portable Russian speech synthesizer"
arch=('x86_64')
url="https://github.com/poretsky/ru_tts"
license=('MIT')
depends=('rulex')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/poretsky/ru_tts.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	make -C src prefix=/usr LFLAGS="$LDFLAGS"
}

package() {
	cd "${pkgname%-git}"
	make -C src prefix=/usr LFLAGS="$LDFLAGS" DESTDIR="$pkgdir/" install
	#not working with current sox.
	#install -vDm 755 ru_speak -t "${pkgdir}/usr/bin"
	install -vDm 644 debian/*.1 -t "${pkgdir}/usr/share/man/man1"
	install -vDm 644 debian/*.3 -t "${pkgdir}/usr/share/man/man3"
	install -vDm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
