# Contributor: Christopher Arndt <chris@chrisarndt.de>
# Contributor: Luis Pablo Gasparotto <lpgasparotto at gmail dot com>
# Contributor: Phillip Fynan <pfynan@gmail.com>
# Maintainer: Peter Sutton <peter@foxdogstudios.com>

_pkgver_year=2020
_pkgver_month=05
_pkgver_day=06

pkgname=abcmidi
pkgver=$_pkgver_year$_pkgver_month$_pkgver_day
pkgrel=1
pkgdesc='A set of tools for converting ABC files to MIDI files and vice versa, as well as other small utilities'
url="https://ifdo.ca/~seymour/runabc/top.html"
license=('GPL')
depends=()
makedepends=()
changelog=ChangeLog
source=('parseabc.patch'
        "https://ifdo.ca/~seymour/runabc/abcMIDI-${_pkgver_year}.${_pkgver_month}.${_pkgver_day}.zip")
arch=(x86_64)
sha256sums=('6fda05d5ddd6ce97de3a54048bb6f20400045eb3fbd646e2f43fed0aa6992d53'
            '69939ef6d331c0d920b3a7a2834b1fca6ba0e6da867b6f960b222c0b9861545f')

prepare() {
    patch "$srcdir"/abcmidi/parseabc.c "$srcdir"/parseabc.patch
}

build() {
    cd "$srcdir"/abcmidi
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir"/abcmidi

    make DESTDIR="$pkgdir/" install

    # Install programming documentation to docdir
    install -m 755 -d "$pkgdir"/usr/share/doc/$pkgname/programming

    install -m 644 doc/programming/*.txt doc/programming/*.abc \
                   "$pkgdir"/usr/share/doc/$pkgname/programming

    # Install example ABC files to docdir
    install -m 755 -d "$pkgdir"/usr/share/doc/$pkgname/samples
    install -m 644 samples/*.abc "$pkgdir"/usr/share/doc/$pkgname/samples
}
