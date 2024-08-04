# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords
pkgver=0.3.13.3
pkgrel=1
pkgdesc='Crossword player and editor for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/crosswords'
license=(GPL3)
depends=(
	libadwaita
	'libipuz>=0.4.6.2'
	python-beautifulsoup4
	python-lxml
	python-puzpy
	python-regex
)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${url}/-/commit/b4689c2426cf24e944f8ae419ed23f1969745995.patch"
        "${url}/-/commit/3891aecfe538864cfc31561d21ccbcd007a94d2d.patch")
sha256sums=('7ca253695842c32e3355ebac3392b3070a747d8bb6eaf53e20c4096fa6c98a65'
            'c9b5ae319784b1c217b87775eab8d064d7ce4e7dcb37bbfa3a2081e76b2d231a'
            '98d13c615b0a2a953357c621163cea4602ce97a29f307cd6ea99334e4929a4f4')

prepare() {
    # Fix race condition in build with upstream patch
    cd "${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}/3891aecfe538864cfc31561d21ccbcd007a94d2d.patch"
    patch -p1 < "${srcdir}/b4689c2426cf24e944f8ae419ed23f1969745995.patch"
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
