# Maintainer: Andrés J. Díaz <ajdidaz@ajdiaz.me>
pkgname=photobackup-server-go-git
pkgver=r255.7621f5f
pkgrel=1
pkgdesc="The Go PhotoBackup server implementation "
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/PhotoBackup/server-go"
license=('BSD 3-Clause License')
depends=()
makedepends=(
  'go' 'git'
)
source=('git+https://github.com/PhotoBackup/server-go.git')
sha256sums=('SKIP')

build() {
  export GOPATH="$srcdir"/go
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  # XXX handle the mess with GOPATH
  if [[ -L "$srcdir/server-go" ]]; then
    rm -f "$srcdir/server-go"
    mv "$srcdir/go/src/server-go" "$srcdir/server-go"
  fi
	rm -rf "$srcdir/go/src"
	mkdir -p "$srcdir/go/src"
	mv "$srcdir/server-go" "$srcdir/go/src/"
	cd "$srcdir/go/src/server-go/"
	ln -sf "$srcdir/go/src/server-go/" "$srcdir/server-go"

  # here we are, start to build
	go get -v \
		-gcflags "-trimpath $GOPATH/src" \
		./...

  mv "$srcdir/go/bin/server-go" "$srcdir/go/bin/photobackup-server-go"
}

package() {
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
	install -Dm644 $srcdir/server-go/LICENSE.txt "$pkgdir/usr/share/doc/photobackup-server-go/LICENSE.txt"
	install -Dm644 $srcdir/server-go/config.example "$pkgdir/usr/share/doc/photobackup-server-go/config.example"
	install -Dm644 $srcdir/server-go/README.md "$pkgdir/usr/share/doc/photobackup-server-go/README.md"
}
