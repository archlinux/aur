# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=portmidi
pkgname=lib32-$_pkgbasename
pkgver=217
pkgrel=5
pkgdesc="Platform independent library for real-time MIDI input/output. (32 bit)"
arch=('x86_64')
url="http://portmedia.sourceforge.net/"
license=('GPL')
depends=('lib32-alsa-lib')
makedepends=('cmake' 'java-environment' 'gcc-multilib')
optdepends=('java-runtime: for using pmdefaults')
options=('!makeflags')
source=(http://downloads.sourceforge.net/project/portmedia/${_pkgbasename}/${pkgver}/${_pkgbasename}-src-${pkgver}.zip
        ${_pkgbasename}-${pkgver}-build-fix.patch::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/${_pkgbasename}-${pkgver}-build-fix.patch?h=packages/${_pkgbasename}
         pm_common.patch)
sha256sums=('08e9a892bd80bdb1115213fb72dc29a7bf2ff108b378180586aa65f3cfd42e0f'
            'da2b6a4e8f86bc42520c660bde4833497ddbe6a491aa3aa98b9a81c07e2db347'
            '3659c73b30b4d2d0cdb9447bfcef16ecc9b59aa9f729867130b4b645ca2156e5')

prepare() {
  cd $srcdir/${_pkgbasename}
  sed -i "s#/usr/local#/usr#" */CMakeLists.txt pm_python/setup.py
  mkdir -p pm_java/Release

  # build fix for "pm_java/CMakeLists.txt" (fixes FS#27118)
  patch -p1 -i "../${_pkgbasename}-${pkgver}-build-fix.patch"

  # do not build JAVA part for multilib version
  patch -p0 -i "../pm_common.patch"

  # place libraries in /usr/lib32
  sed -i "s#/usr/lib#/usr/lib32#" pm_dylib/CMakeLists.txt
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'

  cd "$srcdir/${_pkgbasename}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY=Release \
    -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=Release \
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=Release
  make
}

package() {
  cd "$srcdir/${_pkgbasename}"
  make DESTDIR="${pkgdir}" install

  # Fix missing symlink for libporttime.so (FS#21528).
  ln -s libportmidi.so "${pkgdir}/usr/lib32/libporttime.so"
  
  rm -rf "${pkgdir}/usr"/{bin,include,share}
}
