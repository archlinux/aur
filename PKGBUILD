pkgname='wkhtmltopdf-alpha'
pkgver='0.13'
pkgrel='1'
pkgdesc="Command line tools to render HTML into PDF and various image formats"
arch=('i686' 'x86_64')
url="http://wkhtmltopdf.org/"
license=('LGPL3')
depends=('qtwebkit')
makedepends=('schroot')
conflicts=('wkhtmltopdf')
optdepends=('xorg-server: wkhtmltopdf needs X or Xvfb to operate')

build() {
    cd "$srcdir"

    if [ ! -e "wkhtmltopdf" ]
    then
        git clone --recursive --depth 1 --branch "$pkgver" https://github.com/wkhtmltopdf/wkhtmltopdf.git
    fi

    cd "wkhtmltopdf"
    git submodule update

    case "$CARCH" in
    i686)
        python2 scripts/build.py linux-generic-i386 -chroot-build
        ;;
    x86_64)
        python2 scripts/build.py linux-generic-amd64 -chroot-build
        ;;
    esac
}

package() {
    cd "$srcdir/wkhtmltopdf/static-build/linux-generic-amd64/wkhtmltox/"

    cp -a . "$pkgdir/usr"
}
