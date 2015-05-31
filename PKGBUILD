# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=activitydiary-git
epoch=1
pkgver=0.92.bb8ecab
pkgrel=1
pkgdesc="Analyse and manage all your recorded GPS-tracks"
arch=('i686' 'x86_64')
url="http://www.activitydiary.org"
license=('GPL')
depends=('qt4' 'qwt5')
source=(
  'git+git://gitorious.org/activitydiary/activitydiary.git'
  'activitydiary.pro.patch'
)
sha256sums=(
  'SKIP'
  '248508e05845d533bdb3134ac9f66007c7e68736b4e71abcf877af3ee8e744c9'
)
provides=('activitydiary')
conflicts=('activitydiary')
_gitname="activitydiary"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
  cd "${srcdir}"
  # create work copy
  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
  # patch qwt-paths in activitydiary.pro
  patch "activitydiary.pro" "${srcdir}/activitydiary.pro.patch"
}

build() {
  cd "${srcdir}/${_gitname}-build"
  # build
  qmake-qt4 activitydiary.pro
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make INSTALL_ROOT=${pkgdir} install
}
