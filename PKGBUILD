# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=kosuzu-git
pkgver=r3.r0.8253ee6
pkgrel=2
pkgdesc="a danbooru downloader and viewer that support translation notes"
arch=(x86_64)
url="https://github.com/nostrenz/kosuzu"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}" "git+https://github.com/stachenov/quazip" "git+https://github.com/itay-grudev/SingleApplication" "kosuzu.png" "kosuzu.desktop")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule init
  git config submodule.lib/SingleApplication.url "$srcdir/SingleApplication"
  git config submodule.lib/QuaZIP.url "$srcdir/quazip"
  git -c protocol.file.allow=always submodule update
}

build() {
cd "$srcdir/${pkgname%-git}"
qmake
make
}

package() {
    install -Dm755 "kosuzu.png" "$pkgdir/usr/share/pixmaps/kosuzu.png"
    install -Dm755 "kosuzu.desktop" "$pkgdir/usr/share/applications/kosuzu.desktop"
	cd "$srcdir/${pkgname%-git}"
	install -dm777 "$pkgdir/opt/kosuzu-git/"
	install -Dm755 "Kosuzu" "$pkgdir/opt/kosuzu-git/kosuzu"
	install -d "${pkgdir}/usr/bin"
 	ln -s "/opt/kosuzu-git/kosuzu" "${pkgdir}/usr/bin/kosuzu"
}
