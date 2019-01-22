# Maintainer: Mirko Scholz <mirko dot scholz nine at gmail dot com>
pkgname=folie
pkgver=2.15
pkgrel=2
pkgdesc="Forth Live Explorer is a command-line utility to talk to a micro-controller via a serial port."
arch=('i686' 'x86_64')
url="https://github.com/jeelabs/folie"
license=('custom:UNLICENSE')
depends=('glibc')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_serial_ver=eae1344f9f90101f887b08d13391c34399f97873
_readline_ver=f6d7a1f6fbf35bbf9beb80dc63c56a29dcfb759f
_select_ver=528c74964609a58f7c17471525659c9b71cd499b
source=(
folie.tgz::https://git.jeelabs.org/jcw/folie/archive/v$pkgver.tar.gz
serial.v1.tgz::https://github.com/bugst/go-serial/archive/$_serial_ver.tar.gz
readline.tgz::https://github.com/chzyer/readline/archive/$_readline_ver.tar.gz
goselect.tgz::https://github.com/creack/goselect/archive/$_select_ver.tar.gz
)
noextract=("${source[@]%%::*}")
sha1sums=('b2c387a10edf9ff5db504190eed7d3958fc1372b'
          '0aacc9a8c0d536776385216fe4a5e1f0a0e2a75b'
          '5d962a13a4b15827c50f004ecc52e06be6d5d6a0'
          'c5416088463b0f4bf7ceb7062bbd6bce50f4a8fa')

prepare() {
	cd "$srcdir"
	[ -d src ] || mkdir src
	for i in github.com/jeelabs/folie \
		 go.bug.st/serial.v1 \
                 github.com/chzyer/readline \
	         github.com/creack/goselect 
	do
		cd "$srcdir/src"
		rm -rf $i
		mkdir -p $i
		cd $i
		bn=`basename $i`
		tar xzf "$srcdir/$bn.tgz" --strip-components=1
	done
	GOPATH="$srcdir" go get -v golang.org/x/sys/unix
}

build() {
	GOPATH="$srcdir" go build -v github.com/jeelabs/folie
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/src/github.com/jeelabs/folie/UNLICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
