# Maintainer: GGOBP <GGOBP at protonmail dot ch>
# Upstream packaging coordination: https://github.com/mendixlabs/mxcli/issues/799
#
# This unofficial community package contains the upstream nightly mxcli binary
# only. MxBuild, the Mendix Runtime, and other Mendix components are downloaded
# separately by mxcli only when a user explicitly requests them.

pkgname=mxcli-nightly-bin
pkgver=20260812.40ec849a
pkgrel=1
pkgdesc="Unofficial nightly binary of the mxcli Mendix development CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/mendixlabs/mxcli"
license=('Apache-2.0')
provides=("mxcli=$pkgver")
conflicts=('mxcli')
options=('!debug')

_commit=40ec849a01bb0094cbe2bcc999260325bc212fd6
_nightly_version=nightly-20260812-40ec849a

source=(
  "LICENSE-$_commit::$url/raw/$_commit/LICENSE"
  "README-$_commit.md::$url/raw/$_commit/README.md"
  "CHANGELOG-$_commit.md::$url/raw/$_commit/CHANGELOG.md"
)
source_x86_64=(
  "$pkgname-$pkgver-x86_64::$url/releases/download/nightly/mxcli-linux-amd64"
)
source_aarch64=(
  "$pkgname-$pkgver-aarch64::$url/releases/download/nightly/mxcli-linux-arm64"
)
sha256sums=(
  '50c1782657f9d425c58b6854d4976eeb25607a692d77e9ae3a75d5c059a08c53'
  'a3935a8ebe88bcb695dd07a2a0cdf4c04651eb63afec427ac59a3195d420efd9'
  '9d5df62d7ab17d511403decc673e7549d0af95c1ed0198ece737e3549b5a12ad'
)
sha256sums_x86_64=(
  '6493bfa916f8bbc8d4886ec3ed3e33c9297f67863f2210fbfc1bc96b83268d6b'
)
sha256sums_aarch64=(
  '34cca429f0f2dbc33eca3142b3fd72eff2010bedffc4b933cf6a4477ffffb6b9'
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
