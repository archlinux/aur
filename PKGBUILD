pkgname=chip-tool
pkgver=1.4.2.0
pkgrel=3
pkgdesc="Matter CLI tool (chip-tool) from Project CHIP"
arch=('x86_64' 'aarch64')
url="https://github.com/project-chip/connectedhomeip"
license=('Apache')
depends=('dbus' 'openssl' 'avahi' 'zlib')
makedepends=('git' 'glib2-devel' 'gcc' 'make' 'pkgconf' 'python' 'python-virtualenv' 'ninja' 'gn')
source=('libwebsockets-gcc15.patch')
sha256sums=('SKIP')

prepare() {
  cd "$srcdir"
  rm -rf connectedhomeip
  git clone \
    --branch "v${pkgver}" \
    --depth=1 \
    https://github.com/project-chip/connectedhomeip.git \
    connectedhomeip

  cd connectedhomeip
  ./scripts/checkout_submodules.py --shallow --platform linux
  patch -Np1 -i "$srcdir/libwebsockets-gcc15.patch"
}

build() {
  cd "$srcdir/connectedhomeip"

  local build_home="$srcdir/build-home"
  local build_cache="$srcdir/build-cache"
  install -d \
    "$build_home/.config/pip" \
    "$build_cache/pip" \
    "$build_cache/pip-tools"

  export HOME="$build_home"
  export XDG_CACHE_HOME="$build_cache"
  export PIP_CACHE_DIR="$build_cache/pip"
  export PIP_TOOLS_CACHE_DIR="$build_cache/pip-tools"
  export PIP_CONFIG_FILE="$build_home/.config/pip/pip.conf"

  printf '[global]\ncache-dir = %s\n' "$PIP_CACHE_DIR" > "$PIP_CONFIG_FILE"

  source scripts/bootstrap.sh -p none

  local toolchain_bin="$srcdir/toolchain-bin"
  mkdir -p "$toolchain_bin"

  local tool
  for tool in ar nm objcopy objdump ranlib readelf strip; do
    ln -sf "/usr/bin/${tool}" "${toolchain_bin}/aarch64-linux-gnu-${tool}"
  done

  export PATH="${toolchain_bin}:$PATH"

  gn gen --check --fail-on-unused-args --root="examples/chip-tool" out/host
  ninja -C out/host -j1
}

package() {
  cd "$srcdir/connectedhomeip"
  install -d "${pkgdir}/usr/bin"
  install -m755 out/host/chip-tool "${pkgdir}/usr/bin/chip-tool"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
