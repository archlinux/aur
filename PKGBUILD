pkgname=factory-cli-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Factory CLI (prebuilt binary - installs 'droid')"
arch=('x86_64' 'aarch64')
url="https://factory.ai"
license=('custom') # <-- replace with upstream license
depends=('curl')
makedepends=()
optdepends=('ripgrep: Use system ripgrep instead of the bundled one')
conflicts=('droid')
source=()
md5sums=()

prepare() {
  : # no-op; downloads done in package()
}

package() {
  install -d "$pkgdir"/usr/lib/factory
  install -d "$pkgdir"/usr/bin

  TMP="$srcdir/tmp.$$"
  mkdir -p "$TMP"

  # platform is linux for Arch packages
  platform="linux"
  case "$CARCH" in
    x86_64) architecture="x64" ;;
    aarch64) architecture="arm64" ;;
    *) architecture="$CARCH" ;;
  esac

  # detect AVX2 on x64; builders will select the appropriate binary
  arch_suffix=""
  if [ "$architecture" = "x64" ]; then
    if grep -qi avx2 /proc/cpuinfo 2>/dev/null; then
      arch_suffix=""
    else
      arch_suffix="-baseline"
    fi
  fi

  droid_arch="${architecture}${arch_suffix}"

  base_url="https://downloads.factory.ai/factory-cli/releases/$pkgver/$platform/$droid_arch"
  droid_url="$base_url/droid"
  droid_sha_url="$base_url/droid.sha256"

  echo "Downloading droid from $droid_url ..."
  curl -fsSL -o "$TMP/droid" "$droid_url" || return 1
  curl -fsSL -o "$TMP/droid.sha256" "$droid_sha_url" || return 1

  expected="$(awk '{print $1}' "$TMP/droid.sha256")"
  actual="$(sha256sum "$TMP/droid" | awk '{print $1}')"
  if [ -n "$expected" ] && [ "$expected" != "$actual" ]; then
    echo "droid checksum mismatch (expected: $expected, actual: $actual)" >&2
    return 1
  fi

  install -m755 "$TMP/droid" "$pkgdir"/usr/lib/factory/droid.real

  # ripgrep vendoring (optional). Recommend depending on system ripgrep instead.
  rg_arch="${architecture}"
  rg_url="https://downloads.factory.ai/ripgrep/$platform/$rg_arch/rg"
  rg_sha_url="$rg_url.sha256"

  echo "Downloading ripgrep from $rg_url ..."
  curl -fsSL -o "$TMP/rg" "$rg_url" || return 1
  curl -fsSL -o "$TMP/rg.sha256" "$rg_sha_url" || return 1

  expected_rg="$(awk '{print $1}' "$TMP/rg.sha256")"
  actual_rg="$(sha256sum "$TMP/rg" | awk '{print $1}')"
  if [ -n "$expected_rg" ] && [ "$expected_rg" != "$actual_rg" ]; then
    echo "ripgrep checksum mismatch (expected: $expected_rg, actual: $actual_rg)" >&2
    return 1
  fi

  install -m755 "$TMP/rg" "$pkgdir"/usr/lib/factory/rg.real

  # wrapper that ensures bundled rg is preferred only for this tool
  cat > "$pkgdir"/usr/bin/droid <<'EOF'
#!/bin/sh
export PATH="/usr/lib/factory:$PATH"
exec /usr/lib/factory/droid.real "$@"
EOF
  chmod 755 "$pkgdir"/usr/bin/droid

  rm -rf "$TMP"
}
