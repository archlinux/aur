# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname='azure2'
_pkgname="Azure2"
pkgver=v1.0.r117.gd7deab6
pkgrel=2
pkgdesc='Bayesian R-Matrix Inference Code'
url='https://azure.nd.edu/'
provides=('azure2')
arch=('any')
makedepends=(
  'root'
  'qt5-base'
  'qwt'
  'git'
)
source=(
# "Azure2::git+https://github.com/rdeboer1/AZURE2#branch=qwt6"
  "Azure2::git+https://github.com/rdeboer1/AZURE2#branch=api"
  )
sha256sums=('SKIP')

#The sources are to be provided manually as the package is not public

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  echo "If this fails, try running cmake by hand, compile with make and then re-run makepkg\n"
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_QWT=ON -DBUILD_LIBRARY=OFF -DCMAKE_INSTALL_PREFIX=/opt/Azure2 -DMINUIT2_INCLUDE_DIR=/usr/include/Minuit2 -DMINUIT2_LIBRARY_DIR=/usr/lib/root -DQWT_VERSION_STRING=6.2.0 -DQt5_DIR=/usr/lib/cmake/Qt5 -DQt5Widgets_DIR=/usr/lib/cmake/Qt5Widgets -DQt5PrintSupport_DIR=/usr/lib/cmake/Qt5PrintSupport -DQt5Gui_DIR=/usr/lib/cmake/Qt5Gui -DQt5Core_DIR=/usr/lib/cmake/Qt5Core -DROOT_DIR=/usr/lib/cmake/ROOT -Dnlohmann_json_DIR=/usr/share/cmake/nlohmann_json "${srcdir}/${_pkgname}"
  make

  cd "${srcdir}"
  echo "export PATH=\$PATH:/opt/AZURE2/bin" > Azure2.sh

}

package() {
  cd "${srcdir}/${_pkgname}/build"
  install -Dm755 src/AZURE2 "${pkgdir}/opt/AZURE2/bin/AZURE2"
  ln -s "${pkgdir}/opt/AZURE2/bin/AZURE2" "${pkgdir}/opt/AZURE2/bin/azure2"
  install -Dm644 coul/src/libcoul.a "${pkgdir}/opt/AZURE2/lib/libcoul.a"
  install -Dm644 gui/src/libAZURESetup.a "${pkgdir}/opt/AZURE2/lib/libAZURESetup.a"
  install -Dm755 "${srcdir}/Azure2.sh" "${pkgdir}/etc/profile.d/Azure2.sh"
}
