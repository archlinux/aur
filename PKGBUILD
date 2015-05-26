# Maintainer: Pablo Lezaeta <prflr88 (arroba) gmail (dot) com>
# Contributor: goten002 <goten002@gmail.com>
# Contributor: Peace4all

pkgbase=gstreamer-fluendo-mp3
provides=("gstreamer-oneplay-mp3")
pkgname=("gstreamer0.10-fluendo-mp3" "gst-fluendo-mp3")
pkgver=0.10.32
pkgrel=2
pkgdesc="GStreamer fluendo/Oneplay mp3 plugin"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gstreamer0.10-base')
makedepends=("pkgconfig" "gst-plugins-base-libs")
url="http://eu.fluendo.com/oneplay/oneplay-mp3-decoder/"
source=("http://core.fluendo.com/gstreamer/src/gst-fluendo-mp3/gst-fluendo-mp3-${pkgver}.tar.bz2")

prepare(){
  cd "${srcdir}"

  cp -rv "gst-fluendo-mp3-${pkgver}" "gst-fluendo-mp3-0.10"
  cp -rv "gst-fluendo-mp3-${pkgver}" "gst-fluendo-mp3-1.00"
}

build(){

# for gstreamer0.10
  cd "${srcdir}/gst-fluendo-mp3-0.10"

  sed -i -e "s|GST_VER_1_0|GST_VER_0_0|" \
  -e "s|gstreamer-1.0 >= 1.0.0|gstreamer-0.0 >= 0.0.0|" \
  $(find . -name 'configure')

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--libexecdir=/usr/lib/gstreamer-0.10 --sbindir=/usr/bin --bindir=/usr/bin \
	--with-gstreamer-api=0.10 --libdir=/usr/lib
  make

# for gstreamer1.0
  cd "$srcdir"/gst-fluendo-mp3-1.00

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--libexecdir=/usr/lib/gstreamer-1.0 --sbindir=/usr/bin --bindir=/usr/bin \
	--with-gstreamer-api=1.0 --libdir=/usr/lib
  make
}

package_gstreamer0.10-fluendo-mp3() {
	groups=("gstreamer0.10-plugins")
	replace=("gst0.10-fluendo-mp3" "gst0.10-oneplay-mp3" "gstreamer0.10-oneplay-mp3")
	provides=("gst0.10-fluendo-mp3" "gst0.10-oneplay-mp3" "gstreamer0.10-oneplay-mp3")
	conflicts=("gst0.10-fluendo-mp3" "gst0.10-oneplay-mp3" "gstreamer0.10-oneplay-mp3")

  cd "${srcdir}/gst-fluendo-mp3-0.10"

  make DESTDIR="${pkgdir}/" install sbindir=/usr/bin libexecdir=/usr/lib/gstreamer-0.10
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.gst0.10-fluendo"
}

package_gst-fluendo-mp3() {
	groups=("gst-plugins")
	replace=("gst-oneplay-mp3")
	provides=("gst-oneplay-mp3")
	conflict=("gst-oneplay-mp3")
	depends=("gst-plugins-base-libs")

  cd "${srcdir}/gst-fluendo-mp3-1.00"

  make DESTDIR="${pkgdir}/" install sbindir=/usr/bin libexecdir=/usr/lib/gstreamer-1.0
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.gst1.00-fluendo"
}

md5sums=('20ae57ed3a27a11555b2fc82ff3d333f')
