# $Id$
# Contributor:	Gergely Daróczi <gergely@snowl.net>
# Based on [r-devel@AUR](http://aur.archlinux.org/packages.php?ID=52561) by Florian Breitwieser <florian.bw@gmail.com>

pkgname=r-deprecated-215
pkgver=215
pkgrel=3
pkgdesc="Language and environment for statistical computing and graphics - deprecated version (2.15.3)"
arch=('i686' 'x86_64')
license=('GPL')
url=('http://www.r-project.org/')
depends=('blas' 'lapack' 'bzip2'  'libpng' 'libjpeg' 'libtiff'
         'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs'
         'tk' 'libxt' 'libxmu' 'pango' 'xz')
makedepends=('gcc-fortran')
options=('!makeflags')
source=('http://cran.rapporter.net/src/base/R-2/R-2.15.3.tar.gz'
	'r-215.desktop'
	'r-215.png')
install=r-215.install

build() {
    cd ${srcdir}/R-2.15.3
    ./tools/rsync-recommended
    ./configure --prefix=/opt/r-215 \
		--enable-R-shlib \
		--with-lapack \
		--with-blas \
		F77=gfortran \
		LIBnn=lib
    make
}

package() {
    cd ${srcdir}/R-2.15.3
    make -j1 DESTDIR=${pkgdir} install

    # install some freedesktop.org compatibility
    install -Dm644 ${srcdir}/r-215.desktop ${pkgdir}/usr/share/applications/r-215.desktop
    install -Dm644 ${srcdir}/r-215.png ${pkgdir}/usr/share/pixmaps/r-215.png

    # move the config directory to /etc and create symlinks
    install -d ${pkgdir}/etc/R-215
    cd ${pkgdir}/opt/r-215/lib/R/etc
    for i in *; do
	mv -f ${i} ${pkgdir}/etc/R-215
	ln -s /etc/R-215/${i} ${i}
    done

    # links
    install -d ${pkgdir}/usr/bin
    ln -s /opt/r-215/bin/R ${pkgdir}/usr/bin/R-215
    ln -s /opt/r-215/bin/Rscript ${pkgdir}/usr/bin/Rscript-215

    # clear up stuffs
    rm -rf ${srcdir}/R-2.15.35
}

md5sums=('b2f1a5d701f1f90679be0c60e1931a5c'
	'74294ec8b4b06b6d43f6b48d4517de6e'
	'ba441e25f707d69566b84d90ca071ded')
