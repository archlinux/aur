# Contributor: Your Name <youremail@domain.com>
# Based on: https://wiki.archlinux.org/title/Perl_package_guidelines#PKGBUILD_Examples
_dist=File-DirList
pkgname=perl-file-dirlist
pkgver=0.05
pkgrel=2
pkgdesc='File::DirList - provide a sorted list of directory content'
arch=('any')
url="https://metacpan.org/release/$_dist"
# The module license is the same as Perl, so the same of `perl` is here
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
_author_id='TPABA'
source=("https://cpan.metacpan.org/authors/id/${_author_id::1}/${_author_id::2}/$_author_id/$_dist/$_dist-$pkgver.tar.gz"
        "tests_use_licenses_dir.patch")
sha256sums=('993b7d7662e55798448a1edaccb9abd281d2bd23be7eab99f569b8e2962d3bc3'
            '7d7c03da3f11c7ea1007fdf08a34b04feb9f4256688dd17fed53e7520b9f69b2')

prepare() {
  cd "$srcdir/$_dist-$pkgver"
  # Arch tweaked version of:
  # https://sources.debian.org/data/main/libf/libfile-dirlist-perl/0.05-3/debian/patches/home-dir-to-common-licenses.patch
  patch -Np1 -i "$srcdir/tests_use_licenses_dir.patch"
}

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
