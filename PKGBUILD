# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=grub-customizer
pkgver=5.1.0
pkgrel=3
pkgdesc="A graphical grub2 settings manager"
url="https://launchpad.net/grub-customizer"
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs' 'glibc' 'grub' 'gtkmm3' 'openssl')
makedepends=('atkmm' 'cairomm' 'cmake' 'glib2' 'glibmm' 'gtk3' 'libarchive'
'libsigc++' 'pangomm')
optdepends=(
  'hwinfo: for additional hardware information'
  'polkit: for authorization'
  'xorg-xhost: for authorization on xorg-xwayland'
)
backup=("etc/${pkgname}/grub.cfg")
source=("https://launchpad.net/${pkgname}/${pkgver%.*}/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz"
        'grub.cfg')
sha512sums=('d79c7996afd8486483d4460432207dc19315d7377dcfd2fd6a4594e64c6750bbae36f96c395c4a9748d0ff43c6095399d822fc6a23beedbc8769802818dfa11f'
            '40156b6546a4d7e8abbef2ab3dece0481a4a2ca276b9a15c5a7bf7e3b11004335b6a747be391b5c1accb35c9e9e3bc628e571cd245e5f2980e5ecd6a3ceb24f5')
b2sums=('3d32db2523e70968786bd2d6b620ee3a42a312d0b892e38121b8869a155c23aa5ead9219e56e0a84109c0bcf84a4c1f00130a3565c8d28c77b1e23bbf669a2c4'
        '549df423c3e3bb4f59632a1122bb247ab0e3fb93de16053f66e44507e84c0638200634df18a92b1161e5c2c6e39ee8c0829b9fdbc422e1531ddba02fc5fc0731')

build(){
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package(){
  depends+=(libarchive.so libatkmm-1.6.so libcairomm-1.0.so libgdk-3.so
  libglib-2.0.so libglibmm-2.4.so libgtkmm-3.0.so libpangomm-1.4.so
  libsigc-2.0.so)

  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" -C build
  # configuration
  install -vDm 644 "../grub.cfg" -t "${pkgdir}/etc/${pkgname}/"
  # additional documentation
  install -vDm 644 {changelog,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
# vim:set ts=2 sw=2 et:
