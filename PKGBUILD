# Maintainer:  vantu5z <vantu5z@mail.ru>
# Maintainer:  Matthew Monaco <net 0x01b dgbaley27>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgname=xf86-input-synaptics
pkgname=$_pkgname-led
pkgver=1.9.2
pkgrel=1
pkgdesc="Synaptics driver for notebook touchpads (with LED disable support)"
arch=(i686 x86_64)
license=(custom)
url="http://xorg.freedesktop.org/"
depends=('libxtst' 'libevdev' 'synaptics-led')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=24.4' 'libxi' 'libx11')
conflicts=('xorg-server<21.1.2' 'X-ABI-XINPUT_VERSION<24' 'X-ABI-XINPUT_VERSION>=25')
replaces=('synaptics')
provides=('synaptics' "$_pkgname")
conflicts=('synaptics' "$_pkgname")
groups=('xorg-drivers')
options=(!libtool)
source=(
	http://xorg.freedesktop.org/releases/individual/driver/${_pkgname}-${pkgver}.tar.xz
	led_support.patch
)
md5sums=('3b95e7baf4428b114e9910f999e96601'
         '175a3a6df98d441d63b1fa2ebd4c90ca')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # apply patch
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
  install -m644 "conf/70-synaptics.conf" "${pkgdir}/etc/X11/xorg.conf.d/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
