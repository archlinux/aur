# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Standa Lukeš (https://aur.archlinux.org/account/exyi) (package 'mullvad-udp-over-tcp')

_pkgname=mullvad-udp-over-tcp
pkgname="${_pkgname}-git"
pkgver=0.4.0+35.r201.20250918.13e894a
pkgrel=1
pkgdesc="Proxy UDP traffic over a TCP stream (provides tcp2udp and udp2tcp binaries). Latest git checkout."
url="https://github.com/mullvad/udp-over-tcp"
makedepends=(
  'git'
  'cargo'
)
checkdepends=(
  'cargo'
)
depends=(
  'gcc-libs'
  'glibc'
)
arch=(
  'i686'
  'x86_64'
  'armv7h'
  'armv6h'
  'aarch64'
)
license=('MIT')
backup=()
source=(
  "${_pkgname}::git+https://github.com/mullvad/udp-over-tcp.git"
)
sha256sums=(
  'SKIP'
)
provides=(
  "${_pkgname}=${pkgver}"
  "tcp2udp=${pkgver}"
  "udp2tcp=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "tcp2udp"
  "udp2tcp"
)
replaces=()

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' Cargo.toml | awk -F= '{print $2}' | tr -d \"\'' ')"
  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/.cargo"
  cargo fetch

  git log > git.log
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/.cargo"
  cargo build --release --frozen --all-features --locked
}

check() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/.cargo"
  cargo test
}

package() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/.cargo"

  install -Dvm755 -t "${pkgdir}/usr/bin/"  target/release/{tcp2udp,udp2tcp}

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/"      git.log CHANGELOG.md README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/"  LICENSE-APACHE LICENSE-MIT
}
