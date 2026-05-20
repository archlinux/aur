# Maintainer: Rockykln <contact@rockykln.com>
pkgname=podctl-bin
_pkgname=pods
pkgver=0.1.0
pkgrel=1
pkgdesc="Linux control suite for AirPods — daemon, CLI, tray icon and case-open popup"
arch=('x86_64')
url="https://github.com/Rockykln/pods"
license=('MIT' 'Apache-2.0')
depends=('bluez-utils' 'dbus')
optdepends=(
  'libpulse: audio verbs (volume, mute, profile, codec, default sink, latency, pods meter)'
  'systemd: pods install / pods reboot user services'
)
# Installs /usr/bin/pods, /usr/bin/podsd etc. Conflicts with the
# unrelated Podman tooling that uses the same `pods` binary name.
provides=('podctl' 'pods')
conflicts=('podctl' 'podctl-git' 'pods' 'pods-bin' 'pods-git')
source=("${_pkgname}-${pkgver}-x86_64-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/pods-${pkgver}-x86_64-linux-musl.tar.gz")
sha256sums=('b64a5ad9c0fb2f5dd3df1d40eae9d10c05bd9399ba853de3cebe270dc93cccc5')
options=('!strip')   # musl-static binary, already stripped by release workflow

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-x86_64-linux-musl"

  install -Dm755 pods         "${pkgdir}/usr/bin/pods"
  install -Dm755 podsd        "${pkgdir}/usr/bin/podsd"
  install -Dm755 pods-tray    "${pkgdir}/usr/bin/pods-tray"
  install -Dm755 pods-popup   "${pkgdir}/usr/bin/pods-popup"

  install -Dm644 pods.1   "${pkgdir}/usr/share/man/man1/pods.1"
  install -Dm644 podsd.1  "${pkgdir}/usr/share/man/man1/podsd.1"

  install -Dm644 completion/pods.bash \
    "${pkgdir}/usr/share/bash-completion/completions/pods"
  install -Dm644 completion/_pods.zsh \
    "${pkgdir}/usr/share/zsh/site-functions/_pods"
  install -Dm644 completion/pods.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/pods.fish"

  # The shipped .service files use /usr/local/bin as a placeholder so
  # `pods install` can replace it with the per-user XDG path. For the
  # AUR package the binaries live in /usr/bin, so patch that in.
  for unit in podsd.service pods-tray.service pods-popup.service; do
    sed "s|/usr/local/bin|/usr/bin|g" "${unit}" \
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
