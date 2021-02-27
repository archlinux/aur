# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=arch-man-bot-git
pkgver=r8.6b20f92
pkgrel=1
pkgdesc="Telegram bot for in-line search of man-pages"
arch=('any')
url="https://t.me/archmanbot"
license=('GPL')
depends=('python-pytelegrambotapi')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=${pkgname%-git}.install
source=("${pkgname%-git}::git+https://github.com/alcortazzo/arch-man-bot.git"
        "systemd-credential-pass.patch"
        "${pkgname%-git}.service")
sha512sums=('SKIP'
            'fbda678674f8ad212151f327d6b827844a61d0c103e8f14138d674464acb812bc4da435796f65c036c87fada9008e74aa0d6c3c417fb70b83897587f7d183928'
            '33c98561c766ca7cbe524b148e04e17061b3966ed99e991e5178958149adc817d2d83a62d87b673343fd972da81d5e5aaf900b747eaef4c1e808d782584294a9')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	patch -p1 -i "$srcdir/systemd-credential-pass.patch"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -vDm 775 "main.py" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -vDm 644 "../${pkgname%-git}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service"
}
