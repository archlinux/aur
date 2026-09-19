# Maintainer: Jon Tsiros <jon@brightblock.ai>

pkgname=hyprlayer-desktop-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Native desktop app for spec-driven development with coding agents"
arch=('x86_64')
url="https://brightblock.ai/hyprlayer"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'git' 'xdg-utils' 'hicolor-icon-theme')
optdepends=('claude-code: run Claude Code agent sessions in-app'
            'nodejs: runtime for agent CLIs installed through npm')
# The deb ships hyprlayer-server too, so declare it: otherwise this and
# hyprlayer-server-bin both own /usr/bin/hyprlayer-server, as a file conflict.
provides=('hyprlayer-desktop' 'hyprlayer-server')
conflicts=('hyprlayer-desktop' 'hyprlayer-server')
options=('!strip' '!debug' '!emptydirs')
_deb="Hyprlayer_${pkgver}_amd64.deb"
source=("${_deb}::https://github.com/BrightBlock/hyprlayer-releases/releases/download/v${pkgver}/${_deb}"
        "hyprlayer-server.service")
sha256sums=('4ca4bf28ad7ab5b9db5061db1470562e6c8f8d339209404e46f4a9d904b5ed43'
            'e578119d5152948b1ba56576c36825d63bce9ad1266e1c8ac661365cd597adae')
noextract=("${_deb}")

package() {
  local _unpack="${srcdir}/deb"
  rm -rf "${_unpack}"
  install -d "${_unpack}"
  bsdtar -xf "${srcdir}/${_deb}" -C "${_unpack}"
  bsdtar -xpf "${_unpack}"/data.tar* -C "${pkgdir}"

  # supervisor.rs looks for the server beside the running executable; staged
  # anywhere else it installs an app that cannot start.
  if [[ ! -f "${pkgdir}/usr/bin/hyprlayer-server" ]]; then
    echo "error: ${_deb} has no usr/bin/hyprlayer-server beside the app" >&2
    return 1
  fi

  # Installed, never enabled: `systemctl --user enable --now hyprlayer-server`.
  install -Dm644 "${srcdir}/hyprlayer-server.service" \
    "${pkgdir}/usr/lib/systemd/user/hyprlayer-server.service"
}
