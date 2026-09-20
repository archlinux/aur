# Maintainer: GGOBP <GGOBP at protonmail dot ch>
# Upstream packaging coordination: https://github.com/mendixlabs/mxcli/issues/799
#
# This unofficial community package contains the upstream nightly mxcli binary
# only. MxBuild, the Mendix Runtime, and other Mendix components are downloaded
# separately by mxcli only when a user explicitly requests them.

pkgname=mxcli-nightly-bin
pkgver=20260919.756fa00e
pkgrel=1
pkgdesc="Unofficial nightly binary of the mxcli Mendix development CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/mendixlabs/mxcli"
license=('Apache-2.0')
provides=("mxcli=$pkgver")
conflicts=('mxcli')
options=('!debug')

_commit=756fa00e0cb2e5f741fe4bd9d1de7bef62581cd3
_nightly_version=nightly-20260919-756fa00e

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
  '5e76f674f3b26cec41c7a0b8918ec8663c6d527e4f961ac36e80c9efaaaa5824'
  'a1f1578d8a88f425412e5a0ead258d010d4f7f9be1b75d39ac811a10fbe7c0f1'
)
sha256sums_x86_64=(
  'f2b8f09615d96a1ed8367fdbf75fb798c8bb5b9239bf8da9ae54b7ec10717bff'
)
sha256sums_aarch64=(
  '4922c42dec6bc9160226a91e6893c66b1e1f64aa3c98d3b80ceea68aef7c3f64'
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
