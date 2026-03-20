# Maintainer: Robert Rosca <robert@rosca.dev>

pkgname=nono-ai-git
_pkgname=nono
pkgver=0.20.0.r1.g3edf1e1
pkgrel=1
pkgdesc='Secure, kernel-enforced sandbox for AI agents, MCP servers and LLM workloads using Landlock'
arch=('x86_64' 'aarch64')
url='https://github.com/always-further/nono'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=(
  'libsecret: keyring credential storage via Secret Service API'
  'gnome-keyring: GNOME-based credential storage'
)
provides=('nono' 'nono-ai')
conflicts=('nono' 'nono-ai')
options=(!lto)
source=("git+https://github.com/always-further/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Prefer tag-relative version (e.g. 0.20.0.r5.gabcdef1); fall back for
  # repos with no tags at all
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"
  export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-Wl,-z,relro,-z,now"
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=/build"
  export CARGO_INCREMENTAL=0
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo test --frozen --lib
}

package() {
  cd "${_pkgname}"

  install -Dm755 "${srcdir}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install built-in profile data if present
  if [ -d data ]; then
    find data -type f -exec install -Dm644 '{}' \
      "${pkgdir}/usr/share/${_pkgname}/{}" \;
  fi
}
