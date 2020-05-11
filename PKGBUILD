# $Id$
# Maintainer: Gergely Daróczi <daroczig@rapporter.net>
# Based on [r-devel@AUR](https://aur.archlinux.org/packages/r-devel) by Florian Breitwieser <florian.bw@gmail.com>

pkgname=r-devel-svn
pkgver=r78409
pkgrel=1
pkgdesc="Language and environment for statistical computing and graphics - development version (SVN)"
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.r-project.org/'
depends=('blas' 'bzip2' 'curl' 'icu' 'lapack'
         'libjpeg' 'libpng' 'libtiff'
         'libxmu' 'libxt' 'ncurses' 'pango'
         'pcre2' 'perl'
         'readline' 'unzip' 'which'
         'xz' 'zip' 'zlib')
makedepends=('gcc-fortran' 'rsync' 'subversion')
conflicts=('r-devel') # r-devel.{png,desktop}, etc/r-devel /usr/bin entries
backup=("etc/r-devel/Makeconf" "etc/r-devel/Renviron" "etc/r-devel/ldpaths" "etc/r-devel/repositories")
options=('!makeflags')
_svnbranch=r-trunk
source=($_svnbranch::'svn+https://svn.r-project.org/R/trunk'
        'r-devel.desktop'
	      'r-devel.png')
md5sums=('SKIP'
         'db4aaeb54dec28f831e3fac64705d4be'
         '8862f998939a07a2391840f99ab4a4f6')
install=r-devel.install

pkgver() {
    cd ${_svnbranch}
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
    cd ${srcdir}/${_svnbranch}
    ./tools/rsync-recommended
    ./configure --prefix=/opt/r-devel \
		--enable-R-shlib \
		--with-lapack \
		--with-blas \
		F77=gfortran \
		LIBnn=lib
    make
}

package() {
    cd ${srcdir}/${_svnbranch}
    make -j1 DESTDIR=${pkgdir} install

    # install some freedesktop.org compatibility
    install -Dm644 ${srcdir}/r-devel.desktop ${pkgdir}/usr/share/applications/r-devel.desktop
    install -Dm644 ${srcdir}/r-devel.png ${pkgdir}/usr/share/pixmaps/r-devel.png

    # move the config directory to /etc and create symlinks
    install -d ${pkgdir}/etc/r-devel
    cd ${pkgdir}/opt/r-devel/lib/R/etc
    for i in *; do
	mv -f ${i} ${pkgdir}/etc/r-devel
	ln -s /etc/r-devel/${i} ${i}
    done

    # links
    install -d ${pkgdir}/usr/bin
    ln -s /opt/r-devel/bin/R ${pkgdir}/usr/bin/R-devel
    ln -s /opt/r-devel/bin/Rscript ${pkgdir}/usr/bin/Rscript-devel
}
