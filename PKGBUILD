# Maintainer: Karasowl <https://github.com/Karasowl>
#
# System package for KodexBar Suite: Plasma widget, ai selector, quota engine
# (native Claude/Codex/Grok quotas; Antigravity and Codex/Grok fallback via optional
# codexbar-cli-bin), panel adapter, and tray indicator. Optional desktop-specific
# runtime deps are listed in optdepends so a pure Arch/CachyOS install stays minimal.

pkgname=kodexbar-suite
pkgver=0.9.1
pkgrel=1
pkgdesc='KodexBar Suite: Plasma widget, ai CLI, native Claude/Codex/Grok quotas (optional codexbar for Antigravity)'
arch=('any')
url='https://github.com/Karasowl/KodexBar-Suite'
license=('MIT')
depends=('python')
optdepends=(
  'codexbar-cli-bin: Antigravity quotas and Codex/Grok fallback when the native path fails'
  'plasma-workspace: Plasma 6 widget for ordered multi-provider quotas'
  'plasma5support: DataEngine/DataSource backend used by the Plasma widget'
  'konsole: open the ai selector in a terminal from the Plasma widget'
  'python-gobject: required by kodexbar-tray StatusNotifierItem indicator'
  'libayatana-appindicator: AppIndicator bindings for kodexbar-tray'
  'wl-clipboard: Wayland clipboard support for ai recover --copy'
  'xclip: X11 clipboard support for ai recover --copy'
  'xsel: alternate X11 clipboard support for ai recover --copy'
)
install=kodexbar-suite.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Karasowl/KodexBar-Suite/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a68b68e7f842b6076273554ce5407431676465c562bf3dce78afe1c0a55ec042')

package() {
  cd "${srcdir}/KodexBar-Suite-${pkgver}"

  local payload="${pkgdir}/usr/lib/kodexbar-suite/ai-cli-control"
  install -d "${payload}"
  # Lifecycle scripts (install.sh / uninstall.sh) stay out of the pacman payload.
  # On a packaged system pacman owns install and remove.
  install -m755 \
    packages/ai-cli-control/ai \
    packages/ai-cli-control/kodexbar-quotas \
    packages/ai-cli-control/kodexbar-panel \
    packages/ai-cli-control/kodexbar-tray \
    packages/ai-cli-control/recover.py \
    "${payload}/"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/kodexbar-suite/ai-cli-control/ai "${pkgdir}/usr/bin/ai"
  ln -s /usr/lib/kodexbar-suite/ai-cli-control/kodexbar-quotas "${pkgdir}/usr/bin/kodexbar-quotas"
  ln -s /usr/lib/kodexbar-suite/ai-cli-control/kodexbar-panel "${pkgdir}/usr/bin/kodexbar-panel"
  ln -s /usr/lib/kodexbar-suite/ai-cli-control/kodexbar-tray "${pkgdir}/usr/bin/kodexbar-tray"

  # Distributable plasmoid only: metadata.json and contents/ (no tests, scripts,
  # docs of development, screenshots, or dotfiles).
  local plasmoid="${pkgdir}/usr/share/plasma/plasmoids/org.kde.plasma.kodexbar"
  install -d "${plasmoid}"
  install -m644 packages/kodexbar/metadata.json "${plasmoid}/"
  cp -a packages/kodexbar/contents "${plasmoid}/"

  install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m644 packages/ai-cli-control/icons/kodexbar-tray-ok.svg \
    packages/ai-cli-control/icons/kodexbar-tray-warning.svg \
    packages/ai-cli-control/icons/kodexbar-tray-critical.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE NOTICE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 packages/ai-cli-control/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.ai-cli-control"
  install -m644 packages/kodexbar/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.kodexbar"
}
