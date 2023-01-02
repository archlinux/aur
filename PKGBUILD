# Maintainer: Ecmel Berk Canlıer <me@ecmelberk.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=glfw-wayland-minecraft-libdecoration
pkgdesc="A free, open source, portable framework for graphical application development (wayland, patched for Minecraft)"
pkgver=3.4.0+1.19
_pkggit=62e175ef9fae75335575964c845a302447c012c7
pkgrel=2
arch=('x86_64')
url="https://github.com/Admicos/minecraft-wayland"
license=('custom:ZLIB')
depends=('wayland' 'libxkbcommon' 'libgl')
conflicts=('glfw' 'glfw-wayland')
provides=("glfw=$pkgver")
makedepends=('mesa' 'cmake' 'doxygen' 'vulkan-headers' 'vulkan-icd-loader'
             'extra-cmake-modules' 'wayland-protocols' 'libxi' 'libxrandr'
             'libxcursor' 'libxkbcommon' 'libxinerama')
source=("https://github.com/glfw/glfw/archive/${_pkggit}.tar.gz"
        "0003-Don-t-crash-on-calls-to-focus-or-icon.patch"
        "0004-wayland-fix-broken-opengl-screenshots-on-mutter.patch"
        "0005-Add-warning-about-being-an-unofficial-patch.patch"
        "0007-Platform-Prefer-Wayland-over-X11.patch")
#        "0006-Don-t-crash-getting-scancode-name.patch")  # BROKEN
sha512sums=('c405f8fb4fd023a80664cfb9f31e3665cb0cd4b2c3c9028138d16f6d87d118927ca70de495f175876484ee6d993a64638828c6bc5ea1e0241a3dd79334352deb'
            '9c6f6e81de1feafeed93988207999d21754c93ff97c8c3158aee43f38b291f4589feaf83e42081445cf89c9209c86e56a0102fccf0d0a97740874dd88e84a746'
            '3c6d317c0c129effd6da48e183228da952a28286acd09abaec4d934031e39a5531d44306e4308c75b33b515113eb54942ca18885edd49b14254af24085de52da'
            'd8e8b704e19652bb30c7799300a1bd0db1619ad17e8e36a3ee51673933eba6a8c47dbd615f4a9a385021bdfaa1ddedb2f24e8c05b670ef5278c71d217e91146e'
            'c524857950180090fd774c5650a8467357e91eea0d6bef49bd28f2ef52981767f28f3dbb1649f98e25188e56bfa41855aca9bf99e335111c9557ff8e069588e7')
#            'b35562f1a65ede074e2b1c9caf934062488d391912a41da1ebbc328d2e3500cea31882a9228b9dfad357e571265825aabcfebb3c74bce077ed6e9752c7f865f5')

prepare() {
  cd "$srcdir/glfw-$_pkggit"
  rm -rf build-wayland || true
  mkdir build-wayland

  for patch in "$srcdir/00"*.patch; do
    echo "Applying patch $patch"
    patch -p1 < "$patch"
  done
}

build() {
  cd "$srcdir/glfw-$_pkggit/build-wayland"

  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DGLFW_USE_WAYLAND=ON
}

package() {
  cd "$srcdir/glfw-$_pkggit"/build-wayland

  make DESTDIR=$pkgdir install

  cd ..
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
