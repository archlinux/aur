# Maintainers: thadah
pkgname="synergy3-beta-bin"
pkgver="3.7.0"
pkgrel="2"
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="https://symless.com/synergy"
license=('custom:Proprietary')
arch=("x86_64")
source=()
sha256sums=()
conflicts=('synergy' 'synergy1-bin' 'synergy-git' 'synergy-1.6' 'synergy2-bin' 'synergy3-bin' 'synergy3-beta-bin')
depends=('openssl' 'alsa-lib' 'libei' 'libnotify' 'nss' 'qt6-base' 'libxkbfile' 'libxtst' 'libappindicator-gtk3' 'libayatana-appindicator')
optdepends=('pugixml')
options=("!strip")

# Anonymous download permalink provided by Symless
_permalink="https://email.mg.symless.com/c/eJxMjj1PwzAUAH-Ns1HZ7zn-GDw0gggJECBRqXSzXqw2JbEj2xTCr0d0Yry75QYHPgjTBCe0EdAqbXRzcgSDIkNGWC-EFzRwoFaRJm81tzo0owMOiisB3CJyvbHEEbHVEAhRKmSSz8dNWecplLKhNDeTO9W6FIZbBj2D_l-7Ugz5uDLo_TIy6If0Fafkhz9BFEph2Nf0ESLDW3l4PEO8ed6_bA_nRcLr2hHa9odqd6fu3_P-8-nte_fQiXbXZHcJMWWDRgKT3Gdf8xivQxcHvwEAAP__hk5M-A"

_pkgfile="synergy-${pkgver}-beta-linux-noble-x86_64.pkg.tar.zst"

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
  # Extract the .tar.zst file and repackage as is
  bsdtar -xpf "${srcdir}/${_pkgfile}" -C "${pkgdir}" --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.BUILDINFO' --exclude='.INSTALL'
}
