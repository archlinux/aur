# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

# c.f. Debian rules and control files here:
# https://tracker.debian.org/pkg/praat

pkgname=praat-git
pkgver=6.4.08
pkgrel=1
pkgdesc='A speech analysis tool used for doing phonetics by computer'
arch=(x86_64 i686 aarch64)
url=https://www.praat.org
license=(GPL)
depends=(alsa-lib
         gtk3
         jack
         libpulse
         ttf-charis-sil
         ttf-doulos-sil)
makedepends=(git)
optdepends=(ttf-sil-fonts)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/${pkgname%-git}/${pkgname%-git}.git"
        "${pkgname%-git}.1"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.svg"
        "${pkgname%-git}.xpm")
sha256sums=('SKIP'
            '21ee03cae45be634c57c167c2dfbdfd9d9b7feadb98e0124413d9426c199e81c'
            '94720aedc8e9c9e9d53b3230d79ccaae551b5bc5e6986528664311d55f3cce5a'
            'db6c7568f6e13b4ce7c37bd9fcf289832867f79ba7d7fc48c4f13f0045ad98f1'
            '07abf61475f22f83f0514a8fba1ec7bd3821d2b7f35b1215c1f3e1feb947d74b')

pkgver() {
	cd "${pkgname%-git}"
	git describe --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	cp makefiles/makefile.defs.linux.pulse makefile.defs
}

build() {
	cd "${pkgname%-git}"
	make
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 -t "$pkgdir/usr/bin" "${pkgname%-git}"
	install -Dm644 -t "$pkgdir/usr/share/applications/" "../${pkgname%-git}.desktop"
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "../${pkgname%-git}.svg"
	install -Dm644 -t "$pkgdir/usr/share/pixmaps/" "../${pkgname%-git}.xpm"
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" "../${pkgname%-git}.1"
}
