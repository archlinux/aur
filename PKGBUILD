# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/hornero>
# Native horneroctl binary from GitHub Releases (canonical distribution,
# same pattern as agent-toolkit-bin). _reltag + pkgver + per-arch
# sha256sums are patched at publish time by .github/workflows/release.yml;
# the zero placeholders below fail fast if this template is built directly.
# _reltag carries the real GitHub tag because pkgver must be
# makepkg-safe (no hyphens), while tags use hyphens (v0.2.0-preview2).
pkgname=horneroctl-bin
_reltag=horneroctl-v0.2.0-preview63
pkgver=0.2.0_preview63
pkgrel=1
pkgdesc='HorneroOS system CLI (native binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/HorneroOS/hornero'
license=('MIT')
depends=('glibc' 'sqlite' 'gcc-libs')
provides=('horneroctl')
conflicts=('horneroctl')
optdepends=(
  'pacman-contrib: repository update checks via checkupdates (package check/updates/status)'
  'fakeroot: required by checkupdates when run as a regular user'
  'xdg-terminal-exec: launch terminals using Hornero terminal preferences'
  'git: install community Shell plugin packages from HTTPS repositories'
  'minisign: verify signed HorneroOS community plugin registry indexes'
  'hornero-shell: validate community plugin packages with the Shell-owned contract checker'
  'flatpak: install and run sandboxed desktop applications via horneroctl store'
  'appstream: AppStream metadata support for Flatpak applications'
  'fuse2: run user-space AppImage packages via horneroctl store appimage'
  'xdg-desktop-portal-gtk: GTK desktop portal integration for Flatpak apps'
)
# The release public key ships AS A PACKAGE SOURCE on purpose: AUR
# snapshot tarballs only include the PKGBUILD, .SRCINFO and declared
# local sources, so this is the only shipped file every install path
# (git clone, snapshot, AUR helper) is guaranteed to receive. Import it
# once with `gpg --import hornero-release.pub` (helpers may also
# fetch the same key from public keyservers); its fingerprint must
# match validpgpkeys below. The stamp step refreshes this file and its
# sha256 from packaging/keys/hornero-release.pub.asc at release time.
source=('hornero-release.pub')
sha256sums=('4f18f92773a924e71b1af2045be932f7bc8fa16dcff6266d5c37cf1114605afb')
source_x86_64=(
  "horneroctl-${pkgver}::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-x86_64"
  "horneroctl-${pkgver}.asc::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-x86_64.asc"
)
source_aarch64=(
  "horneroctl-${pkgver}::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-arm64"
  "horneroctl-${pkgver}.asc::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-arm64.asc"
)
# Set to the committed release-key fingerprint by the release workflow.
# An unstamped template intentionally cannot pass makepkg signature checks.
# The same key ships next to this PKGBUILD in keys/pgp/<fingerprint>.asc
# (the Arch source-package convention) and on public keyservers, so AUR
# helpers and makepkg users can obtain it without trusting a keyserver
# response blindly: the fingerprint below is the pinned trust anchor and
# makepkg rejects any signature whose key does not match it. Never
# weaken signature verification to work around a missing key; see
# docs/RELEASE_SIGNING.md.
validpgpkeys=('FCFBEE43925AB5429362278AE59EAB44AA2498DC')
sha256sums_x86_64=('db2dca71bef953217f50ed266039c52eb8ecb1d3fdfd6e3a8d509d40c7db95dd' '2892091cc06e89b462417025922d439e8a7e7e251630ce30985242dd201dfefd')
sha256sums_aarch64=('ba179d059cef65394f99db986ba7691e0927dfe58641036ad9ea9e971eea6f88' 'ac260004bec15d00d74c232f33390f8306c0096f5cefa7aa400600161722d438')

package() {
  install -Dm755 "${srcdir}/horneroctl-${pkgver}" "${pkgdir}/usr/bin/horneroctl"
  if [[ -f "${srcdir}/LICENSE" ]]; then
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
  if "${pkgdir}/usr/bin/horneroctl" completions bash >/dev/null 2>&1; then
    install -Dm644 <("${pkgdir}/usr/bin/horneroctl" completions bash) \
      "${pkgdir}/usr/share/bash-completion/completions/horneroctl"
    install -Dm644 <("${pkgdir}/usr/bin/horneroctl" completions zsh) \
      "${pkgdir}/usr/share/zsh/site-functions/_horneroctl"
    install -Dm644 <("${pkgdir}/usr/bin/horneroctl" completions fish) \
      "${pkgdir}/usr/share/fish/vendor_completions.d/horneroctl.fish"
  fi
}
