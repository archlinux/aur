# Maintainer: Lea Seibert <mail@lea.moe>
# Contributor: FayBoy <ahmadyasinfikri at gmail dot com>
# Contributor: Ecmel Berk Canlıer <me@ecmelberk.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>


pkgname=glfw-wayland-minecraft-cursorfix
pkgdesc="A free, open source, portable framework for graphical application development (wayland, patched for Minecraft)"
pkgver=3.4
pkgrel=4
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
        "0005-Add-warning-about-being-an-unofficial-patch.patch"
        "0006-Avoid-error-on-startup.patch")
sha512sums=('39ad7a4521267fbebc35d2ff0c389a56236ead5fa4bdff33db113bd302f70f5f2869ff4e6db1979512e1542813292dff5a482e94dfce231750f0746c301ae9ed'
            '00a6731d5e22162bcfb4e9672b3f819f5331b05c96fb61ba62b65a676c4e36af6460f66fe9974f575fc6f48ae277ee67a7b5db98342963e65018ccdc11ac1f71'
            'e2a4640154fb5755f5f7fdcf3ca4ac1b8ccef9a61599b49344740dd36dc03a723b8e85ed850692db1ea1048982bd392c68ea8f4eeb8475219ee052f0a9581fc5'
            '1172c25e49e86541248f7ca79cd79548f6f86d844adba0fa584cf7f27bf8340ac03d99584e268761fc10f4a127ad6338650c4f1d35c0d9bb8b333c4d8ab9fc19'
            'c9c7ef3aad66d2f4d492440d32f9ddd3994acf36719ac9ec1ac11e545c875439ad3907620688341022cd0349bbf737ab9826699299cc52e0e39dbc65d8bc7f91'
            '75efcc19fc167890f5e27dff5143ca7cf5d1ac1ec95f140f6797ff205c3c5a1b6bbbeea20ee6a17512f342768e1a35c8b0885778a5d4cc232898c258e87b021e'
	        '409a40a8fdfd2e564d0af5042afeecebea597e2a357475248598ae2f0ff9a2a8bca217839ec30d45de0517d523e788206ce606c44101052b11d99b3bc4e38a9f')

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
      -DBUILD_SHARED_LIBS=ON
}

package() {
  cd "$srcdir/glfw-$pkgver"/build-wayland

  make DESTDIR=$pkgdir install

  cd ..
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
