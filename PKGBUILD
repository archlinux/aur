# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=alien_package_converter
pkgver=8.93
pkgrel=2
pkgdesc="Alien is a program that converts between the rpm, dpkg, stampede slp, and slackware tgz file formats"
arch=('any')
url="http://joeyh.name/code/alien/"
license=('GPL2')
depends=('perl>=5.004')
makedepends=('perl>=5.004')
optdepends=('debhelper>=3' 'rpm-org' 'dpkg' 'bzip2')
options=('!emptydirs')
source=("http://ftp.de.debian.org/debian/pool/main/a/alien/alien_$pkgver.tar.gz")
sha256sums=('deb4e0c590ea7c44f2bc806b2c4cde6abbef32017ae6d06ee30539ae28faf896')

build() {
  cd "${srcdir}/alien"
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
  cd "${srcdir}/alien"
  make DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr" VARPREFIX="${pkgdir}" INSTALLSITELIB=/usr/lib/perl5/site_perl INSTALLVENDORLIB=/usr/lib/perl5/vendor_perl install 
  mv "${pkgdir}"/usr/bin/site_perl/alien "${pkgdir}"/usr/bin
}
