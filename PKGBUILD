# Maintainer: Wang Jiajun <amesists@gmail.com>
pkgname=kdesrc-build-git
_pkgname=kdesrc-build
pkgver=v1.15.477.g2d3cbfe
pkgrel=1
pkgdesc="A tool to allow you to easily build KDE from its source repositories. GIT version."
url="http://kdesrc-build.kde.org/"
arch=('any')
license=('GPL')
depends=('perl' 'perl-libwww' 'perl-xml-parser' 'dialog' 'perl-json')
makedepends=('git' 'cmake')
conflicts=('kdesrc-build')
provides=('kdesrc-build')
optdepends=('subversion: download source code using svn'
            'git: download source code using git')
source=("git://anongit.kde.org/kdesrc-build")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Use the tag of the last commit
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir build
  cd build
  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/share/kdesrc-build/"
  cp "${srcdir}/${_pkgname}/kdesrc-buildrc-sample" "${pkgdir}/usr/share/kdesrc-build/"
}
