# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname=luxmark
pkgver=3.1
_scenever=3.1beta3
_pkgver=086c23ceefed54be27dfd038be6bc7a33984e75b
pkgrel=5
pkgdesc="OpenCL benchmark tool"
arch=('x86_64') # because of embree only x86_64 is supported
url="http://www.luxrender.net/"
license=('GPL3')
depends=('boost-libs' 'embree' 'freetype2' 'freeglut' 'glew' 'opencl-icd-loader' 'libgl' 'libpng' 'openimageio' 'qt4' 'opencl-driver' 'libbcd' 'intel-tbb')
makedepends=('cmake' 'boost' 'luxcorerender' 'mesa' 'opencl-headers' 'freeglut' 'eos_portable_archive')
source=($pkgname-$pkgver-$_pkgver.tar.bz2::https://github.com/LuxCoreRender/LuxMark/archive/${_pkgver}.tar.gz \
        https://bitbucket.org/luxrender/luxmark/downloads/scenes-v${_scenever}.zip \
        system_scenes.diff exepath.diff fix-dependencies.patch)
md5sums=('7ca734e249aa630703744ed6c77bb962'
         '03d3d117dfd2f3a7f825e3ea7b68f045'
         'c4a378c08f105a84ef2f792370082cd6'
         '6ba9b9888160cc06e3c3644e21d80e5a'
         '4efb443e534d07812b17367adb3ffedd')

prepare() {
  cd "$srcdir/LuxMark-$_pkgver"

  patch -Np1 < "$srcdir/system_scenes.diff"

  # fix exepath for the VR mode to work
  patch -Np1 < "$srcdir/exepath.diff"

  # fix dependencies
  patch -Np1 < "$srcdir/fix-dependencies.patch"
}

build() {
  cd "$srcdir/LuxMark-$_pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    .
  make
}

package() {
  cd "$srcdir/LuxMark-$_pkgver"
  install -D -m755 bin/luxmark "$pkgdir"/usr/bin/luxmark

  install -d "$pkgdir/usr/share/luxmark"
  cp -a "$srcdir/scenes" "$pkgdir/usr/share/luxmark"
}

# vim:set ts=2 sw=2 et:
