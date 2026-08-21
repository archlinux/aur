# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=frizbee
pkgver=0.1.11
pkgrel=1
pkgdesc="Throw a tag at it and it comes back with a checksum"
arch=(x86_64)
url=https://github.com/stacklok/frizbee
license=(Apache-2.0)
depends=(glibc)
makedepends=(git go)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('415879904e4b4985582ecbca8d4c3f140b8a59eb2a427e3b630bf179183cfd84')

prepare() {
  cd $pkgname
  export GOPATH="${srcdir}/gopath"
  go mod download
}

build() {
  cd $pkgname

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"

  export GOPATH="${srcdir}/gopath"

  go build \
    -o frizbee \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    main.go
}

package() {
  cd $pkgname
  install -Dm0755 frizbee "$pkgdir/usr/bin/frizbee"

  "${pkgdir}/usr/bin/frizbee" completion bash | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/frizbee"
  "${pkgdir}/usr/bin/frizbee" completion zsh | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_frizbee"
  "${pkgdir}/usr/bin/frizbee" completion fish | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/frizbee.fish"
}

# vim: set ts=2 sw=2 et:
