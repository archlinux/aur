# Maintainer:  vantu5z <vantu5z@mail.ru>
# Maintainer:  Matthew Monaco <net 0x01b dgbaley27>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgname=xf86-input-synaptics
pkgname=$_pkgname-led
pkgver=1.7.1
pkgrel=4
pkgdesc="Synaptics driver for notebook touchpads (with LED disable support)"
arch=(i686 x86_64)
license=(custom)
url="http://xorg.freedesktop.org/"
depends=(libxtst mtdev synaptics-led)
makedepends=(xorg-server-devel libxi libx11 resourceproto)
replaces=(synaptics)
provides=(synaptics "$_pkgname")
conflicts=(synaptics "$_pkgname")
groups=(xorg-drivers xorg)
options=(!libtool)
source=(
	http://xorg.freedesktop.org/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2
	0001-Add-the-embedded-LED-support.patch
	0002-Add-tap-on-LED-feature-support.patch
	0003-Add-LED-debugging-statements.patch
)
md5sums=('6505de717972b6a24b8eb13e69eb996c'
         '8ebf3e1609786c9699ca17fff450770e'
         '7312702cb1f7acf70a18e4ff2862f847'
         'd48ab540ea8fd2cf7f86c38e52116b3f')
backup=(
	etc/X11/xorg.conf.d/50-synaptics.conf
)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for p in ../*.patch; do
    msg2 "Applying patch: $p"
    patch -p1 -i "$p"
  done
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"
  install -m644 "conf/50-synaptics.conf" "${pkgdir}/etc/X11/xorg.conf.d/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/usr/share/X11"
}
