# Maintainer: Sergio Schneider <spsf64 @ g m a i l . c o m>
# Co-Maintainer: Thomas Queiroz <thomasqueirozb @ g m a i l . c o m>

pkgname=hackneyed-cursor-magenta-bin
_pkgname=hackneyed-cursor-magenta
pkgver=0.9.3
pkgrel=0
pkgdesc="Hackneyed Magenta Multi Animated cursor theme (right-handed, high-contrast)"
arch=('any')
url="https://futurehorizondesign.net.au/portfolio/hackneyedhighcontraststaticcursors.html" 
#url="https://futurehorizondesign.net.au/docs/hackneyedhighcontrast/"
#url="https://github.com/"
license=('MIT' 'GPL3')
depends=()
optdepends=('lxappearance: GUI cursor selector'
            'gnome-tweaks: GNOME cursor selector')
provides=("hackneyed-cursor-magenta")

source=("https://futurehorizondesign.net.au/docs/hackneyedhighcontrast/Hackneyed-Magenta-Multi-Animated.tar.bz2")
sha256sums=('007749096f253c99a3c07bc2ee3b9233838c76b197f6ab4d590c82665572077b')

prepare() {
  # Extract the *outer* archive
  bsdtar -xf "Hackneyed-Magenta-Multi-Animated.tar.bz2" -C "${srcdir}"

  # Find the exact inner tarball (right-handed, version 0.9.3)
  INNER_TAR=$(find "${srcdir}" -name "Hackneyed-Magenta-Multi-Animated-0.9.3-right-handed.tar.bz2" | head -1)
  if [[ -z "$INNER_TAR" ]]; then
    echo "Error: inner tarball not found!"
    exit 1
  fi

  # Extract the inner tarball into a temporary folder
  mkdir -p "${srcdir}/inner"
  bsdtar -xf "$INNER_TAR" -C "${srcdir}/inner" --strip-components=1
}

package() {
  # Destination
  install -dm755 "${pkgdir}/usr/share/icons/${_pkgname}"

  # Copy the extracted theme (the inner folder now contains index.theme, cursors/, etc.)
  cp -r "${srcdir}/inner"/* "${pkgdir}/usr/share/icons/${_pkgname}/"

  # Safety check – abort if index.theme is missing
  if [[ ! -f "${pkgdir}/usr/share/icons/${_pkgname}/index.theme" ]]; then
    echo "Error: index.theme not found after extraction!"
    exit 1
  fi

  # License file (the archive does not ship one, so we provide a short notice)
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" <<EOF
Original Hackneyed cursors: MIT/X11 License
High-contrast modifications: GNU GPL v3
See: ${url}
EOF
}
