# Maintainer : doragasu <doragasu at hotmail dot com>
# Contributor: Wes Brewer <brewerw@gmail.com>
# Contributor: original submitter speps <speps at aur dot archlinux dot org>

pkgname=cdcat
pkgver=2.3.1
pkgrel=3
pkgdesc="CD/DVD/Media catalog software (Qt based)"
arch=('i686' 'x86_64')
url="http://cdcat.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'libtar' 'lib7zip' 'p7zip' 'crypto++')
makedepends=('libmediainfo' 'libexif')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2"
        "qt5.patch"
        "$pkgname.desktop")
sha256sums=('7cb1bbd7646faf93359acda5835f510766c82e612bca577282571f13a8d5f01c'
        '4ac20e58828d4be095486c1a4d7d0e112ef32c2a7b7b9412ce24ae5f6d52772d'
        'c4ab593a72fc6c06c1e8ff4b52d86fb433308053083d4bfd611a53a54c251c67')

prepare() {
    cd $pkgname-$pkgver/src

# Use qt5 instead of qt4
    patch -p2 < ../../qt5.patch

# strip local path
    sed -i "s|/local||g" $pkgname.pro
}

build() {
    cd $pkgname-$pkgver/src
    qmake $pkgname.pro && make
}

package() {
    cd $pkgname-$pkgver/src
    make INSTALL_ROOT="$pkgdir" install

# desktop file
    install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

# icons
    for _s in 16x16 22x22 32x32 48x48 64x64; do
        install -Dm644 ../${pkgname}_logo_$_s.png \
            "$pkgdir/usr/share/icons/hicolor/$_s/apps/$pkgname.png"
    done
    install -Dm644 ../${pkgname}_logo.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.png"

# translations
        cd lang
        for _f in *.ts; do
            _tdir="$pkgdir/usr/share/locale/${_f:6:2}/LC_MESSAGES"
            install -d "$_tdir"
            lrelease -silent -qm "$_tdir/${_f/ts/qm}" $_f
        done
}

