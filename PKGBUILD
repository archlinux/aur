# Maintainer: Damien Flament <damien.flament at gmx dot com>
# Contributor: mickele <mimocciola at yahoo dot com>
# Contributor: Ilmari Repo <ilmari at gmail dot com> (librecad-svn PKGBUILD)
# Contributor: GazJ Gary James <garyjames82 at gmail  dot com> (CADuntu PKGBUILD)

pkgname=librecad-git
pkgver=2.2.0_alpha_244_g54269f5b
pkgrel=1
pkgdesc="A 2D CAD drawing tool based on the community edition of QCad."
arch=('i686' 'x86_64')
url="http://librecad.org"
license=('GPL')
depends=('qt5-base' 'qt5-svg' 'qt5-tools' 'boost' 'muparser')
makedepends=('git')
provides=('librecad')
conflicts=('librecad')
replaces=('librecad-svn' 'caduntu' 'caduntu-svn')
backup=()
options=()
install=
changelog=
_gitname='LibreCAD'
_gitroot="https://github.com/${_gitname}/${_gitname}.git"
source=("${_gitname}::git://github.com/${_gitname}/${_gitname}.git" 'librecad.desktop')
noextract=()
md5sums=('SKIP' '19dcb83a3fcdb3752439095b118ac6d3')
validpgpkeys=()


pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags | sed -e 's/-/_/g'
}

prepare() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d ${_gitname} ]] ; then
    cd "${_gitname}" && git pull origin master
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
}

build() {
  msg "Building ${_gitname}..."
  cd "${srcdir}/${_gitname}"
  qmake-qt5 -r librecad.pro \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}"

  make

  msg "Building ${_gitname} plugins"

  cd plugins
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D -m 755 unix/librecad "${pkgdir}/usr/bin/librecad"
  install -D -m 755 unix/ttf2lff "${pkgdir}/usr/bin/ttf2lff"

  mkdir -p "${pkgdir}/usr/share/librecad"
  cp -r unix/resources/{library,patterns,fonts,qm,plugins} "${pkgdir}/usr/share/librecad"

  install -D -m 644 "${srcdir}/librecad.desktop" "${pkgdir}/usr/share/applications/librecad.desktop"
  install -D -m 644 librecad/res/main/librecad.png "${pkgdir}/usr/share/pixmaps/librecad.png"
}
