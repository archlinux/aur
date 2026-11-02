# Maintainers: thadah
pkgname="synergy-dragon-alpha-bin"
pkgver="0.7.0"
pkgrel="2"
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="https://symless.com/synergy"
license=('custom:Proprietary')
arch=("x86_64")
source=()
sha256sums=()
conflicts=('synergy-dragon-alpha-bin')
depends=(
  'gdk-pixbuf2' 
  'glib2' 
  'glibc' 
  'gtk3'
  'libei'
  'libgcc'
  'libsoup3'
  'libstdc++'
  'libx11'
  'libxext'
  'libxi'
  'libxinerama'
  'libxkbcommon'
  'libxkbfile'
  'libxrandr'
  'libxtst'
  'openssl'
  'qt6-base>=6.12'
  'webkit2gtk-4.1'
)
options=("!strip")
install="synergy-dragon.install"

# Anonymous download permalink provided by Symless
_permalink="https://email.mg.symless.com/c/eJxMjj1PwzAUAH-Ns1HZ7zn-GDw0gggJECBRqXSzXqw2JbEj2xTCr0d0Yry75QYHPgjTBCe0EdAqbXRzcgSDIkNGWC-EFzRwoFaRJm81tzo0owMOiisB3CJyvbHEEbHVEAhRKmSSz8dNWecplLKhNDeTO9W6FIZbBj2D_l-7Ugz5uDLo_TIy6If0Fafkhz9BFEph2Nf0ESLDW3l4PEO8ed6_bA_nRcLr2hHa9odqd6fu3_P-8-nte_fQiXbXZHcJMWWDRgKT3Gdf8xivQxcHvwEAAP__hk5M-A"

_pkgfile="synergy-dragon-${pkgver}-linux-arch-x86_64.pkg.tar.zst"


prepare() {
  curl -fsSL -c "${srcdir}/cookies.txt" -o /dev/null "$_permalink"
  curl -fsSL -b "${srcdir}/cookies.txt" -o "${srcdir}/page.html" \
    "https://symless.com/synergy/download/package/synergy-dragon-alpha/arch-linux/${_pkgfile}"

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

