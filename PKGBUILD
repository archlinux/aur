# Maintainer: Noeljnuior <liamgliamgmailcom>
# Contributor: redden0t8 -- contact via Arch Linux forums or AUR
# Contributor: Andreas Radke <andyrtr at archlinux.org>
# Contributor: Thomas Baechler <thomas.baechler@rwth-aachen.de>

pkgname=cups-pdf-to-pdf-git
pkgver=3.0.1_r7.63ab5e7
uppkgver=3.0.1
pkgrel=1
pkgdesc="CUPS-PDF v3 with text print support"
arch=(i686 x86_64)
depends=('cups' 'ghostscript')
makedepends=('git')
provides=("cups-pdf=${pkgver}")
conflicts=('cups-pdf')
url="https://github.com/alexivkin/CUPS-PDF-to-PDF"
license=('GPL2')
source=("$pkgname::git+https://github.com/alexivkin/CUPS-PDF-to-PDF")
backup=(etc/cups/cups-pdf.conf)
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname/"
    [ -z "$CC" ] && CC=gcc
    $CC $CFLAGS -lcups -Wall -o cups-pdf cups-pdf.c
    echo CFLAGS $CFLAGS
}

package() {
    cd "$srcdir/$pkgname/"
    install -D -m700 cups-pdf $pkgdir/usr/lib/cups/backend/cups-pdf

    # Install Postscript Color printer
    install -D -m644 CUPS-PDF_opt.ppd $pkgdir/usr/share/cups/model/CUPS-PDF_opt.ppd
    install -D -m644 CUPS-PDF_noopt.ppd $pkgdir/usr/share/cups/model/CUPS-PDF_noopt.ppd

    # Install config file & use lp group from cups pkg
    install -D -m644 -g lp cups-pdf.conf $pkgdir/etc/cups/cups-pdf.conf
}

pkgver() {
    cd "$srcdir/$pkgname/"
  printf "%s_r%s.%s" "$uppkgver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
