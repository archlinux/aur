# Maintainer: GGOBP <GGOBP at protonmail dot ch>
# Upstream packaging coordination: https://github.com/mendixlabs/mxcli/issues/799
#
# This unofficial community package contains the upstream nightly mxcli binary
# only. MxBuild, the Mendix Runtime, and other Mendix components are downloaded
# separately by mxcli only when a user explicitly requests them.

pkgname=mxcli-nightly-bin
pkgver=20260905.41c55d09
pkgrel=1
pkgdesc="Unofficial nightly binary of the mxcli Mendix development CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/mendixlabs/mxcli"
license=('Apache-2.0')
provides=("mxcli=$pkgver")
conflicts=('mxcli')
options=('!debug')

_commit=41c55d0985e10e752058bcdad9dee8e799c0f51c
_nightly_version=nightly-20260905-41c55d09

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
  '456c393880c987a682122484960e821ab2325c70d53ce769ecf76d95a0b11702'
  '4a60b3200feb0f8733c07e8733834cca2925ea205495160945bdd5ff6a581ccc'
)
sha256sums_x86_64=(
  '48b5dd9d0881fbfaee29f735e683f5cf3a0d8c8a35a8fd8003a0554bfc472d7d'
)
sha256sums_aarch64=(
  '848f54da45ac6c41e42b91e92af30d7a93ac2ebe3acc249fa8d1d2e4c8232b4d'
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
