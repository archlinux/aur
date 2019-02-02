#Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=gwmpd
pkgver=0.0.1
pkgrel=2
pkgdesc="Frontend and backend for mpd"
arch=('any')
url="https://github.com/Chipsterjulien/gwmpd"
license=('BSD')
# depends=('')
makedepends=('go')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz")
install=gwmpd.install

_builddir="$pkgname-$pkgver"

build() {
  GOPATH_exist=1
    if [ -z $GOPATH ]; then
      # path don't exit
      GOPATH_exist=0
      # create gopath directory
      mkdir -p .gopath/{bin,src}
      # export var
      export GOPATH=~/.gopath
    fi

  # Getting some libs
    echo "Install/update go-logging"
    go get -u github.com/op/go-logging
    echo "Install/update viper"
    go get -u github.com/spf13/viper
    echo "Install/update gin"
    go get -u github.com/gin-gonic/gin
    echo "Install/update gin-cors"
    go get -u github.com/itsjamie/gin-cors
    echo "Install/update gin-jwt"
    go get -u github.com/appleboy/gin-jwt

  cd "$_builddir"

  go build -o gwmpd || return 1

  if [ $GOPATH_exist == 0 ]; then
    rm -rf ~/.gopath
    export GOPATH=
  fi
}

package() {
  cd "$_builddir"

  # gwmpd_sample.toml
  install -Dm644 cfg/"$pkgname"_sample.toml \
    "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

  # Create log directory
  install -dm755 "$pkgdir"/var/log/$pkgname || return 1

  # Move gwmpd.service
  install -Dm644 systemd/"$pkgname".service \
    "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

  # gwmpd binary
  install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname \
      "$pkgdir"/usr/bin/$pkgname || return 1

  cd $srcdir
  git clone https://github.com/Chipsterjulien/gwmpd.git

  # Copy front
  install -dm755 "$pkgdir"/var/www/"$pkgname" || return 1
  cp -R "$srcdir"/$pkgname/Build/Frontend/* \
    "$pkgdir"/var/www/"$pkgname" || return 1
}

sha512sums=('d5de13c1da30e12557ecea88c5af7b01e08a4dabd5b10cee982cab44972b20aa096b656af23796d1aa1e0980515e2c7739caef2a888a693a4201c18c01e5b849')
