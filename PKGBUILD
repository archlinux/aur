# Maintainer: Dylan Ferris <dylan@psilly.com>
# Submaintainer : bartus <arch-user-repoᘓbartus.33mail.com>
 
pkgname=('visual-sfm')
pkgver=0.5.26
pkgrel=5
#options=(debug !strip !makeflags)
pkgdesc='A Visual Structure from Motion System; create 3d models from photos.'
arch=('x86_64')
url='http://ccwu.me/vsfm/'
depends=('lapack' 'blas' 'f2c' 'gtk2' 'glu' 'cmvs-pmvs-git' 'siftgpu')
makedepends=('gcc5' 'cuda')
optdepends=(
  'opencl-nvidia: nvidia gpu support'
  'opencl-mesa: amd gpu support (mesa)'
  'opencl-catalyst: amd gpu support (catalyst)'
)
license=('custom:visual-sfm')
source=(
  'http://ccwu.me/vsfm/download/VisualSFM_linux_64bit.zip'
  'visual-sfm.desktop'
  'http://grail.cs.washington.edu/projects/mcba/pba_v1.0.5.zip'
)
md5sums=(
  '25fcca5e320a9e97131e87abdf3b7f61'
  'c063c0236d8649b2281b334ecde73784'
  '672f5cd6c1b4c08517409809b819c547'
)

build() {
 
  msg "building Multicore Bundle Adjustment"
  cd ${srcdir}/pba
  # adjust cuda path
  sed -i 's:CUDA_INSTALL_PATH = /usr/local/cuda:CUDA_INSTALL_PATH = /opt/cuda:' makefile
  # use static libcudart those pruning cuda from dependencies
  sed -i 's:-lcudart:/opt/cuda/targets/x86_64-linux/lib/libcudart_static.a:g' makefile
  make pba
  cp bin/libpba.so ../vsfm/bin
 
  msg "building VisualSFM"
  cd ${srcdir}/vsfm
  # use system lapack blas f2c
  sed -i 's:$(LIB_DIR)/lapack.a:-llapack:' makefile
  sed -i 's:$(LIB_DIR)/blas.a:-lblas:' makefile
  sed -i 's:$(LIB_DIR)/libf2c.a:-lf2c:' makefile
  sed -i 's:g++:g++-5:' makefile
# sed -i 's:$(LIB_DIR)/libjpeg.a:-ljpeg:' makefile
# Won't work with system libjpeg
#Thread 56 "VisualSFM" received signal SIGSEGV, Segmentation fault.
#[Switching to Thread 0x7fff72ffd700 (LWP 31903)]
#0x00007ffff5bdb566 in jpeg_CreateDecompress () from /usr/lib/libjpeg.so.8
  make
}
 
package() {
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  cd ${srcdir}/vsfm
  install -Dm644 README ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf
  install -Dm755 bin/VisualSFM ${pkgdir}/usr/bin/visual-sfm
  install -Dm755 bin/libpba.so ${pkgdir}/usr/lib/libpba.so
}
 
# vim:set ts=2 sw=2 et:
