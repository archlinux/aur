# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gtg
pkgver=0.5
pkgrel=4
pkgdesc='Personal GTD like organizer for the GNOME desktop environment'
url=https://wiki.gnome.org/Apps/GTG
arch=(any)
license=(GPL)
depends=(hicolor-icon-theme python-cairo python-dbus python-gobject
         'python-liblarch>=3.1' python-lxml)
checkdepends=(python-mock python-nose)
makedepends=(meson ninja)
optdepends=('pdftk: for the export and print plugin'
            'python-cheetah3: for the export and print plugin'
			'texlive-bin: for pdflatex, needed by the export and print plugin'
			'texlive-core: for pdfjam, needed by the export and print plugin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getting-things-gnome/gtg/archive/refs/tags/v${pkgver}.tar.gz"
        fix-meson.patch)
b2sums=('e724cbd015a6f0b6fee62c52283b56244490efb7df4e57b2e30745f58fbc41442b008f5c81b53cfd001f04a92ff53a14e2117d6c12d0d5a35fe49158b5f736fa'
        '888e266a62160a2e5812305d3912209615b3cfea9ea6f8f0889972419bb7648a91b7c8b9093debfe1453df1bc5f2553e4ca0a08af95e6bb3728bfad81f132872')

prepare ()
{
	patch -p0 < "${srcdir}/fix-meson.patch"
}

build ()
{
	rm -rf build
	arch-meson -Dprofile=default build "${pkgname}-${pkgver}"
	ninja -C build
}

check ()
{
	cd "${pkgname}-${pkgver}"
	./run-tests
}

package ()
{
	DESTDIR="${pkgdir}" ninja -C build install
}
