# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: frousties

pkgname=tacentview
pkgver=1.0.40
pkgrel=1
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent"
arch=('any')
url="https://github.com/bluescan/tacentview"
license=('ISC')
conflicts=($pkgname)
provides=($pkgname)
depends=('libx11')
makedepends=('cmake' 'dpkg' 'gcc12' 'git' 'ninja')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/\1/;s/-/./g'
}

build() {
  cmake -S $_pkgname -B build -GNinja -DPACKAGE_DEB=True -DCMAKE_CXX_COMPILER=gcc-12 -DCMAKE_C_COMPILER=gcc-12
  ninja -C build install
}

package() {
  # Delete unnecessary files
  find . -name .gitignore -exec rm {} \;
  # Install
  cd build/ViewerInstall/Package
  INPUT=$(find . -maxdepth 1 -type d | grep "${_pkgname}_*")
  cp -r $INPUT/usr "$pkgdir"
}
