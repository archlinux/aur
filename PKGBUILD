pkgname=arduino-builder-rc
pkgver=1.5.1
pkgrel=1
pkgdesc="A command line tool for compiling Arduino sketches -- stable and release candidates"
arch=('x86_64')
url="https://github.com/arduino/arduino-builder"
license=('GPL')
conflicts=('arduino-builder')
provides=('arduino-builder')
depends=('arduino-ctags')
makedepends=('go' 'git' 'unzip')
optdepends=('arduino-avr-core: AVR core with upstream avr-gcc and avrdude'
	   'arduino-cli: Arduino command line interface')
source=("https://github.com/arduino/arduino-builder/archive/${pkgver}.tar.gz")

sha512sums=('97e643836befb42279c4b745197197a8057ca1a52eee776f13b70c5a564818e50ac155745e52df53e7fc6bbbf6d4478c1cc6dcc87bb5d4f7a02d79db692171f5')


prepare(){
  export GOPATH="$srcdir"/gopath

  mkdir -p "$GOPATH"/src/github.com/arduino
  ln -rTsf "${pkgname//-rc}-$pkgver" "$GOPATH"/src/github.com/arduino/arduino-builder
  #cp -a "${pkgname//-rc}-$pkgver" "$GOPATH"/src/github.com/arduino/arduino-builder
  cd "$GOPATH"/src/github.com/arduino/arduino-builder

  export GO111MODULE=on

  go mod vendor
  go mod download
}

build() {
	export GOPATH="$srcdir"/gopath
	cd "$GOPATH"/src/github.com/arduino/arduino-builder
	
	go build \
		-buildmode=pie \
		-gcflags "all=-trimpath=$GOPATH" \
		-asmflags "all=-trimpath=$GOPATH" \
		-ldflags "-extldflags $LDFLAGS" \
		-gccgoflags "$CFLAGS $LDFLAGS" \
		-v .

	chmod -R 744 "$GOPATH"
}

#check() {
#	# Test will download ~1GB of testfiles
#	cd "$GOPATH"/src/github.com/arduino/arduino-builder
#	go test -v -timeout 60m .
#}

package() {
	# Fix platform.txt for arch arduino-ctags
	#cd "${srcdir}/build/src/github.com/arduino/arduino-builder/hardware"
	#sed -i 's#^tools.ctags.path=.*#tools.ctags.path=/usr/bin#' platform.txt
	#sed -i 's#^tools.ctags.cmd.path=.*#tools.ctags.cmd.path={path}/arduino-ctags#' platform.txt

	cd "$GOPATH"/src/github.com/arduino/arduino-builder

	# Install main tool
	install -Dm755 "arduino-builder" "${pkgdir}/usr/bin/arduino-builder"

	# Install platform.txt files
	#install -Dm644 -t "${pkgdir}/usr/share/arduino/hardware/" "${srcdir}"/build/src/github.com/arduino/arduino-builder/hardware/*

	# Add documentation
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname//-rc}" "${srcdir}/${pkgname//-rc}-${pkgver}/README.md"
}
