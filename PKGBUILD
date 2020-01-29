
pkgname=arduino-cli-rc
_tagver="0.7.2"
pkgver="${_tagver%-*}"
pkgrel=1
pkgdesc="Arduino command line interface -- stable and release candidates"
arch=('x86_64')
url="https://github.com/arduino/arduino-cli"
license=('GPL')
conflicts=('arduino-cli')
provides=('arduino-cli')
depends=('arduino-ctags')
makedepends=('go' 'git' 'unzip')
optdepends=('arduino-avr-core: AVR core with upstream avr-gcc and avrdude'
	   'arduino-builder: Arduino command line interface'
	   'arduino-ctags')
source=("https://github.com/arduino/arduino-cli/archive/${_tagver}.tar.gz")

sha512sums=('8ad5716aea3a36e93550290363528d103741e451c5b016d876ff1d08f6540c647453d29ac40a325393f00346f305385674abefd2a1e52fa44d5b037de8ca3e33')


prepare(){
  export GOPATH="$srcdir"/gopath

  mkdir -p "$GOPATH"/src/github.com/arduino
  ln -rTsf "${pkgname//-rc}-${_tagver}" "$GOPATH"/src/github.com/arduino/arduino-cli
  cd "$GOPATH"/src/github.com/arduino/arduino-cli

  export GO111MODULE=on

  go mod vendor
  go mod download
}

build() {
  export GOPATH="$srcdir"/gopath
  cd "$GOPATH"/src/github.com/arduino/arduino-cli
  go build \
    -buildmode=pie \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags $LDFLAGS" \
    -v .

    chmod -R 744 "$GOPATH"
}

#check() {
#	cd "$GOPATH"/src/github.com/arduino/arduino-cli
#	go test -v -timeout 60m .
#}

package() {
	# Fix platform.txt for arch arduino-ctags
	#cd "$GOPATH"/src/github.com/arduino/arduino-cli/hardware
	#sed -i 's#^tools.ctags.path=.*#tools.ctags.path=/usr/bin#' platform.txt
	#sed -i 's#^tools.ctags.cmd.path=.*#tools.ctags.cmd.path={path}/arduino-ctags#' platform.txt

	cd "$GOPATH"/src/github.com/arduino/arduino-cli

	# Install main tool
	install -Dm755 "arduino-cli" "${pkgdir}/usr/bin/arduino-cli"

	# Install
	install -Dm644 -t "${pkgdir}/usr/share/arduino/hardware/" "${srcdir}/${pkgname//-rc}-${_tagver}/legacy/builder/hardware/platform.keys.rewrite.txt"

	# Install platform.txt files
	#install -Dm644 -t "${pkgdir}/usr/share/arduino/hardware/" "${srcdir}"/build/src/github.com/arduino/arduino-cli/hardware/*

	# Add documentation
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname//-rc}" "${srcdir}/${pkgname//-rc}-${_tagver}/README.md"
}
