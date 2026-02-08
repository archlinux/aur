# Maintainer: Maria <maria@kuuro.net>
pkgname=zerobrew-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='A drop-in, 5-20x faster, experimental Homebrew alternative'
arch=('x86_64' 'aarch64')
url='https://github.com/lucasgelfond/zerobrew'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('curl')
provides=('zerobrew' 'zb')
conflicts=('zerobrew' 'zerobrew-git')
options=('!strip' '!debug')

source_x86_64=(
  "zb::https://github.com/lucasgelfond/zerobrew/releases/download/v${pkgver}/zb-linux-x64"
  "LICENSE-MIT.md::https://raw.githubusercontent.com/lucasgelfond/zerobrew/v${pkgver}/LICENSE-MIT.md"
  "LICENSE-APACHE.md::https://raw.githubusercontent.com/lucasgelfond/zerobrew/v${pkgver}/LICENSE-APACHE.md"
)
sha256sums_x86_64=(
  '41d3ac764f5837b14eeec068e603bca9d5267e37a57520aa9eb464ef9e320006'
  'c5a4b4e7f1475fe021600420ddfd2c553fb3a0439863bce2188396a92ce69069'
  '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd'
)

source_aarch64=(
  "zb::https://github.com/lucasgelfond/zerobrew/releases/download/v${pkgver}/zb-linux-arm64"
  "LICENSE-MIT.md::https://raw.githubusercontent.com/lucasgelfond/zerobrew/v${pkgver}/LICENSE-MIT.md"
  "LICENSE-APACHE.md::https://raw.githubusercontent.com/lucasgelfond/zerobrew/v${pkgver}/LICENSE-APACHE.md"
)
sha256sums_aarch64=(
  '7abbce068aa0840057af66448a9c4c9a6f4ad5d01b08900de5f4c41e3de7b9ac'
  'c5a4b4e7f1475fe021600420ddfd2c553fb3a0439863bce2188396a92ce69069'
  '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd'
)

prepare() {
  cd "$srcdir"

  local zbx_asset
  case "$CARCH" in
    x86_64) zbx_asset='zbx-linux-x64' ;;
    aarch64) zbx_asset='zbx-linux-arm64' ;;
    *) return 0 ;;
  esac

  local zbx_url="https://github.com/lucasgelfond/zerobrew/releases/download/v${pkgver}/${zbx_asset}"
  local zbx_path="$srcdir/zbx"

  # install.sh behavior: try zbx, but don't fail package if it's unavailable.
  if ! curl -fsSL --retry 3 --retry-delay 1 --connect-timeout 10 "$zbx_url" -o "$zbx_path"; then
    printf '==> WARNING: Optional asset %s not found for v%s; continuing without zbx\n' "$zbx_asset" "$pkgver"
    return 0
  fi

  chmod +x "$zbx_path"

  # Verify optional binary digest if GitHub exposes it in release metadata.
  local api="https://api.github.com/repos/lucasgelfond/zerobrew/releases/tags/v${pkgver}"
  local metadata digest got
  if metadata=$(curl -fsSL "$api"); then
    digest=$(printf '%s' "$metadata" | tr -d '\n' | sed -n "s/.*\"name\":\"${zbx_asset}\"[^}]*\"digest\":\"sha256:\\([a-f0-9]\\{64\\}\\)\".*/\\1/p")
    if [[ -n "$digest" ]]; then
      got=$(sha256sum "$zbx_path" | awk '{print $1}')
      if [[ "$got" != "$digest" ]]; then
        error "Optional %s digest mismatch (expected %s got %s)" "$zbx_asset" "$digest" "$got"
      fi
    else
      printf '==> WARNING: No digest metadata for optional %s; installing without digest pin\n' "$zbx_asset"
    fi
  else
    printf '==> WARNING: Could not query release metadata for optional %s digest verification\n' "$zbx_asset"
  fi
}

package() {
  cd "$srcdir"

  install -Dm755 zb "$pkgdir/usr/bin/zb"
  if [[ -f zbx ]]; then
    install -Dm755 zbx "$pkgdir/usr/bin/zbx"
  fi

  install -Dm644 LICENSE-MIT.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
