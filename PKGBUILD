pkgname=waybar-niri-taskbar-focused-git
_pkgname=waybar-niri-taskbar-focused
pkgver=0.4.0.r0.g0000000
pkgrel=1
pkgdesc='Focused-workspace Niri taskbar CFFI module for Waybar'
arch=('x86_64')
url='https://github.com/jR4dh3y/niri-taskbar'
license=('MIT')
depends=(
  'gtk3'
  'waybar'
)
makedepends=(
  'cargo'
  'git'
  'rust'
)
provides=('waybar-niri-taskbar-focused')
conflicts=('waybar-niri-taskbar-focused')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  if version="$(git describe --long --tags --match 'v*' 2>/dev/null)"; then
    printf '%s\n' "${version}" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.4.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 target/release/libniri_taskbar.so \
    "${pkgdir}/usr/lib/waybar/modules/libniri_taskbar-focused.so"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
