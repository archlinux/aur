# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: cyrant <cyrant at tuta dot io>

pkgname=scenarist
pkgver=0.7.2.rc15
pkgrel=2
pkgdesc='Screenwriting software to create screenplays which oriented at international standards in the field of film production'
arch=('x86_64')
url='https://kitscenarist.ru/en/'
license=('GPL3')
depends=('hunspell' 'qt5-multimedia' 'qt5-svg' 'qt5-webengine')
makedepends=('git')
_commit=70ebff68c67242ee4f9a5d1f6397f00d0dd471ff
source=("git+https://github.com/dimkanovikov/KITScenarist.git#commit=$_commit"
        'git+https://github.com/dimkanovikov/KITScenaristCore.git'
        'scenarist.mime.xml'
        'scenarist.appdata.xml')
sha256sums=('SKIP'
            'SKIP'
            '513987794f8ba5a4c12aa2a65314fccdc098f86e616a416977aead29e6545b63'
            'ae04ebca48b01ef86d913f769ff856e259e7c3f13a75fc4e05cc15487460772b')

pkgver() {
  cd KITScenarist
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd KITScenarist
  git submodule init
  git submodule set-url src/bin/scenarist-core "$srcdir/KITScenaristCore"
  git -c protocol.file.allow=always submodule update

  # Use system hunspell
  sed -i '/hunspell/d
          s/LIBS += -lz/LIBS += -lhunspell -lz/' src/bin/scenarist-desktop.pro \
                                                 src/libs/libs.pro
}

build() {
  cd KITScenarist/src
  qmake-qt5
  make
}

package() {
  cd KITScenarist
  install -Dm755 build/Release/bin/scenarist-desktop/Scenarist "$pkgdir/usr/bin/$pkgname"
  install -Dm644 build/Ubuntu/scenarist_amd64/usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 build/Ubuntu/scenarist_amd64/usr/share/pixmaps/$pkgname.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 ../$pkgname.mime.xml "$pkgdir/usr/share/mime/packages/$pkgname.xml"
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}
