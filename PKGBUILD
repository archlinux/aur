# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>
# Initial maintainer: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>

pkgname=peppercarrot-fonts
pkgver=1.0.0
pkgrel=1
pkgdesc="Open fonts used in the webcomic Pepper&Carrot"
arch=('any')
url="https://www.peppercarrot.com/en/fonts"
license=("Apache-2.0" "CC-BY-3.0" "GPL-2.0-only" "GPL-3.0-only" "mplus" "OFL-1.1" "OFL-1.0")
makedepends=('fontforge')

source=("https://framagit.org/peppercarrot/fonts/-/archive/v$pkgver/fonts-v$pkgver.tar.gz")
sha256sums=('514fcda1cb70b229422834fd7bf5c4a2094c08f743b6ed4d4a2520ca546929d7')


# function stollen from nixpkgs, MIT
# pkgs/by-name/in/installFonts/install-fonts.sh
installFont() {
  if (($# != 2)); then
    nixErrorLog "expected 2 arguments!"
    nixErrorLog "usage: installFont fontExt outDir"
    exit 1
  fi

  find -iname "*.$1" -print0 | xargs -0 -r install -m644 -D -t "$2"
}


package() {
  cd ${srcdir}/fonts-v${pkgver}/Latin

  # Some fonts are duplicated with symlinks
  find . -type l -delete

  # Build those only available from source
  fontforge -lang=ff -c 'Open("sources/Handserah.sfd"); Generate("Handserah.otf")'
  fontforge -lang=ff -c 'Open("sources/PepperCarrot.sfd"); Generate("PepperCarrot.otf")'

  #install
  installFont 'ttf' "$pkgdir/usr/share/fonts/TTF"
  installFont 'ttc' "$pkgdir/usr/share/fonts/TTF"
  installFont 'otf' "$pkgdir/usr/share/fonts/TTF"
  installFont 'woff2' "$pkgdir/usr/share/fonts/WOFF2"

  installFont 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}"
  installFont 'COPYRIGHT' "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set tw=80 ts=2 sw=2 et:
