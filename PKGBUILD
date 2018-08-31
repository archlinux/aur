# Maintainer : doragasu <doragasu at hotmail dot com>
# Contributor: Wes Brewer <brewerw@gmail.com>
# Contributor: original submitter speps <speps at aur dot archlinux dot org>

pkgname=cdcat
pkgver=2.3.1
pkgrel=2
pkgdesc="CD/DVD/Media catalog software (Qt based)"
arch=('i686' 'x86_64')
url="http://cdcat.sourceforge.net/"
license=('GPL')
depends=('qt4' 'libtar' 'lib7zip' 'p7zip' 'crypto++')
makedepends=('libmediainfo' 'libexif')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2"
        "byte_type.patch"
        "$pkgname.desktop")
sha256sums=('7cb1bbd7646faf93359acda5835f510766c82e612bca577282571f13a8d5f01c'
        'baa15e406f3620dfe031e56b55c97bf2e20261c7fde54e1df4232871ddce8782'
        'c4ab593a72fc6c06c1e8ff4b52d86fb433308053083d4bfd611a53a54c251c67')

prepare() {
    cd $pkgname-$pkgver/src

# Correcty byte type
    patch -p2 < ../../byte_type.patch

# strip local path
    sed -i "s|/local||g" $pkgname.pro

# use cryptopp instead of crypto++
    sed -i 's/crypto++/cryptopp/g' `grep -rl crypto++`
}

build() {
    cd $pkgname-$pkgver/src
    qmake-qt4 $pkgname.pro && make
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
            lrelease-qt4 -silent -qm "$_tdir/${_f/ts/qm}" $_f
        done
}

