# Maintainer: Markus Hartung <mail@hartmark.se>

VCSCLIENTS+=('git-lfs::git-lfs')

_pkgname=daltonlens
pkgname=daltonlens-git
pkgver=2.5.r0.gb37c33f
pkgrel=1
pkgdesc='DaltonLens is a utility to help colorblind people by providing color filters and highlighting tools.'
arch=('x86_64')
url='https://github.com/DaltonLens/DaltonLens'
license=('BSD-2-Clause')
depends=('glibc' 'gcc-libs' 'glib2' 'gtk3' 'libayatana-appindicator' 'libglvnd' 'libx11' 'libxcb')

# makepkg-git-lfs-proto may be needed to be installed using AUR helper
makedepends=('cmake' 'git' 'git-lfs' 'makepkg-git-lfs-proto')

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git-lfs+${url}.git"
	"fix-cmake-version.patch")
sha256sums=('SKIP'
	    'bcc96dd8e792b787f481f406d91f2b96a5bc8b36c9caa1c16880ecc385de7e1d')

prepare() {
  cd "${srcdir}/${_pkgname}"
  
  # Apply patch to fix CMake version requirements
  patch -p1 -i "${srcdir}/fix-cmake-version.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/release\///'
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake ..
  cmake --build .
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  mkdir -p pkgstage
  DESTDIR="./pkgstage" cmake --install .

  install -Dm 755 ./pkgstage/usr/local/bin/DaltonLens "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
