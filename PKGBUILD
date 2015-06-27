# Maintainer: Samuel Walladge <swalladge at gmail dot com>

pkgname=pysnip-git
_pkgname=pysnip
pkgver=r1752.d094fb8
pkgrel=1
pkgdesc="PySnip is an open-source Python server implementation for the voxel-based game 'Ace of Spades'."
arch=('any')
url="https://github.com/NateShoffner/${_pkgname}"
licence=('GPLv3')
makedepends=('git')
depends=('python2-twisted' 'cython2' 'python2-jinja' 'python2-pillow' 'python2-pygeoip' 'python2-crypto' 'python2-pyasn1')
provides=('pysnip')
source=("${pkgname}::git://github.com/NateShoffner/${_pkgname}.git"
        "pysnip")
sha256sums=('SKIP'
            '7d4ec23421f4ab95dd5f5f563d5b7535b2840228c9abfcd4d72ca467bc42b38a')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${pkgname}

    sh build.sh
}

package() {


    # install the custom startup script
    install -d "${pkgdir}/usr/bin/"
    install -Dm755 pysnip "${pkgdir}/usr/bin"
    chmod +x "${pkgdir}/usr/bin/pysnip"


    cd ${pkgname}

    # tidy up
    cp feature_server/config.txt.default feature_server/config.txt

    # copy in all the files
    install -d "${pkgdir}/usr/share/pysnip"
    cp -R {contrib,enet,examples,feature_server,py2exe,pyspades,run_server.sh} ${pkgdir}/usr/share/pysnip
    chmod -R 755 ${pkgdir}/usr/share/pysnip

}
