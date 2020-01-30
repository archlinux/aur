pkgname=arduino-cli-rc
_tagver="0.7.2"
pkgver="${_tagver%-*}"
pkgrel=1
pkgdesc="Arduino command line interface -- stable and release candidates"
arch=('x86_64')
url="https://github.com/arduino/arduino-cli"
license=('GPL3')
conflicts=('arduino-cli')
provides=('arduino-cli')
depends=('arduino-ctags')
makedepends=('go-pie' 'git')
optdepends=('arduino-avr-core: AVR core with upstream avr-gcc and avrdude'
	   'arduino-builder: Arduino command line interface'
	   'arduino-ctags')
source=("https://github.com/arduino/arduino-cli/archive/${_tagver}.tar.gz")

sha512sums=('8ad5716aea3a36e93550290363528d103741e451c5b016d876ff1d08f6540c647453d29ac40a325393f00346f305385674abefd2a1e52fa44d5b037de8ca3e33')

prepare(){
  cd arduino-cli-${_tagver}

  # Fix version string
#  sed -i "s|versionString        = \".*\"|versionString        = \"$pkgver-arch\"|
#          s|commit               = \".*\"|commit               = \"$(git rev-parse HEAD)\"|" \
#          version/version.go

  export GOPATH="$srcdir"/gopath

  mkdir -p "$GOPATH"/src/github.com/arduino
  ln -rTsf . "$GOPATH"/src/github.com/arduino/arduino-cli
  cd "$GOPATH"/src/github.com/arduino/arduino-cli

  export GO111MODULE=on

  go mod vendor
  go mod download
}

build(){
  export GOPATH="$srcdir"/gopath
  cd "$GOPATH"/src/github.com/arduino/arduino-cli

  go build \
  	-gcflags "all=-trimpath=$GOPATH" \
  	-asmflags "all=-trimpath=$GOPATH" \
  	-ldflags "-extldflags $LDFLAGS" \
  	-v .
}

package() {
  install -Dm 755 arduino-cli-${_tagver}/arduino-cli "$pkgdir"/usr/bin/arduino-cli

  # Fix platform.txt for arch arduino-ctags
  #cd "$GOPATH"/src/github.com/arduino/arduino-cli/hardware
  #sed -i 's#^tools.ctags.path=.*#tools.ctags.path=/usr/bin#' platform.txt
  #sed -i 's#^tools.ctags.cmd.path=.*#tools.ctags.cmd.path={path}/arduino-ctags#' platform.txt


  # Install
  install -Dm644 -t "${pkgdir}/usr/share/arduino/hardware/" "${srcdir}/${pkgname//-rc}-${_tagver}/legacy/builder/hardware/platform.keys.rewrite.txt"
}

