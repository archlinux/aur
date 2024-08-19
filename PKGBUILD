# Maintainer: Ruben Deisenroth (Discord: Rubosplay#0815) <ruben.deisenroth@stud.tu-darmstadt.de>

pkgname=algotex-git
_pkgname=AlgoTeX
pkgver=r189.16afd82
pkgrel=1
pkgdesc="AlgoTeX - A LaTeX-Template based on tuda-ci used for FoP and AuD"
arch=("any")
url="https://github.com/TUDalgo/AlgoTeX"
license=("GPL-3.0-or-later")
depends=("python-pygments" "latex-tuda-ci-logos")
makedepends=()
source=("${pkgname}::git+https://github.com/TUDalgo/AlgoTeX.git")
sha256sums=("SKIP")

# Dynamically update Package Version from Git
pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Build Package
package() {
    cd "${srcdir}/${pkgname}"
    # License
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    # Install AlgoTeX
    { # try full installation
      l3build install --full --texmfhome="${pkgdir}/$(kpsewhich -var-value=TEXMFDIST)"
    } || { # fallback to basic installation
      read -p "Full installation failed. Do you want to install AlgoTeX without the documentation? [y/N] " choice
      case "$choice" in
        y|Y ) l3build install --texmfhome="${pkgdir}/$(kpsewhich -var-value=TEXMFDIST)";;
        n|N ) echo "Aborting installation."; exit 1;;
        * ) echo "Invalid input. Aborting installation."; exit 1;;
      esac
    }
}
