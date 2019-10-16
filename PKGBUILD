# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname=luxmark
pkgver=4.0alpha0
_pkgver=3284b97fdea381553d763e4e153f4d29e48ba185
pkgrel=3
pkgdesc="OpenCL benchmark tool"
arch=('x86_64') # because of embree only x86_64 is supported
url="http://www.luxrender.net/"
license=('GPL3')
depends=('boost-libs' 'embree' 'freetype2' 'freeglut' 'glew' 'opencl-icd-loader' 'libgl' 'libpng' 'openimageio' 'qt5-base' 'opencl-driver' 'libbcd' 'intel-tbb' 'oidn')
makedepends=('cmake' 'boost' 'luxcorerender' 'mesa' 'opencl-headers' 'freeglut' 'eos_portable_archive')
source=($pkgname-$pkgver-$_pkgver.tar.bz2::https://github.com/LuxCoreRender/LuxMark/archive/${_pkgver}.tar.gz \
        scenes_$pkgver.zip::https://github.com/LuxCoreRender/LuxMark/releases/download/luxmark_v${pkgver}/scenes.tgz \
        system_scenes.diff exepath.diff fix-dependencies.patch)
md5sums=('92862b24a169f54f084c310fdf7e2eb5'
         '2e17995365617b8af066e5aa2c78df49'
         'c11dd38c085e03ced707410b43a94088'
         '6ba9b9888160cc06e3c3644e21d80e5a'
         '44a0b3284c49cffdf3612c4debb24e71')

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
