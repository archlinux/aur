# Maintainer: GGOBP <GGOBP at protonmail dot ch>
# Upstream packaging coordination: https://github.com/mendixlabs/mxcli/issues/799
#
# This unofficial community package contains the upstream nightly mxcli binary
# only. MxBuild, the Mendix Runtime, and other Mendix components are downloaded
# separately by mxcli only when a user explicitly requests them.

pkgname=mxcli-nightly-bin
pkgver=20261004.2233ce1e
pkgrel=1
pkgdesc="Unofficial nightly binary of the mxcli Mendix development CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/mendixlabs/mxcli"
license=('Apache-2.0')
provides=("mxcli=$pkgver")
conflicts=('mxcli')
options=('!debug')

_commit=2233ce1e95772dd2a4c6d0eab34900eea5a6e0dc
_nightly_version=nightly-20261004-2233ce1e

source=(
  "LICENSE-$_commit::$url/raw/$_commit/LICENSE"
  "README-$_commit.md::$url/raw/$_commit/README.md"
  "CHANGELOG-$_commit.md::$url/raw/$_commit/CHANGELOG.md"
)
source_x86_64=(
  "$pkgname-$pkgver-x86_64::https://github.com/GG-O-BP/mxcli/releases/download/$_nightly_version/mxcli-linux-amd64"
)
source_aarch64=(
  "$pkgname-$pkgver-aarch64::https://github.com/GG-O-BP/mxcli/releases/download/$_nightly_version/mxcli-linux-arm64"
)
sha256sums=(
  '50c1782657f9d425c58b6854d4976eeb25607a692d77e9ae3a75d5c059a08c53'
  '9c8c76da94c15c95065b72ab8f3ca5886e25008eec03e833d220ad836f6cb73b'
  '63d6532f18cb7389eb9c051674002cf26c1e4b55c8066f17c34839950405cbb4'
)
sha256sums_x86_64=(
  'd8057a27ce450cd5530433ddddb0737f4e98759374b12715e710a714d8586ba0'
)
sha256sums_aarch64=(
  '197c3cbde156ec517123c565227928d5b505546ba40a8af57dc53d23a44b7f51'
)

_binary() {
  printf '%s/%s-%s-%s' "$srcdir" "$pkgname" "$pkgver" "$CARCH"
}

prepare() {
  chmod +x "$(_binary)"
}

check() {
  "$(_binary)" --version | grep -Fq "mxcli version $_nightly_version"
}

package() {
  install -Dm755 "$(_binary)" "$pkgdir/usr/bin/mxcli"
  install -Dm644 "$srcdir/LICENSE-$_commit" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README-$_commit.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG-$_commit.md" \
    "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  "$(_binary)" completion bash > mxcli.bash
  "$(_binary)" completion zsh > _mxcli
  "$(_binary)" completion fish > mxcli.fish
  install -Dm644 mxcli.bash \
    "$pkgdir/usr/share/bash-completion/completions/mxcli"
  install -Dm644 _mxcli "$pkgdir/usr/share/zsh/site-functions/_mxcli"
  install -Dm644 mxcli.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/mxcli.fish"
}
