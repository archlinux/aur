# Maintainer: Rockykln <contact@rockykln.com>
pkgname=podctl-git
_pkgname=podctl
pkgver=0.1.0.r1.g2c15e1f
pkgrel=1
pkgdesc="Linux control suite for AirPods — daemon, CLI, tray icon and case-open popup (git HEAD)"
arch=('x86_64' 'aarch64')
url="https://github.com/Rockykln/podctl"
license=('MIT' 'Apache-2.0')
depends=('bluez-utils' 'dbus')
makedepends=('cargo' 'git')
optdepends=(
  'libpulse: audio verbs (volume, mute, profile, codec, default sink, latency, podctl meter)'
  'systemd: podctl install / podctl reboot user services'
)
provides=('podctl')
conflicts=('podctl' 'podctl-bin')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local base
  base=$(grep -m1 '^version' Cargo.toml | sed -E 's/.*"([^"]+)".*/\1/')
  printf '%s.r%s.g%s' \
    "${base}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/.cargo"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/.cargo"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --all-targets
}

check() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/.cargo"
  cargo test --frozen --release
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 target/release/podctl        "${pkgdir}/usr/bin/podctl"
  install -Dm755 target/release/podctld       "${pkgdir}/usr/bin/podctld"
  install -Dm755 target/release/podctl-tray   "${pkgdir}/usr/bin/podctl-tray"
  install -Dm755 target/release/podctl-popup  "${pkgdir}/usr/bin/podctl-popup"

  install -Dm644 dist/podctl.1   "${pkgdir}/usr/share/man/man1/podctl.1"
  install -Dm644 dist/podctld.1  "${pkgdir}/usr/share/man/man1/podctld.1"

  install -Dm644 dist/completion/podctl.bash \
    "${pkgdir}/usr/share/bash-completion/completions/podctl"
  install -Dm644 dist/completion/_podctl.zsh \
    "${pkgdir}/usr/share/zsh/site-functions/_podctl"
  install -Dm644 dist/completion/podctl.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/podctl.fish"

  for unit in podctld.service podctl-tray.service podctl-popup.service; do
    sed "s|/usr/local/bin|/usr/bin|g" "dist/${unit}" \
      > "${srcdir}/${unit}.fixed"
    install -Dm644 "${srcdir}/${unit}.fixed" \
      "${pkgdir}/usr/lib/systemd/user/${unit}"
  done

  install -Dm644 LICENSE-MIT     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 NOTICE.md       "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.md"
  install -Dm644 README.md       "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 INSTALL.md      "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.md"
  install -Dm644 CHANGELOG.md    "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
