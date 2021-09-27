# Maintainer: benlypan <benlypan@gmail.com>

pkgname=xf86-input-libinput-no-hires-scroll
pkgver=1.2.0
pkgrel=1
pkgdesc="Generic input driver for the X.Org server based on libinput with disabling high resolution scroll"
arch=('x86_64')
license=('custom:MIT')
url="http://xorg.freedesktop.org/"
depends=('libinput')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=24.1' 'libxi' 'libx11' 'xorgproto')
provides=('xf86-input-libinput')
conflicts=('xorg-server<1.19.0' 'X-ABI-XINPUT_VERSION<24' 'X-ABI-XINPUT_VERSION>=25' 'xf86-input-libinput')
groups=('xorg-drivers')
source=(https://xorg.freedesktop.org/releases/individual/driver/xf86-input-libinput-${pkgver}.tar.bz2)
sha512sums=('ebff9490d33fd7495df2e03203060a76b3274f0e638bc92f3d95257fac57cdb9dac308e90e54006fe9522b6de3b1f1c38fd5f0b0b75b7051e5422290f43de52d')

build() {
  cd xf86-input-libinput-${pkgver}
  ./configure --prefix=/usr \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  sed -i -e 's/HAVE_LIBINPUT_AXIS_VALUE_V120 1/HAVE_LIBINPUT_AXIS_VALUE_V120 0/' config.h
  make
}

package() {
  cd xf86-input-libinput-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xf86-input-libinput"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xf86-input-libinput/"
}
