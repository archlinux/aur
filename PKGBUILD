# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-pandoc
pkgver=0.9.1
pkgrel=1
pkgdesc='wrapper for the mighty Pandoc document converter (via MetaCPAN distribution)'
_dist=Pandoc
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-file-which' 'perl-http-tiny' 'perl-ipc-run3' 'perl-json-pp')
makedepends=('perl-test-exception')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/V/VO/VOJ/$_dist-$pkgver.tar.gz" "gh-issue-49.patch")
sha256sums=(dc9429b9b76e25f0a36a2f2294678b056202af00c5325fd0fffd3ad193b82ed3 09d89d03e3d8c7fda31b98b77a695168d6df3c32a058dff272666b8702bdbf6b)

prepare() {
    cd "$_dist-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/gh-issue-49.patch"
}

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
