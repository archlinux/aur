# Maintainer: piernov <piernov@piernov.org>

pkgname=perl-mime-lite-html
pkgver=1.24
pkgrel=2
pkgdesc="Perl module that provides routine to transform a HTML page in a MIME-Lite mail"
arch=('any')
url="http://search.cpan.org/dist/MIME-Lite-HTML/"
license=('GPL')
depends=('perl' 'perl-mime-lite' 'perl-libwww' 'perl-html-parser')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/A/AL/ALIAN/MIME-Lite-HTML-${pkgver}.tar.gz"
         "fix_perl_hash_seed_issues.patch"
         "fix_random_ftbfs_testsuite.patch")
md5sums=('6ca475aaa73328f8c51b7002d828fe7e'
         'be20c7145fd5421c4e533ff80ebf6169'
         '77d07411e97aaf0e9f8bf0c578cce7e6')

build() {
  cd MIME-Lite-HTML-${pkgver}
  patch -p1 -i "${srcdir}/fix_perl_hash_seed_issues.patch"
  patch -p1 -i "${srcdir}/fix_random_ftbfs_testsuite.patch"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd MIME-Lite-HTML-${pkgver}

  # recreate ref files
  # ignore non-zero exit code that occurs since no tests are run
  perl -Iblib/lib t/20create_image_part.t 1||true
  perl -Iblib/lib t/50generic.t 1||true

  make test
}

package() {
  cd MIME-Lite-HTML-${pkgver}
  make DESTDIR="${pkgdir}" install
}
