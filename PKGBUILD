# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93 at yahoo dot it>
# Based on: https://wiki.archlinux.org/title/Perl_package_guidelines#PKGBUILD_Examples
_dist=File-DirList
pkgname=perl-file-dirlist
pkgver=0.05
pkgrel=3
pkgdesc='File::DirList - provide a sorted list of directory content'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=(perl)
options=('!emptydirs' purge)
_author_id='TPABA'
source=("https://cpan.metacpan.org/authors/id/${_author_id::1}/${_author_id::2}/$_author_id/$_dist/$_dist-$pkgver.tar.gz"
        "tests_use_licenses_dir.patch")
sha256sums=('993b7d7662e55798448a1edaccb9abd281d2bd23be7eab99f569b8e2962d3bc3'
            '3c88c35b1f5a7c1581a0869a2403a854b5e742187840cb9f38e165ed788c8952')

prepare() {
  cd "$srcdir/$_dist-$pkgver"
  # Arch tweaked version of:
  # https://sources.debian.org/data/main/libf/libfile-dirlist-perl/0.05-3/debian/patches/home-dir-to-common-licenses.patch
  patch -Np1 --binary -i "$srcdir/tests_use_licenses_dir.patch"
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
