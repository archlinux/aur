# Maintainer: CamuseCao camusecao@gmail.com
pkgname=gueerecorder-git
pkgver=r81.7cfc7ab
pkgrel=1
pkgdesc="一个实验性的屏幕、摄像头录像软件。"
arch=('x86_64')
url="https://github.com/guee/GueeRecorder"
license=('GPL3')
depends=('mesa' 'libxinerama' 'libxcomposite' 'libxfixes' 'qt5-multimedia' 'qt5-x11extras')
makedepends=('git' 'qt5-base' 'qt5-tools')
conflicts=()
replaces=()
backup=()
source=("${pkgname%-git}::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
sed -i 's%Icon=net.guee.recorder%Icon=gueerecorder%g' $srcdir/${pkgname%-git}/Package/uos-amd64/opt/apps/net.guee.recorder/entries/applications/net.guee.recorder.desktop
sed -i 's%Exec=/opt/apps/net.guee.recorder/files/GueeRecorder%Exec=/usr/bin/gueerecorder%g' $srcdir/${pkgname%-git}/Package/uos-amd64/opt/apps/net.guee.recorder/entries/applications/net.guee.recorder.desktop
}

build() {
  cd $srcdir/${pkgname%-git}
  mkdir -p build && cd build
  qmake ../ && make
}

package() {
  cd $srcdir/${pkgname%-git}
  install -D ./build/GueeRecorder ${pkgdir}/usr/bin/${pkgname%-git}
  install -Dm644 ./Package/uos-amd64/opt/apps/net.guee.recorder/entries/icons/hicolor/scalable/apps/net.guee.recorder.svg ${pkgdir}/usr/share/icons/${pkgname%-git}.svg
  install -Dm644 ./Package/uos-amd64/opt/apps/net.guee.recorder/entries/applications/net.guee.recorder.desktop $pkgdir/usr/share/applications/${pkgname%-git}.desktop
}

