# Maintainer: Mathias DeWeerdt <your@email.com>
pkgname=discord-latest-bin
pkgver=1.0.139
pkgrel=1
pkgdesc="Discord - All-in-one voice, video and text communication (latest upstream .deb release)"
arch=('x86_64')
url="https://discord.com"
license=('LicenseRef-custom')
depends=('gtk3' 'nss' 'libxss' 'alsa-lib' 'libnotify' 'xdg-utils' 'libglvnd')
optdepends=(
  'libappindicator-gtk3: systray support'
  'libayatana-appindicator: systray support'
)
provides=('discord')
conflicts=('discord')
# Discord ships pre-built Electron binaries — stripping them breaks the app
options=('!strip' '!debug')
source=("discord-${pkgver}.deb::https://stable.dl2.discordapp.net/apps/linux/${pkgver}/discord-${pkgver}.deb")
sha256sums=('4887d6d3cc990bb59646212aabf661a4ece59231005ea83f76812654e6694148')

package() {
  cd "${srcdir}"
  ar x "discord-${pkgver}.deb"

  local data_tar
  data_tar=$(find . -maxdepth 1 -name 'data.tar.*' | head -1)
  [[ -n "${data_tar}" ]] || { echo "error: data.tar.* not found in .deb"; exit 1; }
  tar xf "${data_tar}" -C "${pkgdir}"

  # Install license — search common locations since path varies between releases
  local license_file
  license_file=$(find "${pkgdir}/usr/share/discord" -name 'LICENSE.html' | head -1 || true)
  if [[ -n "${license_file}" ]]; then
    install -Dm644 "${license_file}" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
  fi
}
