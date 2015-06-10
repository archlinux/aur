# Maintainer: Ali Mousavi <ali.mousavi[at]gmail[dot]com>
pkgname=limoo-git
pkgver=r50.6657bf1
pkgrel=1
pkgdesc="Limoo is multiplatform and modern image viewer, focused on better user interface..."
url="http://labs.sialan.org/projects/limoo"
arch=("x86_64" "i686")
license=("GPLv3")
depends=("qt5-base" "qt5-multimedia" "qt5-graphicaleffects" "qt5-quickcontrols"    "qt5-declarative" "qt5-quick1" "exiv2")
makedepends=()
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}" "${pkgname/-git}-bin")

_gitroot="https://github.com/sialan-labs/limoo.git"
_gitname="limoo"

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
### Clone files...
    cd "${srcdir}"
    echo "${srcdir}"
    msg "Connecting to GIT server..."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"

    ### Build
    msg "Starting build..."
    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    mkdir build && cd build
    qmake -qt5 -r TARGET=${pkgname/-git} ..
    make
}

    package() {
    echo "${pkgdir}"
    cd "${srcdir}/$_gitname-build/build"
    make INSTALL_ROOT="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
