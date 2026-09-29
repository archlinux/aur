# Maintainer: Garrett Goebel <garrett.goebel@gmail.com>
_pkgname=hipfire
pkgname=hipfire-git
pkgver=0.3.1.r57
pkgrel=1
pkgdesc="High-performance AMD GPU inference runtime framework (VCS version)"
arch=('x86_64')
url="https://github.com/warpfront/hipfire"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'rocm-hip-sdk' 'rocm-opencl-sdk')
makedepends=('git' 'cargo' 'clang' 'cmake')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
options=('!lto')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Attempt to get version from git tags
  if _ver=$(git describe --long --tags 2>/dev/null); then
    echo "${_ver}" | sed 's/^v//;s/-\([0-9]\+\)-g.*/.r\1/'
  else
    # Fallback: Extract version from Cargo.toml and append commit count
    _basever=$(grep -m1 '^version =' Cargo.toml | cut -d'"' -f2)
    _revcount=$(git rev-list --count HEAD)
    printf "%s.r%s" "${_basever}" "${_revcount}"
  fi
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  
  # Fetch dependencies into build workspace cache
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_PROFILE_RELEASE_DEBUG=1
  export CARGO_TARGET_DIR="target"
  
  cargo build --frozen --release --features deltanet \
    -p hipfire-daemon \
    -p hipfire-cli \
    -p hipfire-tui
}

package() {
  cd "${srcdir}/${_pkgname}"

  # 1. Install internal binaries to /usr/lib/hipfire/
  install -Dm755 target/release/daemon "${pkgdir}/usr/lib/${_pkgname}/daemon"
  install -Dm755 target/release/hipfire "${pkgdir}/usr/lib/${_pkgname}/hipfire"
  install -Dm755 target/release/hipfire-tui "${pkgdir}/usr/lib/${_pkgname}/hipfire-tui"

  # 2. Inject system entry-point wrapper script into /usr/bin/hipfire
  install -d "${pkgdir}/usr/bin"
  cat << 'EOF' > "${pkgdir}/usr/bin/${_pkgname}"
#!/bin/sh
# Environment exports required for upstream find_daemon() resolution
export HIPFIRE_DAEMON_BIN="${HIPFIRE_DAEMON_BIN:-/usr/lib/hipfire/daemon}"
export HIPFIRE_TUI_BIN="${HIPFIRE_TUI_BIN:-/usr/lib/hipfire/hipfire-tui}"

exec /usr/lib/hipfire/hipfire "$@"
EOF
  chmod 0755 "${pkgdir}/usr/bin/${_pkgname}"

  # 3. Install Upstream System Documentation
  if [ -f README.md ]; then
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  fi

  # 4. Install Licenses
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
