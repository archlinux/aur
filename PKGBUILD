# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: "marmis" Tiago de Paula Alves <tiagodepalves@gmail.com>
_variants=(standard black blue brown green grey orange pink purple red yellow manjaro ubuntu dracula nord)

pkgbase=tela-circle-icon-theme-spl-git
_pkgname=("${_variants[@]/#/tela-circle-icon-theme-}")
pkgname=(tela-circle-icon-theme-all-git "${_pkgname[@]/%/-git}")
pkgdesc='A flat, colorful design icon theme'
pkgver=2026.07.07.r0.gc0adf1ab
pkgrel=1
url='https://github.com/vinceliuice/Tela-circle-icon-theme'
arch=(any)
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('hicolor-icon-theme')
optdepends=('adwaita-icon-theme: for better GNOME integration'
            'breeze-icons: for better KDE integration')
provides=('tela-circle-icon-theme')
options=(!strip !debug)
source=("git+${url}.git"
        'https://gitlab.archlinux.org/archlinux/packaging/packages/tela-circle-icon-theme/-/raw/2026_07_07-1/do_not_generate_cache_files.patch')
b2sums=('SKIP'
        '4b6496e61e3d7a0dfce85194ca0677e36550d28f000d0fb035def5706e3b829c99e01d66c7ceb63ceae0c5656fe15b603c447812bae65485b0838cc113fc72e5')

pkgver() {
  cd Tela-circle-icon-theme
  # shellcheck disable=SC2312 # will render pkgver invalid on fail
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Tela-circle-icon-theme
  # Do not generate cache files during build
  # This is already handled by the `gtk-update-icon-cache.hook` pacman hook from the `gtk4` package
  patch -Np1 -i ../do_not_generate_cache_files.patch
}

package_tela-circle-icon-theme-all-git() {
  pkgdesc="${pkgdesc} (all variants)"
  depends=("${_pkgname[@]/%/-git}")
  conflicts=('tela-circle-icon-theme-all')
}

_package() (
  cd Tela-circle-icon-theme

  install -vd "${pkgdir}/usr/share/icons/"
  ./install.sh -d "${pkgdir}/usr/share/icons" "${1}"
)

for _variant in "${_variants[@]}"; do
  eval "package_tela-circle-icon-theme-${_variant}-git() {
    pkgdesc='${pkgdesc} (${_variant} variant)'
    conflicts=('tela-circle-icon-theme-${_variant}')

    _package ${_variant}
  }"
done
