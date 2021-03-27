# Maintainer: Leonardo Eugenio <lelgenio@disroot.org>
pkgname=materia-custom-accent
_pkgname=materia-theme
_accent="c85a5a"
_colors="     SEL_BG=$_accent FG=212121 \n BG=eeeeee \n HDR_FG=eeeeee \n HDR_BG=303030 \n MATERIA_VIEW=ffffff \n MATERIA_SURFACE=fafafa"
_colors_dark="SEL_BG=$_accent FG=eeeeee \n BG=212121 \n HDR_FG=e0e0e0 \n HDR_BG=303030 \n MATERIA_VIEW=303030 \n MATERIA_SURFACE=424242"
pkgdesc="Easy installer for the materia theme with a custom accent color, gdm and qt5 support (edit PKGBUILD)"
arch=('any')
url="https://github.com/nana-4/materia-theme"
pkgver=20210322
_url_qt="https://github.com/PapirusDevelopmentTeam/materia-kde"
_pkgver_qt=20210307
pkgrel=1
license=('GPL')
makedepends=(sassc inkscape)
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-extra')
optdepends=(
    'resvg: faster compilation'
    'kvantum-qt5: qt5 theme support'
)
provides=()
conflicts=('materia-theme' 'kvantum-theme-materia')
replaces=()
source=("${_pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}-${_pkgver_qt}-qt.tar.gz"::"${_url_qt}/archive/refs/tags/${_pkgver_qt}.tar.gz"
        99-gdm-use-materia-theme.hook)
sha256sums=('4460af612cd70242543ac71023f8963eea39be059486e9ebe58b3846be74bcb5'
            '0474c94e2db944f3efffbcba651289d2ddf11dcaffc0dabf6e1042a254ed9ea1'
            '7db390763b37c3cc2c2984a8a3e8452d1822ac579def6a07eecbee076fb73d77')

prepare(){
    # materia-qt has no ./change_color script
    cd "${srcdir}/materia-theme-qt/Kvantum"
    sed "s/8ab4f8/$_accent/" -i */*
}

build(){
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${srcdir}/themes"
    ./change_color.sh -t "${srcdir}/themes" -o "${pkgname}"      <( echo -e "$_colors")
    ./change_color.sh -t "${srcdir}/themes" -o "${pkgname}-dark" <( echo -e "$_colors_dark")
}

package() {
    mkdir -p "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}"/themes/* "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}"/materia-theme-qt/Kvantum "${pkgdir}/usr/share"

    mkdir -p "${pkgdir}/usr/share/libalpm/hooks"
    cp 99-gdm-use-materia-theme.hook "${pkgdir}/usr/share/libalpm/hooks"
}
