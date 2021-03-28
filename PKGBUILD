# Maintainer: Leonardo Eugenio <lelgenio@disroot.org>
pkgname=materia-custom-accent-git
_pkgname=materia-theme
_accent="c85a5a"
_colors="     SEL_BG=$_accent FG=212121 \n BG=eeeeee \n HDR_FG=eeeeee \n HDR_BG=303030 \n MATERIA_VIEW=ffffff \n MATERIA_SURFACE=fafafa"
_colors_dark="SEL_BG=$_accent FG=eeeeee \n BG=212121 \n HDR_FG=e0e0e0 \n HDR_BG=303030 \n MATERIA_VIEW=303030 \n MATERIA_SURFACE=424242"
pkgdesc="Easy installer for the materia theme with a custom accent color, gdm and qt5 support (edit PKGBUILD)"
arch=('any')
url="https://github.com/nana-4/materia-theme"
_url_qt="https://github.com/PapirusDevelopmentTeam/materia-kde"
pkgver=r1609.79b71a42
pkgrel=1
license=('GPL')
makedepends=(sassc inkscape git)
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-extra')
optdepends=(
    'resvg: faster compilation'
    'kvantum-qt5: qt5 theme support'
)
provides=('materia-custom-accent')
conflicts=('materia-custom-accent' 'materia-theme' 'kvantum-theme-materia')
source=(${_pkgname}::git+$url.git
        ${_pkgname}-qt::git+$_url_qt.git
        99-gdm-use-materia-theme.hook)
sha256sums=('SKIP'
            'SKIP'
            '7db390763b37c3cc2c2984a8a3e8452d1822ac579def6a07eecbee076fb73d77')
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
