# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=xlibre-video-amdgpu
_pkgname=xf86-video-amdgpu
pkgver=25.1.1
pkgrel=4
pkgdesc="XLibre amdgpu video driver"
arch=('x86_64')
url='https://github.com/X11Libre/xf86-video-amdgpu'
license=('MIT')
depends=('systemd-libs' 'mesa' 'libdrm' 'glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'systemd' 'X-ABI-VIDEODRV_VERSION=28.0' 'meson')
provides=('xf86-video-amdgpu')
conflicts=('xf86-video-amdgpu' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('40fca3a2f1a41aeedcefaff5fbc6f9556ee94b35844115cf595f99e98f83f33ec8184ebc95f811aabaf5cb798d229fb12dac7592dba66a112bf1f875972f7b07')

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  arch-meson $_pkgname-xlibre-$_pkgname-$pkgver build \
    -D glamor=enabled

  # Print config
  meson configure build

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dvm644 $_pkgname-xlibre-$_pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
