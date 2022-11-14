# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Danila Fedotov <mail at danilafedotov dot com>
# Contributor: Gökberk Yaltıraklı <webdosusb at gmail dot com>
pkgname=notes
pkgver=2.0.0+2+g5d245d0
pkgrel=2
pkgdesc='Note taking application, write down your thoughts'
arch=('x86_64')
url='https://www.get-notes.com/'
license=('MPL')
depends=('hicolor-icon-theme' 'qt5-base')
makedepends=('git')
_commit=5d245d055fcdf1a32095dbd784bae55d4b268e01 # tags/v1.5.0
source=("git+https://github.com/nuttyartist/notes.git#commit=$_commit"
        'git+https://github.com/b00f/qautostart.git'
        'git+https://github.com/pbek/qmarkdowntextedit.git'
        'git+https://github.com/alex-spataru/QSimpleUpdater.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $pkgname
  git submodule init
  git submodule set-url 3rdParty/qautostart "$srcdir/qautostart"
  git submodule set-url 3rdParty/qmarkdowntextedit "$srcdir/qmarkdowntextedit"
  git submodule set-url 3rdParty/QSimpleUpdater "$srcdir/QSimpleUpdater"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $pkgname
  qmake
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 packaging/linux/common/notes.desktop "$pkgdir/usr/share/applications/notes.desktop"
  install -Dm644 packaging/linux/common/icons/scalable/notes.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/notes.svg"

  for i in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 packaging/linux/common/icons/${i}x${i}/notes.png "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/notes.png"
  done
}
