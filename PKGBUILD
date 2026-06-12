# Maintainers: arraen, thadah
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
pkgname="synergy3-bin"
pkgver="3.6.2"
pkgrel="2"
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="https://symless.com/synergy"
license=('custom:Proprietary')
arch=("x86_64")
source=()
sha256sums=()
conflicts=('synergy' 'synergy2-bin' 'synergy3-bin' 'synergy3-beta-bin')
depends=('openssl' 'alsa-lib' 'libei' 'libnotify' 'nss' 'qt6-base' 'libxkbfile' 'libxtst' 'libappindicator-gtk3' 'libayatana-appindicator')
optdepends=('pugixml')
options=("!strip")
install="${pkgname}.install"

# Anonymous download permalink provided by Symless
_permalink="https://email.mg.symless.com/c/eJxMjj1PwzAUAH-Ns1HZ7zn-GDw0gggJECBRqXSzXqw2JbEj2xTCr0d0Yry75QYHPgjTBCe0EdAqbXRzcgSDIkNGWC-EFzRwoFaRJm81tzo0owMOiisB3CJyvbHEEbHVEAhRKmSSz8dNWecplLKhNDeTO9W6FIZbBj2D_l-7Ugz5uDLo_TIy6If0Fafkhz9BFEph2Nf0ESLDW3l4PEO8ed6_bA_nRcLr2hHa9odqd6fu3_P-8-nte_fQiXbXZHcJMWWDRgKT3Gdf8xivQxcHvwEAAP__hk5M-A"

_pkgfile="synergy-${pkgver}-linux-noble-x86_64.pkg.tar.zst"

prepare() {
  curl -fsSL -c "${srcdir}/cookies.txt" -o /dev/null "$_permalink"
  curl -fsSL -b "${srcdir}/cookies.txt" -o "${srcdir}/page.html" \
    "https://symless.com/synergy/download/package/synergy-personal-v3/arch-linux/${_pkgfile}"

  local token
  token=$(grep -oP '(?<=\\"token\\":\\")[^\\"]+' "${srcdir}/page.html" | head -n1)
  if [[ -z "$token" ]]; then
    echo "Failed to get download token."
    return 1
  fi

  echo "Downloading .pkg.tar.zst file with permalink token..."
  curl -fsSL -o "${srcdir}/${_pkgfile}" "https://symless.com/synergy/api/download/${_pkgfile}?token=${token}"
}

package() {
  # Extract the .tar.zst file keeping permissions
  bsdtar -xpf "${srcdir}/${_pkgfile}" -C "${pkgdir}/" opt usr

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Synergy/synergy "${pkgdir}/usr/bin/synergy"
  ln -s /opt/Synergy/synergy-core "${pkgdir}/usr/bin/synergy-core"

  # Install the user service and enable it.
  install -Dm644 "${pkgdir}/opt/Synergy/resources/services/global/synergy.service" "${pkgdir}/etc/systemd/user/synergy.service"
  install -d "${pkgdir}/etc/systemd/user/graphical-session.target.wants"
  ln -s /etc/systemd/user/synergy.service "${pkgdir}/etc/systemd/user/graphical-session.target.wants/synergy.service"

  # Install the login service into the system unit directory (disabled).
  install -Dm644 "${pkgdir}/opt/Synergy/resources/services/system/synergy.service" "${pkgdir}/usr/lib/systemd/system/synergy.service"

  # Add the loginInfo file
  install -d "${pkgdir}/etc/Synergy"
  install -m666 /dev/null "${pkgdir}/etc/Synergy/loginInfo"

  chmod 4755 "${pkgdir}/opt/Synergy/chrome-sandbox" || true
}
