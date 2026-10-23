# Maintainer: Rockykln <contact@rockykln.com>
pkgname=podctl-bin
_pkgname=podctl
pkgver=0.4.0
pkgrel=1
pkgdesc="Linux control suite for AirPods — daemon, CLI, tray icon and case-open popup"
arch=('x86_64' 'aarch64')
url="https://github.com/Rockykln/podctl"
license=('MIT' 'Apache-2.0')
depends=('bluez-utils' 'dbus')
optdepends=(
  'libpulse: audio verbs (volume, mute, profile, codec, default sink, latency, podctl meter)'
  'pipewire-audio: conversation-awareness volume stage measures the music level (pw-record)'
  'systemd: podctl install / podctl reboot user services'
)
provides=('podctl')
conflicts=('podctl' 'podctl-git')
source_x86_64=("${_pkgname}-${pkgver}-x86_64-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/podctl-${pkgver}-x86_64-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/podctl-${pkgver}-aarch64-linux-musl.tar.gz")
sha256sums_x86_64=('e2a8b65a63ef05528234400c911fc1f47fa69c297c4d28cccc43bd586c87f547')
sha256sums_aarch64=('b38c83f639390a14bb949cc267bd2a71b1a4729d39e195523a9fb0d9b753b853')
options=('!strip')   # musl-static binary, already stripped by release workflow

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-linux-musl"

  install -Dm755 podctl         "${pkgdir}/usr/bin/podctl"
  install -Dm755 podctld        "${pkgdir}/usr/bin/podctld"
  install -Dm755 podctl-tray    "${pkgdir}/usr/bin/podctl-tray"
  install -Dm755 podctl-popup   "${pkgdir}/usr/bin/podctl-popup"

  install -Dm644 podctl.1   "${pkgdir}/usr/share/man/man1/podctl.1"
  install -Dm644 podctld.1  "${pkgdir}/usr/share/man/man1/podctld.1"

  install -Dm644 completion/podctl.bash \
    "${pkgdir}/usr/share/bash-completion/completions/podctl"
  install -Dm644 completion/_podctl.zsh \
    "${pkgdir}/usr/share/zsh/site-functions/_podctl"
  install -Dm644 completion/podctl.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/podctl.fish"

  # The shipped .service files use /usr/local/bin as a placeholder so
  # `podctl install` can replace it with the per-user XDG path. For the
  # AUR package the binaries live in /usr/bin, so patch that in.
  for unit in podctld.service podctl-tray.service podctl-popup.service; do
    sed "s|/usr/local/bin|/usr/bin|g" "${unit}" \
      > "${srcdir}/${unit}.fixed"
    install -Dm644 "${srcdir}/${unit}.fixed" \
      "${pkgdir}/usr/lib/systemd/user/${unit}"
  done

  local ext=podctl@rockykln.com
  install -Dm644 "gnome-shell-extension/${ext}/metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${ext}/metadata.json"
  install -Dm644 "gnome-shell-extension/${ext}/extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${ext}/extension.js"

  install -Dm644 LICENSE-MIT     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 NOTICE.md       "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.md"
  install -Dm644 README.md       "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 INSTALL.md      "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.md"
  install -Dm644 CHANGELOG.md    "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
