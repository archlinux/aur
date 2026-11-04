# Maintainer: Eike Ahmels <eike.ahmels89 at gmail dot com>
# Contributor: AgentsRoom <contact at agentsroom dot dev>

pkgname=agentsroom-bin
_pkgname=agentsroom
pkgver=1.251.0
pkgrel=1
pkgdesc="Visual command center to run and coordinate multiple AI coding agents"
arch=('x86_64' 'aarch64')
url="https://agentsroom.dev"
license=('LicenseRef-proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'at-spi2-core' 'libsecret'
         'libnotify' 'util-linux-libs' 'xdg-utils'
         'python') # resources/pty-helper.py backs every terminal on Linux
optdepends=('libappindicator-gtk3: system tray icon'
            'git: project detection and version control features'
            'nodejs: run bundled MCP servers on system Node instead of Electron')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# Prebuilt Electron bundle: stripping or generating debug symbols breaks it.
options=('!strip' '!debug' '!emptydirs')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/downloads/desktop_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${url}/downloads/desktop_${pkgver}_arm64.deb")
sha512sums_x86_64=('e91e0c5c8746004fb6d58a5beed4520d9105e59e3c5fdc7d85695a581649b7ce11aaa0142032eeed31c598ecfbe7f202750dcb7bb1c2c8595a3a535abdb53e51')
sha512sums_aarch64=('5a7063b4996cb7a8c89809c429693b5ea7283fd163de09278987f38b9ecbe58dfc6df6b4364c409cf931ee0cf1f366495212e6b60bf1f41feb1755ae40c90848')
# makepkg would only unwrap the outer `ar` archive; we unpack data.tar ourselves.
noextract=("${pkgname}-${pkgver}-x86_64.deb" "${pkgname}-${pkgver}-aarch64.deb")
install="${pkgname}.install"

_appdir="/opt/AgentsRoom"

package() {
  # Stream data.tar.* straight out of the .deb, whatever its compression.
  bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}-${CARCH}.deb" 'data.tar.*' \
    | bsdtar -xf - -C "${pkgdir}" ./opt ./usr

  # Debian changelog, filed under the .deb's internal package name "desktop".
  rm -rf "${pkgdir}/usr/share/doc"

  # The .deb postinst does these three things; pacman has no postinst payload,
  # so they are baked into the package instead.

  # 1. /usr/bin entry point = the sandbox-aware launcher, never the raw binary.
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "${_appdir}/agentsroom-launcher" "${pkgdir}/usr/bin/${_pkgname}"
  chmod 755 "${pkgdir}${_appdir}/agentsroom-launcher"

  # 2. Chromium SUID sandbox helper. fakeroot already gives it root:root; the
  #    setuid bit is recorded in the package and restored by pacman on install.
  #    If it ever ends up unusable (nosuid /opt), launcher.sh degrades instead
  #    of aborting.
  chmod 4755 "${pkgdir}${_appdir}/chrome-sandbox"

  # 3. Tell electron-updater this is a pacman install. Without this it reads the
  #    "deb" marker shipped in the .deb payload and would try to dpkg-install an
  #    update over pacman-owned files. Our release feed carries no .pacman
  #    artifact, so the app cleanly reports that it cannot self-update and the
  #    user upgrades through their AUR helper.
  echo 'pacman' > "${pkgdir}${_appdir}/resources/package-type"

  # The shipped .desktop file execs the raw Electron binary; route menu
  # launches through the launcher as well.
  sed -i "s|^Exec=${_appdir}/agentsroom |Exec=${_pkgname} |" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${_appdir}/LICENSE.electron.txt" "${_appdir}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
