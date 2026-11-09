# Maintainer: Mario Finelli

pkgname=musicrename
pkgver=4.7.0
pkgrel=1
pkgdesc="command line music library manager"
arch=(x86_64)
url=https://github.com/mfinelli/musicrename
license=(GPL-3.0-or-later)
depends=(glibc taglib)
makedepends=(git go scdoc)
checkdepends=(ffmpeg rsgain)
optdepends=(
  "ffmpeg: track splitting and transcoding for device sync"
  "rsgain: apply replaygain to extracted audio"
  "yt-dlp: automatic video downloads"
)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('0b1b1ad56fefe08703804a772ff3664cde2463de74f6f34a0e5f8dcd21f44917')

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
    -o mrr \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    main.go

  make mrr.1
}

package() {
  cd $pkgname
  install -Dm0755 mrr "$pkgdir/usr/bin/mrr"
  install -Dm0644 mrr.1 "$pkgdir/usr/share/man/man1/mrr.1"

  "${pkgdir}/usr/bin/mrr" completion bash | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/mrr"
  "${pkgdir}/usr/bin/mrr" completion zsh | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_mrr"
  "${pkgdir}/usr/bin/mrr" completion fish | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/mrr.fish"

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm0644 DESIGN.md "$pkgdir/usr/share/doc/$pkgname/DESIGN.md"
  install -Dm0644 SPECTRUM.md "$pkgdir/usr/share/doc/$pkgname/SPECTRUM.md"
  install -Dm0644 WORKFLOW.md "$pkgdir/usr/share/doc/$pkgname/WORKFLOW.md"
}

# vim: set ts=2 sw=2 et:
