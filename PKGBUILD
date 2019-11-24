# Maintainer: Leonardo Eugenio <lelgenio@disroot.org>
pkgname=materia-custom-accent
_pkgname=materia-theme
_accent=c85a5a
pkgdesc="Easy installer for the materia theme with a custom accent color, gdm and qt5 support and a workaround for dark apps (edit PKGBUILD)"
arch=('any')
url="https://github.com/nana-4/materia-theme"
_url_qt="https://github.com/PapirusDevelopmentTeam/materia-kde"
pkgver=r1211.c95281e8
pkgrel=1
license=('GPL')
makedepends=(bc sassc inkscape)
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-extra' 'kvantum-qt5')
optdepends=()
provides=()
conflicts=('materia-theme' 'kvantum-theme-materia')
replaces=()
source=(${_pkgname}::git+$url.git
        ${_pkgname}-qt::git+$_url_qt.git
        colors
        colors-dark
        99-gdm-use-materia-theme.hook)
sha256sums=('SKIP'
            'SKIP'
            '6cbc8dee30cb20f6124e5d1c2816be694322733d8058b014fa2280879c0f520f'
            'bee6e51a3707667d796c3b827e4e6494bcbbf26d47c96f40e08c2f56d528bec1'
            '7db390763b37c3cc2c2984a8a3e8452d1822ac579def6a07eecbee076fb73d77')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare(){
  cd "${srcdir}"
  sed "s/MY-COLOR/$_accent/" -i colors colors-dark
  
  cd materia-theme-qt/Kvantum
  sed "s/4285f4/$_accent/" -i */*
}
build(){
  cd "${srcdir}/${_pkgname}"
  ./change_color.sh -t "${srcdir}/themes" -o $pkgname      "${srcdir}/colors"
  ./change_color.sh -t "${srcdir}/themes" -o $pkgname-dark "${srcdir}/colors-dark"
  
  cp "${srcdir}/themes/$pkgname-dark/gtk-3.0/gtk.css" \
     "${srcdir}/themes/$pkgname/gtk-3.0/gtk-dark.css"
}
package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}"/themes/* "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}"/materia-theme-qt/Kvantum "${pkgdir}/usr/share"
  
  mkdir -p "${pkgdir}/usr/share/libalpm/hooks"
  cp 99-gdm-use-materia-theme.hook "${pkgdir}/usr/share/libalpm/hooks"
}

