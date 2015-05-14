# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=slatec-git
pkgver=latest
pkgrel=1
pkgdesc="SLATEC Common Mathematical Library"
arch=(i686 x86_64)
url=https://github.com/Rufflewind/slatec
license=(PD)
depends=()
makedepends=(git gcc-fortran)
provides=(slatec)
conflicts=(slatec)
source=($pkgname::git://github.com/Rufflewind/slatec)
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname"
    s=`git 2>/dev/null describe --long --tags`
    if [ $? -eq 0 ]
    then
        printf '%s' "$s" | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "`git rev-list --count HEAD`" \
                        "`git rev-parse --short HEAD`"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    make FC=gfortran all
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
