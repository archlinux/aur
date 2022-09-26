# Maintainer: Viktor Danov <orangeleaf12@gmail.com>
pkgname=abacus-git
pkgver=1.4.2
pkgrel=1
epoch=
pkgdesc="A simple interactive calculator REPL with support for variables, lambdas, and more."
arch=('x86_64')
url="https://github.com/viktordanov/abacus.git"
license=('MIT')
groups=()
depends=()
makedepends=('go' 'git')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()
_gitroot="git@github.com:viktordanov/abacus.git"
_gitname="abacus"

build() {
    cd ${srcdir}/

    msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]]; then
        cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."

    msg "Starting make for: ${pkgname}"
    
    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       msg "Cleaning the previous build directory..." 
       rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
    cd ${srcdir}/${_gitname}-build
        
    make compile || return 1
}

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp "${srcdir}/${_gitname}-build/build/abacus" "${pkgdir}/usr/bin"
    chmod +x "${pkgdir}/usr/bin/abacus"
}
