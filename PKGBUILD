# Maintainer: Lea Seibert <mail@lea.moe>
# Contributor: FayBoy <ahmadyasinfikri at gmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>


pkgname=glfw-wayland-minecraft-cursorfix
pkgdesc="A free, open source, portable framework for graphical application development (wayland, patched for Minecraft)"
pkgver=3.4
pkgrel=1
arch=('x86_64')
url="https://github.com/BoyOrigin/glfw-wayland"
license=('custom:ZLIB')
depends=('wayland' 'libxkbcommon' 'libgl')
conflicts=('glfw' 'glfw-wayland' 'glfw-wayland-minecraft-libdecoration')
provides=("glfw=$pkgver")
makedepends=('mesa' 'cmake' 'doxygen' 'vulkan-headers' 'vulkan-icd-loader'
             'extra-cmake-modules' 'wayland-protocols' 'libxi' 'libxrandr'
             'libxcursor' 'libxinerama')
source=("https://github.com/glfw/glfw/archive/${pkgver}.tar.gz"
        "0001-Key-Modifiers-Fix.patch"
        "0002-Fix-duplicate-pointer-scroll-events.patch"
        "0003-Implement-glfwSetCursorPosWayland.patch"
        "0004-Fix-Window-size-on-unset-fullscreen.patch"
        "0005-Add-warning-about-being-an-unofficial-patch.patch")
sha512sums=('39ad7a4521267fbebc35d2ff0c389a56236ead5fa4bdff33db113bd302f70f5f2869ff4e6db1979512e1542813292dff5a482e94dfce231750f0746c301ae9ed'
            '00a6731d5e22162bcfb4e9672b3f819f5331b05c96fb61ba62b65a676c4e36af6460f66fe9974f575fc6f48ae277ee67a7b5db98342963e65018ccdc11ac1f71'
            'e2a4640154fb5755f5f7fdcf3ca4ac1b8ccef9a61599b49344740dd36dc03a723b8e85ed850692db1ea1048982bd392c68ea8f4eeb8475219ee052f0a9581fc5'
            'baa4ed5c7e8213921bbebe9736aecc427cfbd733bb86b09b8dd5ed8c7d9e6c49ceb12f578050bc7afe84164ef8f49633cec82e366bcba6eef5bce2eef7b3fb1a'
            'c9c7ef3aad66d2f4d492440d32f9ddd3994acf36719ac9ec1ac11e545c875439ad3907620688341022cd0349bbf737ab9826699299cc52e0e39dbc65d8bc7f91'
            '75efcc19fc167890f5e27dff5143ca7cf5d1ac1ec95f140f6797ff205c3c5a1b6bbbeea20ee6a17512f342768e1a35c8b0885778a5d4cc232898c258e87b021e')

prepare() {
  cd "$srcdir/glfw-$pkgver"
  rm -rf build-wayland || true
  mkdir build-wayland

  for patch in "$srcdir/00"*.patch; do
    echo "Applying patch $patch"
    patch -p1 < "$patch"
  done
}

build() {
  cd "$srcdir/glfw-$pkgver/build-wayland"

  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -D GLFW_BUILD_WAYLAND=ON \
      -D GLFW_BUILD_X11=OFF
}

package() {
  cd "$srcdir/glfw-$pkgver"/build-wayland

  make DESTDIR=$pkgdir install

  cd ..
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
