# Maintainer: Zane Fernandes <zane.ferns360@gmail.com>
pkgname='catppuccin-gtk-theme-git'
_reponame='Catppuccin-GTK-Theme'
pkgver=r62.c961826d0
pkgrel=1
pkgdesc='A GTK theme based on the Catppuccin colour palette.'
arch=("any")
url="https://github.com/Fausto-Korpsvart/${_reponame}"
license=("GPL3")
depends=("gnome-themes-extra")
optdepends=("gtk-engine-murrine")
makedepends=("git" "sassc")
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!strip !debug !libtool !emptydirs) # Skip unnecessary steps for theme packages

pkgver() {
    cd "${_reponame}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_reponame}/themes"
    # Run the build script first to generate CSS files
    ./build.sh
}

package() {
    cd "${_reponame}"
    # docs
    install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    install -D -m0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    
    # themes - install all variants
    mkdir -p "${pkgdir}/usr/share/themes"
    cd themes
    
    # Call the install script with the correct parameters
    # This installs all theme variants (default,purple,pink,red,orange,yellow,green,teal,grey)
    # with both color schemes (light,dark) in standard size
    ./install.sh --dest "${pkgdir}/usr/share/themes" --theme all --color light dark
    
    # icons
    mkdir -p "${pkgdir}/usr/share/icons"
    cd ../icons
    for icontheme in */; do
        cp -r "$icontheme" "${pkgdir}/usr/share/icons/"
    done
}
