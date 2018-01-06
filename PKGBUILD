# $Id: PKGBUILD 207918 2017-01-18 20:07:48Z stativ $
# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=luxmark
pkgver=3.1
_scenever=3.1beta3
_pkgver=21d445746802
pkgrel=4
pkgdesc="OpenCL benchmark tool"
arch=('x86_64') # because of embree only x86_64 is supported
url="http://www.luxrender.net/"
license=('GPL3')
depends=('boost-libs' 'embree' 'freetype2' 'freeglut' 'glew' 'opencl-icd-loader' 'libgl' 'libpng' 'openimageio' 'qt4')
makedepends=('cmake' 'boost' 'luxrays' 'mesa' 'opencl-headers' 'freeglut')
optdepends=('amdapp-sdk: OpenCL support for AMD GPUs' \
            'intel-opencl-runtime: OpenCL support for Intel CPUs')
source=($pkgname-$pkgver.tar.bz2::https://bitbucket.org/luxrender/luxmark/get/${_pkgver}.tar.bz2 \
        https://bitbucket.org/luxrender/luxmark/downloads/scenes-v${_scenever}.zip \
        fix_includes.diff::https://bitbucket.org/luxrender/luxmark/commits/b7f5c9475c14b91364835d6a253f43400b7d98cb/raw/ \
        system_scenes.diff exepath.diff)
md5sums=('3b0232ee8a6b170927a77be6c0beef46'
         '03d3d117dfd2f3a7f825e3ea7b68f045'
         'd448bbeac4dc4889b99716438f6f1c58'
         'c4a378c08f105a84ef2f792370082cd6'
         '6ba9b9888160cc06e3c3644e21d80e5a')

prepare() {
  cd "$srcdir"/luxrender-luxmark-$_pkgver

  patch -Np1 < "$srcdir/system_scenes.diff"
  # fix includes for luxrays 1.6
  patch -Np1 < "$srcdir/fix_includes.diff"
  # fix exepath for the VR mode to work
  patch -Np1 < "$srcdir/exepath.diff"
}

build() {
  cd "$srcdir/luxrender-luxmark-$_pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    .
  make
}

package() {
  cd "$srcdir/luxrender-luxmark-$_pkgver"
  install -D -m755 bin/luxmark "$pkgdir"/usr/bin/luxmark

  install -d "$pkgdir/usr/share/luxmark"
  cp -a "$srcdir/scenes" "$pkgdir/usr/share/luxmark"
}

# vim:set ts=2 sw=2 et:
