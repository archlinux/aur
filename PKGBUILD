# Maintainer: Dimitris Karnikis <dkarnikis@gmail.com>

pkgname="pash-shell"
pkgver=04
pkgrel='0'
packager="Dimitris Karnikis"
pkgdesc="PaSh: Light-touch Data-Parallel Shell Processing"
url="https://binpa.sh/"
arch=("x86_64")
license=('MIT')
source=("git+https://github.com/binpash/pash.git")
makedepends=(git libtool m4 automake curl pkg-config python-pip libffi make autoconf gcc sudo inetutils bc)
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    git checkout v.$pkgver
}

build() {
    echo "Building from sources"
    # access the repo code
    export PASH_TOP="$srcdir/$pkgname"
    cd $PASH_TOP
    # setup pash
    bash scripts/setup-pash.sh
}

package() {
    install -d ${pkgdir}/opt
    cp -r "$srcdir/${pkgname}" -t "${pkgdir}/opt"
    # add access permission to the folder
    $(chmod -R 777 "${pkgdir}/opt")
    # copy the pa.sh to /usr/local/bin
    install -D -m0777 "${srcdir}/${pkgname}/pa.sh" -t "${pkgdir}/usr/local/bin"
    red=`tput setaf 1`
    green=`tput setaf 2`
    reset=`tput sgr0`
    echo "${green}Dont forget to run ${red}export PASH_TOP=/opt/pash${reset}"
}
