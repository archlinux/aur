# Maintainer: Scott Marshall <marshals@gmail.com>
# Contributor: Catriel Müller <catriel at gmail dot com>
pkgname=synergy1-bin
pkgver=1.20.4
pkgrel=1
pkgdesc="Keyboard and mouse sharing solution. Synergy allows you to share one mouse and keyboard between multiple computers. Work seamlessly across Windows, macOS and Linux."
arch=('x86_64')
url="https://symless.com/synergy"
license=('custom:Proprietary')
depends=('gcc-libs' 'glibc' 'openssl' 'libx11' 'libxi' 'libxkbfile' 'libxext' 'libxtst'
         'libxinerama' 'libxkbcommon-x11' 'libnotify' 'hicolor-icon-theme' 'qt6-base'
         'qt6-tools' 'libei' 'libportal')
conflicts=('synergy' 'synergy1-bin' 'synergy-git' 'synergy-1.6' 'synergy2-bin' 'synergy3-bin' 'synergy3-beta-bin')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=()
sha256sums=()

# Anonymous download permalink provided by Symless
_permalink="https://email.mg.symless.com/c/eJxMjj1PwzAUAH-Ns1HZ7zn-GDw0gggJECBRqXSzXqw2JbEj2xTCr0d0Yry75QYHPgjTBCe0EdAqbXRzcgSDIkNGWC-EFzRwoFaRJm81tzo0owMOiisB3CJyvbHEEbHVEAhRKmSSz8dNWecplLKhNDeTO9W6FIZbBj2D_l-7Ugz5uDLo_TIy6If0Fafkhz9BFEph2Nf0ESLDW3l4PEO8ed6_bA_nRcLr2hHa9odqd6fu3_P-8-nte_fQiXbXZHcJMWWDRgKT3Gdf8xivQxcHvwEAAP__hk5M-A"

_pkgfile="synergy_${pkgver}_arch-linux_x86_64.pkg.tar.zst"

prepare() {
  curl -fsSL -c "${srcdir}/cookies.txt" -o /dev/null "$_permalink"
  curl -fsSL -b "${srcdir}/cookies.txt" -o "${srcdir}/page.html" \
    "https://symless.com/synergy/download/package/synergy-personal-v1/arch-linux/${_pkgfile}"

  local token
  token=$(grep -oP '(?<=\\"token\\":\\")[^\\"]+' "${srcdir}/page.html" | head -n1)
  if [[ -z "$token" ]]; then
    echo "Failed to obtain download token; the permalink may have expired."
    return 1
  fi

  curl -fsSL -o "${srcdir}/${_pkgfile}" \
    "https://symless.com/synergy/api/download/${_pkgfile}?token=${token}"
}

package() {
  bsdtar -xpf "${srcdir}/${_pkgfile}" -C "${pkgdir}/" usr
}
