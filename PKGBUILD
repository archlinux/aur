# Maintainer: gaou-piou <i.am.piou@gmail.com>

pkgname=muster-agent-bin
pkgver=0.3.16
pkgrel=1
pkgdesc='Agentic development environment (ADE) for Codex, Claude Code, OpenCode and local models'
arch=('x86_64')
url='https://themuster.dev'
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'alsa-lib' 'libsecret' 'libnotify'
         'at-spi2-core' 'xdg-utils')
makedepends=('python')
optdepends=('libappindicator-gtk3: tray icon support'
            'gnome-keyring: store credentials in the GNOME keyring'
            'kwallet: store credentials in KWallet')
provides=('muster-agent')
conflicts=('muster-agent')
install=muster-agent-bin.install
options=('!strip' '!debug')

# Upstream ships Linux builds on GitHub releases under agent-v<version> tags, as
# a deb, a tarball and an AppImage -- all public, no gatekeeping (unlike
# codemeyo-bin, which hides behind an e-mail form and a file-id API).
#
# The deb is used as the source because it is the layout upstream actually
# maintains for Linux systems: /opt/muster-agent, a launcher that keeps the
# Chromium sandbox on wherever it can, icons in every hicolor size, a desktop
# entry, and an AppArmor profile in resources/. Repackaging it means no fuse2
# dependency and no AppImage mount at runtime, at the cost of a ~290 MB
# installed tree instead of a single 113 MB AppImage. The tarball asset is the
# same payload without the deb metadata; the deb is preferred because it also
# documents the runtime dependencies (see depends= above).
_deb="Muster-Agent-${pkgver}-linux-amd64.deb"
_url="https://github.com/musterhq/muster-code/releases/download/agent-v${pkgver}"

source=("${_deb}::${_url}/${_deb}"
        "LICENSE::https://raw.githubusercontent.com/musterhq/muster-code/agent-v${pkgver}/LICENSE"
        'fix-mcp-launchers.py')
sha256sums=('f5fe611f2760f2f6b6889f00bb6a55ec54caeea051892bac450f8aea43f236b6'
            '8be9dc5eea50ccc91e9c3be00ffd5c973531f2f0a7098e9bd979b4355523661e'
            '6fe33e03b7d28f51091382cebae3c695a37c17fab35d23b31cf9a84bbb69f83e')

prepare() {
  cd "${srcdir}"
  # A .deb is an ar archive holding tar members; makepkg does not unpack it, so
  # pull out data.tar.xz.
  bsdtar -xf "${_deb}" data.tar.xz
}

package() {
  # Unpack upstream's payload as-is: /opt/muster-agent (with resources/, the
  # AppArmor profile and chrome-sandbox), the desktop entry and every hicolor
  # icon size. --no-same-owner because the archive carries Debian uid/gid.
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --no-same-owner

  # Debian convention; Arch has no /usr/share/doc and pacman cannot own files
  # outside the package there anyway.
  rm -rf "${pkgdir}/usr/share/doc"

  # Upstream only writes an MCP server's launcher script when the server is
  # added or edited in Settings, yet hands that script's path to the agent for
  # servers it imported from ~/.claude.json, ~/.codex/config.toml or .mcp.json
  # too; those start with a missing command (ENOENT). The patch makes the
  # config builder write the launcher first. It fails the build if the bundle
  # no longer has the expected shape. See fix-mcp-launchers.py.
  python3 -I "${srcdir}/fix-mcp-launchers.py" \
    "${pkgdir}/opt/muster-agent/resources/app.asar"

  # The deb's postinst creates this link (through update-alternatives there).
  # It points at the launcher script, not at the Electron binary, so the
  # sandbox detection keeps working.
  install -dm755 "${pkgdir}/usr/bin"
  ln -s '/opt/muster-agent/muster-agent' "${pkgdir}/usr/bin/muster-agent"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
