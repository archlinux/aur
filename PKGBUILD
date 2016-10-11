# Maintainer: mickele <mimocciola____at____yahoo____dot____com>
# Contributor: Damien Flament <damien.flament____at____gmx____dot____com>
# Contributor: Ilmari Repo <ilmari____at____gmail____dot____com> (librecad-svn PKGBUILD)
# Contributor: GazJ Gary James <garyjames82____at____gmail____ dot____com> (CADuntu PKGBUILD)

pkgname=librecad-git
pkgver=2.0.6_66_g9b058e0
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

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd "${_gitname}"

    # Change remote url to anongit
    if [ -z $( git branch -v | grep anongit ) ] ; then
        git remote set-url origin ${_gitroot}
    fi
    
    git pull origin master
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}/${_gitname}"
  export CPPFLAGS="-std=c++0x"
  qmake-qt4 librecad.pro
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D -m 755 unix/librecad "${pkgdir}/usr/bin/librecad"
  install -D -m 755 unix/ttf2lff "${pkgdir}/usr/bin/ttf2lff"

  mkdir -p "${pkgdir}/usr/share/librecad"
  cp -r unix/resources/{library,patterns,fonts,qm} "${pkgdir}/usr/share/librecad"

  install -D -m 644 "${srcdir}/librecad.desktop" "${pkgdir}/usr/share/applications/librecad.desktop"
  install -D -m 644 librecad/res/main/librecad.png "${pkgdir}/usr/share/pixmaps/librecad.png"
}
