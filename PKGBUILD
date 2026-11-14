# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/hornero>
# Native horneroctl binary from GitHub Releases (canonical distribution,
# same pattern as agent-toolkit-bin). _reltag + pkgver + per-arch
# sha256sums are patched at publish time by .github/workflows/release.yml;
# the zero placeholders below fail fast if this template is built directly.
# _reltag carries the real GitHub tag because pkgver must be
# makepkg-safe (no hyphens), while tags use hyphens (v0.2.0-preview2).
pkgname=horneroctl-bin
_reltag=horneroctl-v0.2.0-preview45
pkgver=0.2.0_preview45
pkgrel=1
pkgdesc='HorneroOS system CLI (native binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/HorneroOS/hornero'
license=('MIT')
options=('!strip')
optdepends=(
  'pacman-contrib: repository update checks via checkupdates (package check/updates/status)'
  'fakeroot: required by checkupdates when run as a regular user'
  'xdg-terminal-exec: launch terminals using Hornero terminal preferences'
  'git: install community Shell plugin packages from HTTPS repositories'
  'minisign: verify signed HorneroOS community plugin registry indexes'
  'hornero-shell: validate community plugin packages with the Shell-owned contract checker'
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
sha256sums_x86_64=('83bdeaa9b174e27bd1ccfa5785bb56e87ad8a1e959937831ea5f4eeb9d2db0e7' '65efff1ad78c00c974c9e88bdc5a1e217bbd1408b2594ee1212b117d9d944725')
sha256sums_aarch64=('ffbe9dae799b954f1d301d025f753260928c0c5f93fe8c727e67e390b9e9a057' '0d0a5406585504432ecf117b96bfbb0553daf0af6d12aa51f23f2b5f694d5bfb')

package() {
  install -Dm755 "${srcdir}/horneroctl-${pkgver}" "${pkgdir}/usr/bin/horneroctl"
}
