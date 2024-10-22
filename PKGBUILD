# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Jan de Groot < jgc at archlinux dot org >

pkgname=xf86-video-mga
pkgver=2.1.0
pkgrel=1
pkgdesc="X.org mga video driver"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel')
optdepends=('mga-dri: DRI1 support')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=26')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.xz)
b2sums=('8314bf3ceb0b41bc9e863c0f640f818e0e6b86c95f57cea95311ba46bcff14ea2ea1d93961b700a7722cb90ebec82ab80b5bbf36c64cafac1940837e08f19080')
validpgpkeys=('F1111E4AAF984C9763795FFE4B25B5180522B8D9') # Shashank Sharma <contactshashanksharma@gmail.com>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
