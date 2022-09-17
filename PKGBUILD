# Maintainer: Bruno Ancona <bruno at powerball253 dot com>

_pkgname=hplip-printer-app
pkgname=$_pkgname-git
pkgver=r57.bcce338
pkgrel=1
pkgdesc=" HPLIP Printer Application"
arch=('x86_64')
depends=('libcups' 'mupdf-tools')
makedepends=('git')
source=('git+https://github.com/OpenPrinting/hplip-printer-app.git'
        'git+https://github.com/michaelrsweet/pappl.git'
        'git+https://github.com/OpenPrinting/pappl-retrofit.git'
        'git+https://github.com/OpenPrinting/cups-filters.git'
        'hplip-printer-app-makefile.patch'
        'pappl-retrofit-makefile.patch')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP'
            'ef51e64a325c66ee9a05c236bb9ba863d234c2ebbd17285c2dba8d0de8832d89'
            '6a2532e722d1566274ae0d7f124ff1f51096fb81341ffd7bfe0235dc2eee0bf2')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    # Build pappl
	cd pappl
    ./configure --prefix=/ --exec-prefix=/usr --libdir="$srcdir/pappl/pappl" --includedir="$srcdir/pappl"
    make
    cd ..

    # Build cups-filters
    cd cups-filters
    ./autogen.sh
    ./configure --prefix=/ --exec-prefix=/usr --libdir="$srcdir/cups-filters/.libs" --includedir="$srcdir/cups-filters"
    make
    sed -i 's/-I.*/-I$\{includedir\}/' *.pc
    cd ..

    # Build pappl-retrofit
    cd pappl-retrofit
    ./autogen.sh
    PKG_CONFIG_PATH="$srcdir/pappl/pappl:$srcdir/cups-filters" ./configure --prefix=/ --exec-prefix=/usr --libdir="$srcdir/pappl-retrofit/.libs" --includedir="$srcdir/pappl-retrofit"
    patch Makefile < "$srcdir/pappl-retrofit-makefile.patch"
    make
    sed -i 's/-I.*/-I$\{includedir\}/' libpappl-retrofit.pc
    cd ..

    # Build hplip-printer-app
    cd $_pkgname
    patch Makefile < "$srcdir/hplip-printer-app-makefile.patch"
    PKG_CONFIG_PATH="$srcdir/pappl/pappl:$srcdir/cups-filters:$srcdir/pappl-retrofit" make \
        PAPPL-RETROFIT="$srcdir/pappl-retrofit/.libs/libpappl-retrofit.a" \
        PPD="$srcdir/cups-filters/.libs/libppd.a" \
        CUPS-FILTERS="$srcdir/cups-filters/.libs/libcupsfilters.a" \
        FONTEMBED="$srcdir/cups-filters/.libs/libfontembed.a" \
        PAPPL="$srcdir/pappl/pappl/libpappl.a"
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir/" install
}
