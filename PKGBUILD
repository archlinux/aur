pkgname=picard-git
pkgver=1.3.2.r469.g31555ed
pkgrel=1
pkgdesc="MusicBrainz tagging application"
arch=('i686' 'x86_64')
url="https://picard.musicbrainz.org"
license=('GPL')
depends=('python2-pyqt4' 'mutagen')
optdepends=('python2-discid: CD-Lookup feature'
            'chromaprint: AcoustID integration')
makedepends=('git')
provides=('picard')
conflicts=('picard' 'picard-qt' 'picard-bzr')
source=('git://github.com/metabrainz/picard.git'
        'https://github.com/metabrainz/picard/pull/479.diff')
md5sums=('SKIP'
         '1fc310a838add363df67adcf41623f4c')

pkgver(){
    cd "$srcdir/picard"
    git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

check() {
    cd "$srcdir/picard"
    python2 setup.py build_ext -i
    python2 setup.py test
    rm picard/util/astrcmp.so
}

prepare() {
    cd "$srcdir/picard"
    patch -u -p1 -i "$srcdir/479.diff" || continue
}

package() {
    cd "$srcdir/picard"
    python2 setup.py install --root=$pkgdir --optimize=1
    cp -r contrib/plugins/* "${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins/"
}
