# Maintainer: EncryptedCicada <me@varnit.com>
# Maintainer: Ecmel Berk Canlıer <me@ecmelberk.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=glfw-wayland-minecraft-libdecoration
pkgdesc="A free, open source, portable framework for graphical application development (wayland, patched for Minecraft and Gnome)"
pkgver=3.4.0
_pkggit=87d5646f5d2bad0562744501633bf8105f59c193
pkgrel=1
arch=('x86_64')
url="https://github.com/EncryptedCicada/minecraft-wayland"
license=('custom:ZLIB')
depends=('wayland' 'libxkbcommon' 'libgl' 'libdecor')
conflicts=('glfw' 'glfw-wayland')
provides=("glfw=$pkgver")
makedepends=('mesa' 'cmake' 'doxygen' 'vulkan-headers' 'vulkan-icd-loader'
             'extra-cmake-modules' 'wayland-protocols' 'libxi' 'libxrandr'
             'libxcursor' 'libxkbcommon' 'libxinerama')
source=("https://github.com/glfw/glfw/archive/${_pkggit}.tar.gz"
        "0001-libdecoration-support.patch"
        "0002-set-O_NONBLOCK-on-repeat-timerfd.patch"
        "0003-wayland-don-t-crash-app-on-api-calls-to-window-focus.patch"
        "0004-fix-broken-opengl-screenshots-on-mutter.patch"
        "0005-don-t-crash-on-get-scancode-name.patch")
sha256sums=('7b8c990cfb039110d38c7f5bb21948c402933be3f93f333fe7dcda3deaf72aa4'
            'c163b4a0a6496d758bc656203c23151015683754a6b5c2fc4944df7296d6b5af'
            '5cd74a83dc7824c7696c1534f880b7a4a0992bb6dba6e4531ad1c040541f1d30'
            'a442f8c7e40fb09775f922b95402108b366114874ee96e370c29e5f8500a02b7'
            '27aea70b07df2d46ac7469c129d28d695eff1ec9492489aa7b2558dd780ebdf0'
            '16a2410511d75f00902ab1869942a80d85261f8390a97be946f82662891351e5')

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
      -DGLFW_USE_WAYLAND=ON \
      -DGLFW_USE_LIBDECOR=ON
}

package() {
  cd "$srcdir/glfw-$_pkggit"/build-wayland

  make DESTDIR=$pkgdir install

  cd ..
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
