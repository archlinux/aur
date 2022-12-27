# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=golang-deepin-lib-git
pkgver=5.9.1.r0.gae4320a
pkgrel=1
pkgdesc='A library containing many useful go routines for things such as glib, gettext, archive, graphic,etc.'
arch=('any')
url="https://github.com/linuxdeepin/go-lib"
license=('GPL3')
depends=('dbus' 'libpulse' 'gdk-pixbuf2' 'gdk-pixbuf-xlib' 'mobile-broadband-provider-info' 'libx11' 'libcanberra'
         'golang-gopkg-alecthomas-kingpin.v2' 'golang-deepin-gir-git'
         'golang-github-stretchr-testify'
         'golang-github-linuxdeepin-go-x11-client-git' 'golang-golang-x-net' 'golang-golang-x-image')
         # 'golang-github-cryptix-wav' not packaged yet, paused until our go packaging standards formed
makedepends=('iso-codes' 'golang-gopkg-check.v1' 'golang-gopkg-yaml.v3' 'git' 'go') # git needed only for go get
conflicts=('golang-deepin-lib')
provides=('golang-deepin-lib')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/go-lib/")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export GO111MODULE=off
  cd $pkgname
  sed -i 's/int connect_timeout;/extern int connect_timeout;/' pulse/dde-pulse.h
}

check() {
  export GOPATH="$srcdir/build:/usr/share/gocode"
  export GO111MODULE=off
  mkdir -p "$srcdir"/build/src/github.com/linuxdeepin
  cp -a "$srcdir/$pkgname" "$srcdir"/build/src/github.com/linuxdeepin/go-lib
  cd "$srcdir"/build/src/github.com/linuxdeepin/go-lib
  # TODO: make packages for them
  go get -v github.com/smartystreets/goconvey/convey
  go get -v github.com/mozillazg/go-pinyin
  # TODO: figure out why pulse tests hang
  # passwd: test needs to access /etc/passwd
  # group & timer & log & dbus: build failed
  # shell: TestEncode failed
  go get -v github.com/fsnotify/fsnotify
  go get -v github.com/godbus/dbus
  go get -v github.com/godbus/dbus/introspect
  go get -v github.com/godbus/dbus/prop
  go get -v github.com/youpy/go-wav

  # go test -v $(go list ./... | grep -v -e lib/pulse -e lib/users/passwd -e lib/users/group -e lib/timer -e lib/log -e lib/dbus -e lib/shell)
}

package() {
  mkdir -p "$pkgdir"/usr/share/gocode/src/github.com/linuxdeepin
  cp -a "$srcdir/$pkgname" "$pkgdir"/usr/share/gocode/src/github.com/linuxdeepin/go-lib

  rm -r "$pkgdir"/usr/share/gocode/src/github.com/linuxdeepin/go-lib/debian
}
