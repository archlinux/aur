# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords
pkgver=0.3.12
pkgrel=1
pkgdesc='Crossword player and editor for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/crosswords'
license=(GPL3)
depends=(
	libadwaita
	libipuz
	python-beautifulsoup4
	python-lxml
	python-puzpy
	python-regex
)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/crosswords-${pkgver}.tar.gz"
        "${url}/-/commit/aec030cb9b0d98476e338c25b60662db008c038f.diff")
b2sums=('cce2909650497b56aacd14a62f20e48ba25f5d04316c5626e8cd0edf9f9fbddd4af87114fe58abc2185c41b33127fa4b70f55771bcd34db4e6f1a30bf8015c1a'
        '4fe595905dc326d7cc6d52b4e1ced5f987c27259ffb5fd32fc6ffe6847a935f9190b5ed410307ccb6d6cd1a96595c46e654122846b11215a51b7c84c131f15b2')

prepare() {
        cd "$pkgname-$pkgver"
        # patch to fix crash - https://gitlab.gnome.org/jrb/crosswords/-/issues/193
        patch -p1 < ../aec030cb9b0d98476e338c25b60662db008c038f.diff
}

build() {
	arch-meson ${pkgname}-${pkgver} build -Ddevelopment=false
	meson compile -C build
}

# requires creation of runtime dbus files, doesn't work in container / rua
#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	meson install -C build --destdir "${pkgdir}"
}
