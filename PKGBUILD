# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=xchat-fish
pkgver=0.98
pkgrel=2
pkgdesc='Blowfish encryption plugin compatible to original blowcrypt script'
url='http://fish.secure.la'
license=('Copyleft' 'AGPL3')
arch=('i686' 'x86_64')
depends=('xchat')
makedepends=('unzip')
noextract=('miracl.zip')

source=("http://distfiles.icmpv6.org/distfiles/FiSH-XChat.v${pkgver}-source.zip"
        "http://ftp.nsysu.edu.tw/FreeBSD/ports/local-distfiles/jase/miracl-5.6.zip"
        #"http://ftp1.us.freebsd.org/pub/FreeBSD/distfiles/FiSH-XChat.v${pkgver}-source.zip"
        #"http://ftp1.us.freebsd.org/pub/FreeBSD/distfiles/miracl-5.6.zip"
        "xfish_makefile")

# To verify the hashes yourself, your best bet is to view
# http://web.archive.org/web/20070801065542/http://fish.sekure.us/xchat/FiSH-XChat.v0.98-Hash.txt
sha256sums=('a065ace34c5a59cf51c194d9ac6aa5c8f00241488df38345e88174f5f345ecd6'
            'c9e3fe5ff071486f5b6ed61ebb79bb6f3edd2f3bb5031cb4e5b7ce64a17fff9c'
            '9cc579cdb284e7a4978ef81d5a792cb17a97961006622a16eb093c221bdff73a')

if [[ "$CARCH" = 'x86_64' ]]; then
    _buildcmd=linux64
    _CFLAGS="-fPIC"
else
    _buildcmd=linux
fi

build_miracl() {
    cd "$srcdir"
    msg "compiling miracl math library..."

    unzip -qo -j -aa -L miracl-5.6.zip -d "miracl"
    cd "miracl"

    sed "s|-O2|-O2 $_CFLAGS|" -i $_buildcmd
    sh $_buildcmd
    cp miracl.a ..
}

build() {
    [[ ! -f miracl.a ]] &&
        build_miracl

    cd "$srcdir"
    msg "compiling xfish plugin..."

    rm -f Makefile
    cp xfish_makefile Makefile
    make $_buildcmd
}

package() {
    cd "$srcdir"
    install -d "${pkgdir}/usr/lib/xchat/plugins"
    install -Dm644 "${srcdir}/xfish.so" "${pkgdir}/usr/lib/xchat/plugins/"
}
