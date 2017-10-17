# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-gcrypt'
pkgver='1.26'
pkgrel='1'
pkgdesc="Perl/CPAN Module Crypt::GCyrpt: Perl interface to the GNU Cryptographic library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'libgcrypt>=1.8.1')
makedepends=()
url='https://metacpan.org/release/Crypt-GCrypt'
# The source package of debian contains three patches that fix different issues
# e.g. https://rt.cpan.org/Public/Bug/Display.html?id=97201
# We want them.
source=("http://search.cpan.org/CPAN/authors/id/A/AA/AAR/Crypt-GCrypt-$pkgver.tar.gz"
  'http://http.debian.net/debian/pool/main/libc/libcrypt-gcrypt-perl/libcrypt-gcrypt-perl_1.26-5.debian.tar.xz')
md5sums=( 'd23084ed878e5d12d4956c39e6f2b813'
  'feadad19cee085c510e0d4e3030c5a90')
sha512sums=('26a55539297ab0ba12d8732a15e3797aa5ee74fad01edc11ef55f25f0b26d8d03381696e65ec057e191866a6a5221f34af97572680c48e1336b08ab50cad3e89'
  'cd7bad47b7b09f2fb98c4cac351f712450051fa7481dcf44ba58370440597d0e115f03108b5fee7b7d19ac8dab6e0a7a5be9c170448fe2ab60258d4c5662b3ee')
_distdir="Crypt-GCrypt-$pkgver"

prepare() {
    cd "$srcdir/$_distdir"

    patch -p1 < ../debian/patches/gcrypt-1.6.patch
    patch -p1 < ../debian/patches/gcc5-warnings.patch
    patch -p1 < ../debian/patches/0001-Use-an-encryption-key-in-the-test-suite.patch
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
