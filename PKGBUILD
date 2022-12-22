# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=startdde-git
pkgver=5.10.1.r4.g4726010
pkgrel=1
pkgdesc="starter of deepin desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/startdde"
license=('GPL3')
depends=('libgnome-keyring')
makedepends=('cmake' 'coffeescript' 'golang-github-linuxdeepin-go-dbus-factory-git' 'golang-deepin-gir-git'
             'golang-deepin-lib-git' 'deepin-api-git' 'go' 'git' 'jq'
             'golang-gopkg-yaml.v3'
             'golang-golang-x-net' 'golang-github-linuxdeepin-go-x11-client-git')
optdepends=('deepin-wm: Legacy 3D window manager'
            'deepin-metacity: Legacy 2D window manager'
            'deepin-kwin: Preferred window manager')
provides=('startdde')
conflicts=('startdde')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/startdde")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  export GOPATH="$srcdir/build:/usr/share/gocode"
  export GO111MODULE=off
  go get -v github.com/cryptix/wav
  go get -v github.com/youpy/go-wav
  go get -v golang.org/x/xerrors
  go get -v github.com/fsnotify/fsnotify
  go get -v github.com/godbus/dbus
  go get -v github.com/godbus/dbus/introspect
  go get -v github.com/godbus/dbus/prop
  go get -v github.com/jouyouyun/hardware/graphic
  sed -i 's/sbin/bin/' Makefile

  cd $srcdir/build/src/github.com/godbus/dbus
  git reset 4b691ce883d536a867587e2fcfec1245ebddecd0
  git checkout -- .
}

build() {
  export GOFLAGS="-mod=readonly -modcacherw"
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  # Fix env file permission
  chmod +x "$pkgdir"/etc/X11/Xsession.d/*

  # Don't rely on deepin-session's location
  install -dm755 "$pkgdir"/etc/X11/xinit/xinitrc.d
  mv "$pkgdir"/etc/X11/Xsession.d/* "$pkgdir"/etc/X11/xinit/xinitrc.d/
  rmdir "$pkgdir"/etc/X11/Xsession.d
}
