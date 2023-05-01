# Maintainer: gbr <gbr at pm dot me>

_pkgname=notes
pkgname=notes-git
pkgver=2.1.0.r54.geecd263
pkgrel=1
pkgdesc='Note taking application, write down your thoughts'
arch=('x86_64')
url='https://github.com/nuttyartist/notes'
license=('MPL')
makedepends=('cmake' 'git')
depends=('hicolor-icon-theme' 'qt6-base' 'qt6-declarative')
provides=('notes')
conflicts=('notes')
source=('git+https://github.com/nuttyartist/notes.git'
        'git+https://github.com/b00f/qautostart.git'
        'git+https://github.com/pbek/qmarkdowntextedit.git'
        'git+https://github.com/alex-spataru/QSimpleUpdater.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule init
  git submodule set-url 3rdParty/qautostart "${srcdir}/qautostart"
  git submodule set-url 3rdParty/qmarkdowntextedit "${srcdir}/qmarkdowntextedit"
  git submodule set-url 3rdParty/QSimpleUpdater "${srcdir}/QSimpleUpdater"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${_pkgname}"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT_VERSION=6 \
    -DUPDATE_CHECKER=OFF
  cmake --build build
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}
