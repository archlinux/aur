pkgname=nighterrors-git
_pkgname=${pkgname%-git}
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Ultra-light Rust Wayland blue-light filter daemon for Hyprland, Niri, and wlroots compositors'
arch=('x86_64')
url='https://github.com/OneNoted/nighterrors'
license=('Apache')
depends=('gcc-libs' 'glibc' 'wayland')
makedepends=('cargo' 'git')
provides=("nighterrors=${pkgver}")
conflicts=('nighterrors' 'nighterrors-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    local describe_output tag revision ghash
    describe_output=$(git describe --long --tags --abbrev=7)
    IFS=- read -r tag revision ghash <<< "${describe_output}"
    tag=${tag#v}
    printf '%s.r%s.%s\n' "${tag}" "${revision}" "${ghash}"
  else
    printf 'r%s.g%s\n' \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --locked --release
}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo test --locked
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
