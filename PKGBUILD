# Contributor: Eric Fung <loseurmarbles [at] gmail [dot] com>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=dbus-cpp
pkgdesc='A header-only dbus-binding leveraging C++-11'
pkgver=5.0.1
pkgrel=1
url='https://gitlab.com/ubports/core/lib-cpp/dbus-cpp'
arch=('x86_64' 'i686')
license=('LGPL3')
groups=('lib-cpp')
depends=('dbus' 'libxml2' 'process-cpp')
makedepends=('cmake' 'boost')
source=('https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/dbus-cpp/5.0.1-4/dbus-cpp_5.0.1.orig.tar.gz'
        'https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/dbus-cpp/5.0.1-4/dbus-cpp_5.0.1-4.debian.tar.xz')
sha256sums=('37f0391cad90f419db37c7c93c2726d832ef6bf29c420a57d6d42cb1f9d42e22'
            '96067d7efe657bab84eb127f05a89d700e218583ea4982d9d021d1ea6baea141')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Apply debian patches and don't build tests
  patch -p1 < ../debian/patches/dont-build-with-werror.patch
  patch -p1 < ../debian/patches/0001_explicitly-declare-copy-constructor.patch
  patch -p1 < ../debian/patches/0002_fix-build-with-boost-1.66.0-and-above.patch
  sed -e '105d' -i CMakeLists.txt
}

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/_build"
  cd "${srcdir}/${pkgname}-${pkgver}/_build"

  cmake -DDBUS_CPP_VERSION_MAJOR='5' -DDBUS_CPP_VERSION_MINOR='0' \
        -DDBUS_CPP_VERSION_PATCH='1' -DCMAKE_BUILD_TYPE=Release   \
        -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname}" ..
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/_build"

  cmake --install . --prefix="${pkgdir}/usr"
}
