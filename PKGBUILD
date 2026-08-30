# Maintainer: GGOBP <GGOBP at protonmail dot ch>
# Upstream packaging coordination: https://github.com/mendixlabs/mxcli/issues/799
#
# This unofficial community package contains mxcli only. MxBuild, the Mendix
# Runtime, and other Mendix components are downloaded separately by mxcli only
# when a user explicitly requests them.

pkgname=mxcli
pkgver=0.20.0
pkgrel=1
pkgdesc="Unofficial community package for the mxcli Mendix development CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/mendixlabs/mxcli"
license=('Apache-2.0')
makedepends=(
  'antlr4>=4.13.2'
  'go>=1.26.6'
)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c962115f16f1b841689619e8ead182492c46b72a2897a7d78949eaabe738f004')

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  export GOTOOLCHAIN=local

  local build_time
  build_time="$(date -u -r LICENSE '+%Y-%m-%dT%H:%M:%SZ')"

  make VERSION="v$pkgver" BUILD_TIME="$build_time" build
}

check() {
  cd "$pkgname-$pkgver"

  bin/mxcli --version | grep -Fq "mxcli version v$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 bin/mxcli "$pkgdir/usr/bin/mxcli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  bin/mxcli completion bash > mxcli.bash
  bin/mxcli completion zsh > _mxcli
  bin/mxcli completion fish > mxcli.fish
  install -Dm644 mxcli.bash \
    "$pkgdir/usr/share/bash-completion/completions/mxcli"
  install -Dm644 _mxcli "$pkgdir/usr/share/zsh/site-functions/_mxcli"
  install -Dm644 mxcli.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/mxcli.fish"
}
