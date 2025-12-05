# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=1.0.134
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode-bin')
depends=('fzf' 'ripgrep')
makedepends=('git' 'bun-bin' 'go')

source=("opencode-${pkgver}.tar.gz::https://github.com/sst/opencode/archive/v${pkgver}${_subver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "opencode-${pkgver}"
  bun install
  cd ./packages/opencode
  OPENCODE_CHANNEL=latest OPENCODE_VERSION=1.0.134 bun run ./script/build.ts --single
}

package() {
  cd "opencode-${pkgver}/packages/opencode"
  mkdir -p "${pkgdir}/usr/bin"
  target_arch="x64"
  case "$CARCH" in
    x86_64) target_arch="x64" ;;
    aarch64) target_arch="arm64" ;;
    *) printf "unsupported architecture: %s\n" "$CARCH" >&2 ; return 1 ;;
  esac
  libc=""
  if command -v ldd >/dev/null 2>&1; then
    if ldd --version 2>&1 | grep -qi musl; then
      libc="-musl"
    fi
  fi
  if [ -z "$libc" ] && ls /lib/ld-musl-* >/dev/null 2>&1; then
    libc="-musl"
  fi
  base=""
  if [ "$target_arch" = "x64" ]; then
    if ! grep -qi avx2 /proc/cpuinfo 2>/dev/null; then
      base="-baseline"
    fi
  fi
  bin="dist/opencode-linux-${target_arch}${base}${libc}/bin/opencode"
  if [ ! -f "$bin" ]; then
    printf "unable to find binary for %s%s%s\n" "$target_arch" "$base" "$libc" >&2
    return 1
  fi
  install -Dm755 "$bin" "${pkgdir}/usr/bin/opencode"
}
