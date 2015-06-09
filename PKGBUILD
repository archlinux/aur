# Maintainer: Jorge Martinez Hernandez <jorgemartinezhernandez@gmail.com>
# Contributor: Jorge Martinez Hernandez <jorgemartinezhernandez@gmail.com>

pkgname=feednix
pkgver=v1.0
pkgrel=8
pkgdesc="A simple ncurses-based console client for Feedly"

arch=('i686' 'x86_64')
url="http://feednix-jarkore.rhcloud.com/"
license=('GPL3')
depends=('ncurses' 'curl' 'jsoncpp' 'autoconf' 'automake')
optdepends=('w3m: for post preview on command line')
makedepends=('autoconf' 'automake')
conflicts=('feednix-git')
install='feednix.install'
md5sums=('a4144178f97aa1cb288886a75bca0da4'
         '7ae4f47db57888146958b574082cd45c'
         'e019131964e92e5145d3f3e2e2987d3b'
         'f7a8e589a3bc4ee807642e70fa82e9cd')
source=('https://downloads.sourceforge.net/project/feednix/Feednix/feednix-1.0.tar.gz'
        'abort-error.patch'
        'preview-error.patch'
        'autogen.patch')

prepare(){

    cd "${srcdir}/Feednix/src"
    patch -uN < $srcdir/abort-error.patch
    patch -uN < $srcdir/preview-error.patch

    cd ..
    patch -uN < $srcdir/autogen.patch
}

build(){
        cd Feednix
        ./autogen.sh
        ./configure
        make
}

package(){
        cd "${srcdir}/Feednix"
        make PREFIX=/usr DESTDIR="${pkgdir}" install

        if [[ ! -d "/etc/xdg/feednix" ]]; then
                install -D -m755 config.json "${pkgdir}/etc/xdg/feednix/config.json"
        fi 

        if [[ -f "$HOME/.config/feednix/config.json" ]]; then
                install -o $USER -g $USER -D -m600 config.json "${pkgdir}/${HOME}/.config/feednix/config.json.new"
        fi

        install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/feednix/LICENSE"
}
