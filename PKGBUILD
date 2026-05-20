# Maintainer: Rockykln <contact@rockykln.com>
pkgname=podctl-git
_pkgname=pods
pkgver=0.1.0.r1.gdce241e
pkgrel=1
pkgdesc="Linux control suite for AirPods — daemon, CLI, tray icon and case-open popup (git HEAD)"
arch=('x86_64' 'aarch64')
url="https://github.com/Rockykln/pods"
license=('MIT' 'Apache-2.0')
depends=('bluez-utils' 'dbus')
makedepends=('cargo' 'git')
optdepends=(
  'libpulse: audio verbs (volume, mute, profile, codec, default sink, latency, pods meter)'
  'systemd: pods install / pods reboot user services'
)
# Installs /usr/bin/pods, /usr/bin/podsd etc. Conflicts with the
# unrelated Podman tooling that uses the same `pods` binary name.
provides=('podctl' 'pods')
conflicts=('podctl' 'podctl-bin' 'pods' 'pods-bin' 'pods-git')
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

  install -Dm755 target/release/pods        "${pkgdir}/usr/bin/pods"
  install -Dm755 target/release/podsd       "${pkgdir}/usr/bin/podsd"
  install -Dm755 target/release/pods-tray   "${pkgdir}/usr/bin/pods-tray"
  install -Dm755 target/release/pods-popup  "${pkgdir}/usr/bin/pods-popup"

  install -Dm644 dist/pods.1   "${pkgdir}/usr/share/man/man1/pods.1"
  install -Dm644 dist/podsd.1  "${pkgdir}/usr/share/man/man1/podsd.1"

  install -Dm644 dist/completion/pods.bash \
    "${pkgdir}/usr/share/bash-completion/completions/pods"
  install -Dm644 dist/completion/_pods.zsh \
    "${pkgdir}/usr/share/zsh/site-functions/_pods"
  install -Dm644 dist/completion/pods.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/pods.fish"

  for unit in podsd.service pods-tray.service pods-popup.service; do
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
