# Maintainer: Dylan Ferris <dylan@psilly.com>
# Submaintainer: bartus <aur@bartus.33mail.com>

pkgname=('visual-sfm')
pkgver=0.5.26
pkgrel=2
pkgdesc='A Visual Structure from Motion System; create 3d models from photos.'
arch=('x86_64')
url='http://ccwu.me/vsfm/'
depends=('gtk2' 'glu' 'cmvs-pmvs-git' 'siftgpu' 'cuda')
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
sha256sums=(
  '052bfc267ae5aed8613577735247a90bc98eb3073569bf567e93e41e7862d2d9'
  '5a60f78a9a106c95944fdd2f9cbe4fd5d66044182fc50a050c1734cffd2c6789'
  'ddce4118d2da9d962cb56825649bd8edfa97d39270e0960a405ef2b317fac4c2'
)


build() {

  msg "building Multicore Bundle Adjustment"
  cd ${srcdir}/pba
  # adjust cuda path
  sed -i 's:CUDA_INSTALL_PATH = /usr/local/cuda:CUDA_INSTALL_PATH = /opt/cuda:' makefile
  make pba
  cp bin/libpba.so ../vsfm/bin
  
  msg "building VisualSFM"
  cd ${srcdir}/vsfm
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

