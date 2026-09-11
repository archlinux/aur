# Maintainer: GGOBP <GGOBP at protonmail dot ch>
# Upstream packaging coordination: https://github.com/mendixlabs/mxcli/issues/799
#
# This unofficial community package contains the upstream nightly mxcli binary
# only. MxBuild, the Mendix Runtime, and other Mendix components are downloaded
# separately by mxcli only when a user explicitly requests them.

pkgname=mxcli-nightly-bin
pkgver=20260909.ca9b90ed
pkgrel=1
pkgdesc="Unofficial nightly binary of the mxcli Mendix development CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/mendixlabs/mxcli"
license=('Apache-2.0')
provides=("mxcli=$pkgver")
conflicts=('mxcli')
options=('!debug')

_commit=ca9b90edbc55b83f419476f92538bb0c7118cd15
_nightly_version=nightly-20260909-ca9b90ed

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
  'a1675a189a948d25aa825e324438f6cff41252dded7c26df4d76c0e605bcc9e6'
)
sha256sums_x86_64=(
  '7444c21efa1337eae042c1bec5868848ef84e7d260a70eca6f940caa1c5c9699'
)
sha256sums_aarch64=(
  'bf8793ee86ccbecae40ed9f102f13024dbc9f038ba1058ab0f8c0dd777428830'
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
