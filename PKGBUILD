#Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=gwmpd
pkgver=0.0.1
pkgrel=1
pkgdesc="Frontend and backend for mpd"
arch=('any')
url="https://github.com/Chipsterjulien/gwmpd"
license=('BSD')
# depends=('')
makedepends=('go' 'yarn')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz")
install=gwmpd.install

_builddir="$pkgname-$pkgver"
# _front="Frontend/"

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
    # echo "Install/update go-logging"
    # go get -u github.com/op/go-logging
    # echo "Install/update viper"
    # go get -u github.com/spf13/viper
    # echo "Install/update gin"
    # go get -u github.com/gin-gonic/gin
    # echo "Install/update gin-cors"
    # go get -u github.com/itsjamie/gin-cors
    # echo "Install/update gin-jwt"
    # go get -u github.com/appleboy/gin-jwt

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

sha512sums=('05abe8a03a7d54ef82a7bfb9b56cd371e16c771e021eac3173aaaffd377f8506f7ae96b0b21fa6de7a5053256d5eb12da47d4f1624d98b6b1b2932e130920d8b')
