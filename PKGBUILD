# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=alien_package_converter
pkgver=8.95
pkgrel=3
pkgdesc="Alien is a program that converts between the rpm, dpkg, stampede slp, and slackware tgz file formats"
arch=('any')
url="http://joeyh.name/code/alien/"
license=('GPL2')
depends=('perl' 'debhelper' 'cpio' 'rpm-org' 'bzip2')
makedepends=('perl')
options=('!emptydirs')
source=("http://ftp.de.debian.org/debian/pool/main/a/alien/alien_$pkgver.tar.xz")
sha256sums=('37a22587c33810feab323474bdadbf969fda2eb4e720b2ca01b40d82d6f71a17')

build() {
  cd "${srcdir}/alien-${pkgver}"
  # Setting these env variables overwrites any command-line-options we don't want...
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=site DESTDIR='${pkgdir}'" \
    PERL_MB_OPT="--installdirs site --destdir '${pkgdir}'" \
    PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
    MODULEBUILDRC=/dev/null

  perl Makefile.PL
  
  make DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr" VARPREFIX="${pkgdir}"
}

package() {
  cd "${srcdir}/alien-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr" VARPREFIX="${pkgdir}" INSTALLSITELIB=/usr/lib/perl5/5.28/site_perl INSTALLVENDORLIB=/usr/lib/perl5/5.28/vendor_perl install 
  mv "${pkgdir}"/usr/bin/site_perl/alien "${pkgdir}"/usr/bin
}
