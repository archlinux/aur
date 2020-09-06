# Maintainer: DingYuan Zhang <justforlxz@gmail.com>

pkgname=deepin-file-manager-git
pkgver=5.2.0.9.r38.g5602a7942
pkgrel=1
pkgdesc='Deepin File Manager'
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-file-manager"
license=('GPL3')
# startdde: for com.deepin.SessionManager
depends=('deepin-anything' 'disomaster' 'file' 'gio-qt' 'libmediainfo' 'avfs' 'polkit-qt5' 'poppler'
         'ffmpegthumbnailer' 'jemalloc' 'kcodecs' 'startdde-git' 'taglib')
makedepends=('git' 'qt5-tools' 'deepin-dock-git' 'deepin-movie' 'deepin-gettext-tools-git')
optdepends=('deepin-manual: for help menual'
            'deepin-shortcut-viewer: for shortcut display'
            'deepin-screensaver: for screensaver chooser'
            'deepin-movie: for video preview'
            'deepin-terminal: for opening in terminal'
            'deepin-compressor: for compress/decompress')
groups=('deepin-git')
provides=('deepin-file-manager')
conflicts=('deepin-file-manager')
replaces=('deepin-file-manager')
source=("$pkgname::git://github.com/linuxdeepin/dde-file-manager"
        "deepin-file-manager-qt5.15.patch")
sha512sums=('SKIP'
            '0c38761b7a44dc581d7d4fedc2c51cf702769ec43a325384f13ce427cf2dccc8af4b59e82f4bd567449073926f4a7ad433147ea01db0ad8ab75eb46f7150a3eb')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's|systembusconf.path = /etc/dbus-1/system.d|systembusconf.path = /usr/share/dbus-1/system.d|' dde-file-manager-daemon/dde-file-manager-daemon.pro

  patch -p1 -i ../deepin-file-manager-qt5.15.patch # Fix build with Qt 5.15
}

build() {
  cd $pkgname
  qmake-qt5 PREFIX=/usr
  make -j$(nproc)
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
}
