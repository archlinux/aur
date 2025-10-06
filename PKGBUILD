# Maintainer: stealthy_doggo <stealthy_doggo+aur at proton dot me>

_pkgname=chroma-visualizer
_srcname=chroma
_giturl="https://github.com/yuri-xyz/chroma.git"
_gitbranch="master"
pkgname=${_pkgname}-git
pkgver=r42.b4b4325
pkgrel=1
pkgdesc='A Rust-based, ASCII art shader audio visualizer for your terminal!'
arch=('x86_64')
url='https://github.com/yuri-xyz/chroma'
license=('GPL-3.0-or-later')
depends=('vulkan-icd-loader' 'alsa-lib')
makedepends=('git' 'rust' 'cargo')
optdepends=(
  'pipewire: modern audio server (recommended)'
  'pipewire-alsa: ALSA compatibility for PipeWire'
  'vulkan-radeon: AMD Vulkan driver'
  'vulkan-intel: Intel Vulkan driver'
  'nvidia-utils: NVIDIA Vulkan driver'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'chroma' 'chroma-git')
source=("${_srcname}::git+${_giturl}#branch=${_gitbranch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}" || exit 1
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//;s/-/./g'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_srcname}" || exit 1
  cargo build --locked --release --features audio
}

check() {
  cd "${srcdir}/${_srcname}" || exit 1
  cargo test --locked --release --features audio
}

package() {
  cd "${srcdir}/${_srcname}" || exit 1

  # Build output binary is named 'chroma' per Cargo.toml; install as 'chroma'
  install -Dm755 "target/release/chroma" "${pkgdir}/usr/bin/chroma"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}


