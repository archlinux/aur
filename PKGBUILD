# Maintainer: Henry Bubert <cryptix@riseup.net>
pkgname=systrayhelper
pkgver=0.0.5
pkgrel=1
pkgdesc='A systray utility written in go, using json over stdio for control and events'
arch=('x86_64')
_goimport='github.com/ssbc/systrayhelper'
url="https://$_goimport"
license=('MIT')
depends=('libappindicator-gtk3')
makedepends=('go' 'xorg-server-xvfb' 'dbus' 'i3-wm' 'xdotool')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('55cbb75d6f89784ec03f936059625ae316d32542103a2ab66a98cf404c34c752')

prepare(){ # GOPATH setup - will go away with go.mod
  mkdir -p "gopath/src/github.com/ssbc"
  ln -rTsf "${pkgname}-${pkgver}" "gopath/src/$_goimport"
}

check() {
  export GOPATH="$srcdir/gopath"
  cd "gopath/src/$_goimport/test"
  Xvfb :23 -screen 0 800x600x16 &
  pid_xvfb=$!
  export DISPLAY=:23
  export TRAY_I3=t
  echo started X as $pid_xvfb. waiting..
  sleep 5
  dbus-run-session go test
  kill $pid_xvfb
}

build() {
  export GOPATH="$srcdir/gopath"
  cd "gopath/src/$_goimport"
  meta="-X main.version=v$pkgver -X main.commit=release -X main.date=$(date +%F)"
  go install \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS $meta" 
}

package() {
  install -Dm755 gopath/bin/$pkgname -t "$pkgdir"/usr/bin/
  install -Dm644 $srcdir/${pkgname}-${pkgver}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
