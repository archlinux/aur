# Maintainer: Mario Finelli

pkgname=musicrename
pkgver=3.0.0
pkgrel=1
pkgdesc="command line music library manager"
arch=(x86_64)
url=https://github.com/mfinelli/musicrename
license=(GPL-3.0-or-later)
depends=(glibc taglib)
makedepends=(git go scdoc)
checkdepends=(ffmpeg)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('4ddb27137cad2a12f16616525009296d439d6794c17641a7dba1aaf83d148139')

prepare() {
  cd $pkgname
  export GOPATH="${srcdir}/gopath"
  go mod download
}

check() {
  cd $pkgname
  export GOPATH="${srcdir}/gopath"
  go test ./...
}

build() {
  cd $pkgname

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOPATH="${srcdir}/gopath"

  go build \
    -o mr \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    main.go

  make mr.1
}

package() {
  cd $pkgname
  install -Dm0755 mr "$pkgdir/usr/bin/mr"
  install -Dm0644 mr.1 "$pkgdir/usr/share/man/man1/mr.1"

  "${pkgdir}/usr/bin/mr" completion bash | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/mr"
  "${pkgdir}/usr/bin/mr" completion zsh | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_mr"
  "${pkgdir}/usr/bin/mr" completion fish | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/mr.fish"

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
