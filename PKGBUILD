# Maintainer : Marcos Heredia <chelqo@gmail.com> (REALLY FROM OPENSUSE.ORG!!)
# Contributor: Javier "Phrodo_00" Aravena <phrodo.00@gmail.com>
# Contributor: Ivan Stojic <ivstojic@inet.hr>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

pkgname=gelemental
pkgver=1.2.0
pkgrel=7
pkgdesc="gElemental is a periodic table viewer that provides detailed information on the chemical elements"
arch=('i686' 'x86_64')
url="http://www.kdau.com/projects/gelemental/"
license=('GPL')
depends=('glibmm>=2.6' 'gtkmm>=2.6' 'perl-xml-parser')
makedepends=('bzip2' 'gettext' 'libtool' 'pkgconfig' 'intltool')
source=("https://api.opensuse.org/public/source/Education/gelemental/${pkgname}-${pkgver}.tar.bz2"
	"https://api.opensuse.org/public/source/Education/gelemental/${pkgname}-${pkgver}-gcc43.patch"
	"bigger_info.patch"
	"extras.diff"
	"main.diff"
	"widgets.diff")
md5sums=('efe3dc7b408c0c8c0b72fdd0733b2fb6'
	 'c91f3e04a4eb50301f09703d17c3c156'
	 '79d72afb573e0592270973860f79d210'
	 '9dd342fccb5573f920fdeca444c597d5'
	 'b2dc7e41ddc1087edaade3eaf4bc0319'
	 '81bbc3bca3d918c394092d25cb32b9d3')

build() {
  (
  cd ${srcdir}
    patch -p0 < ${srcdir}/${pkgname}-${pkgver}-gcc43.patch
    patch -p0 < ${srcdir}/bigger_info.patch
  cd ${srcdir}/${pkgname}-${pkgver}/libelemental/misc
    patch extras.cc ${srcdir}/extras.diff
    patch widgets.cc ${srcdir}/widgets.diff
  cd ${srcdir}/${pkgname}-${pkgver}/src
    patch main.cc ${srcdir}/main.diff
  )

  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  install -dpm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dpm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 AUTHORS COPYING.DATA ChangeLog INSTALL NEWS NEWS-GPeriodic README TODO TRANSLATORS "${pkgdir}/usr/share/doc/${pkgname}/"
}
