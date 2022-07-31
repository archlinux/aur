# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Jan de Groot < jgc at archlinux dot org >

pkgname=xf86-video-mga
pkgver=2.0.1
pkgrel=2
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
sha512sums=('d9a0abedb71f3354788c2f91b770bc00c4118cfa2c99072dea82c28f025bc87bb88ebaf969962a8f0e97e1ff7938aebd9c682b730b0e07d5174dd9e8dc2cdfb6')
validpgpkeys=('F1111E4AAF984C9763795FFE4B25B5180522B8D9') # Shashank Sharma <contactshashanksharma@gmail.com>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}
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
