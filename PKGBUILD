# Maintainer: Jack O'Sullivan <j@ckos.ie>

pkgname=netsoc
pkgdesc="Netsoc CLI"
pkgver=0.3.6
pkgrel=1
arch=('x86_64')
url="https://netsoc.ie"
license=('GPL-3')
depends=('glibc')
makedepends=('go' 'rsync' 'git')
source=(https://github.com/netsoc/cli/archive/v${pkgver}/v${pkgver}.tar.gz)
sha512sums=('6494f24cc4bd2706489150e17fce77b4e5f835a2b348461ed5ffb63fe2dd77cd8959a4e90c624755f3acfd6d574be3551e38ffc3150d315335ab5a53f64f1ad1')

build() {
  cd cli-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"
  export GOLDFLAGS="-linkmode=external"

  make VERSION="$pkgver" bin/netsoc
}

package() {
  cd cli-${pkgver}
  install -Dm755 bin/netsoc -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/netsoc" docs -t man -o docs/
  gzip docs/man1/*
  install -Dm644 docs/man1/* -t "$pkgdir/usr/share/man/man1"

  "$pkgdir/usr/bin/netsoc" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/netsoc"
  "$pkgdir/usr/bin/netsoc" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_netsoc"
}

# vim: ts=2 sw=2 et:
