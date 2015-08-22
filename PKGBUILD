pkgname=qtcreator-cmakeprojectmanager2-plugin-git
pkgver=r3.5.32.47c6a9c
pkgrel=1
qtc_branch=3.5
pkgdesc="Enhanced CMake Project Manager plugin for Qt Creator"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="https://github.com/amezin/cmakeprojectmanager2"
license=('Unknown')
depends=("qtcreator>=${qtc_branch}")
makedepends=('git' "qtcreator-src>=${qtc_branch}")
source=("$pkgname"::git+https://github.com/h4tr3d/cmakeprojectmanager2.git#branch=${qtc_branch}
        "ide_build_tree.patch")
sha256sums=('SKIP'
            '6e55c880eedf525122f4edc0617a7994c2a76f6ef1d99970e10a872261582ad0')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s.%s" "${qtc_branch}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}"/ide_build_tree.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  QTC_SOURCE=/usr/src/qtcreator QTC_BUILD="${srcdir}" qmake \
    "LIBS+=-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}/usr/" install
}
