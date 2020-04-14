# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Arthur Titeica <arthur dot titeica at gmail dot com>

pkgname=ttfautohint-git
pkgver=1.8.3.r16.g701aa67
pkgrel=3
pkgdesc='Provides automated hinting process for web fonts'
arch=('i686' 'x86_64')
url="http://www.freetype.org/${pkgname%-git}"
license=('GPL' 'custom')
depends=('freetype2' 'harfbuzz' 'qt5-base')
makedepends=('pandoc'
             'inkscape'
             'imagemagick'
             'noto-fonts'
             # 'noto-fonts-alpha'
             'texlive-core'
             'xorg-xwininfo')
provides=("${pkgname/%-git}")
conflicts=("${provides[@]}")
source=("git://repo.or.cz/${pkgname/-/.}"
        "git://git.sv.gnu.org/gnulib.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --tags --abbrev=7 --match="v*" HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "${pkgname%-git}"
    git submodule init
    git config submodule.gnulib.url "$srcdir/gnulib"
    git submodule update
    echo "GNULIB_URL='$srcdir/gnulib'" > bootstrap.conf
    sed -i -e '400s/yes/no/' bootstrap
    ./bootstrap --force
}

build() {
    cd "${pkgname%-git}"
    export QMAKE='/usr/bin/qmake'
    export MOC='/usr/bin/moc'
    export UIC='/usr/bin/uic'
    export RCC='/usr/bin/rcc'
    export TTFONTS='/usr/share/fonts/noto'
    ./configure \
        --prefix=/usr \
        --with-qt=/usr/lib/qt \
        --with-freetype-config="pkg-config freetype2"
    make
}

check() {
    cd "${pkgname%-git}"
    make -k check
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir" install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING FTL.TXT
}
