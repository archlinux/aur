# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname=luxmark
pkgver=4.0alpha1
_pkgver=543b6780171fc58bf7204b312d94ae8bb5bbef56
pkgrel=1
pkgdesc="OpenCL benchmark tool"
arch=('x86_64') # because of embree only x86_64 is supported
url="http://www.luxrender.net/"
license=('GPL3')
depends=('boost-libs' 'embree' 'freetype2' 'freeglut' 'glew' 'opencl-icd-loader' 'libgl' 'libpng' 'openimageio' 'qt5-base' 'opencl-driver' 'libbcd' 'intel-tbb' 'openimagedenoise')
makedepends=('cmake' 'boost' 'luxcorerender' 'mesa' 'opencl-headers' 'freeglut' 'eos_portable_archive')
source=($pkgname-$pkgver-$_pkgver.tar.bz2::https://github.com/LuxCoreRender/LuxMark/archive/${_pkgver}.tar.gz \
        scenes_$pkgver.zip::https://github.com/LuxCoreRender/LuxMark/releases/download/luxmark_v${pkgver}/scenes.tgz \
        system_scenes.diff exepath.diff fix-dependencies.patch)
md5sums=('4eaccbb6db1eb13d2d06b017224907bd'
         '2d02d2192f6e0baad6090b0609a31b2f'
         '8726fa90791f5380dd24789b8933141e'
         '6ba9b9888160cc06e3c3644e21d80e5a'
         'e04c72ea68fbcdd6b96245935441c9fe')

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
