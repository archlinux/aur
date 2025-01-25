# Maintainer: dringsim <dringsim@qq.com>
pkgname=('ocaml-zmq' 'ocaml-zmq-async' 'ocaml-zmq-lwt')
pkgver='5.3.0'
pkgrel='1'
arch=('x86_64')
url="https://github.com/issuu/ocaml-zmq"
license=('MIT')
makedepends=('ocaml>=4.04.1' 'dune>=2.7')
checkdepends=('ocaml-ounit')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('F06F995D797AB004A1CDD199CE6EA6F63A6701EECC929D9E0C6F667124E2AD4B')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --profile=release --verbose -p zmq,zmq-async,zmq-lwt
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --profile=release --verbose -p zmq,zmq-async,zmq-lwt
}

_do_package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --profile=release --verbose  -p $1

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

package_ocaml-zmq() {
	pkgdesc='OCaml bindings for ZeroMQ 4.x'
	depends=('ocaml>=4.03.0' 'zeromq')

	_do_package zmq
}

package_ocaml-zmq-async() {
	pkgdesc='Async-aware bindings to ZMQ'
	depends=('ocaml>=4.04.1' 'ocaml-zmq' 'ocaml-base>=0.11.0' 'ocaml-async_unix>=0.11.0' 'ocaml-async_kernel>=0.11.0')

	_do_package zmq-async
}

package_ocaml-zmq-lwt() {
	pkgdesc='Lwt-aware bindings to ZMQ'
	depends=('ocaml>=4.03.0' 'ocaml-zmq' 'ocaml-lwt>=2.6.0')

	_do_package zmq-lwt
}
