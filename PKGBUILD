# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: orumin <dev@orum.in>

_basename=libinput
pkgname="lib32-$_basename"
pkgver=1.12.0
pkgrel=2
pkgdesc="Input device management and event handling library (32-bit)"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
depends=('lib32-mtdev' 'lib32-systemd' 'lib32-libevdev' 'lib32-libwacom' "$_basename")
# upstream doesn't recommend building docs
makedepends=('lib32-gtk3' 'meson') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
source=(https://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz{,.sig}
        0001_Elan_Touchpads_quirks.patch)
sha512sums=('4aee877785f9ac080e4f8ee20f3643bc4f3ddbc568aca6c363a962f8c8f76b8db7dc113c8167092f0277d112346a85b9a7e7c3c3f227ed243aaba32c9092c924'
            'SKIP'
            '8d603a04e1ef737f8627d75d2da97d5cee7607e2604a31105496a6ea2db632d40d04a567ce22ac2cd4765a2fd1ec4945032bad0b8c3b9ed4a9bd333886976570')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>0

prepare() {
  cd "${srcdir}/${_basename}-${pkgver}"
  # FS#60072
  patch -Np1 -i "${srcdir}/0001_Elan_Touchpads_quirks.patch"
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson $_basename-$pkgver build \
    --libdir=/usr/lib32 \
    -Dudev-dir=/usr/lib/udev \
    -Dtests=false \
    -Ddocumentation=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  rm -rf ${pkgdir}/usr/{bin,lib,share,include}
}
