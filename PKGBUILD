# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

# This package must not be "any" arch.
# The Build.PL script's '--with-sdl-config' acquires arch-specific library paths
# from the installed SDL instance, and puts that into the created package.
# Requires rebuild with every arch/config change in the provided SDL package.

_distname='Alien-SDL'
pkgname="perl-${_distname@L}"
pkgver=1.446
pkgrel=17
pkgdesc="Find and use the installed SDL library (contains architecture-specific configuration, determined at build time)"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('LicenseRef-GPL-1.0-or-later OR Artistic-1.0-Perl')
url="https://metacpan.org/dist/$_distname"
depends=(
  'perl'
  'perl-capture-tiny'
  'perl-file-sharedir'
  'sdl'
)
makedepends=(
  'perl-archive-extract'
  'perl-archive-zip'
  'perl-file-which'
  'perl-module-build'
  'perl-text-diff'
  'perl-text-patch'
)
options=('!emptydirs' 'purge')
_author='FROGGS'
source=("https://search.cpan.org/CPAN/authors/id/${_author::1}/${_author::2}/$_author/$_distname-$pkgver.tar.gz")
sha512sums=('dfb5f104f449857b9567ca93a0c3b15aed2618e27019569c95c4b7469e1f7d5cc390fe2dda9c6add41e9648c1f6efe053d08a4bd0fcc5bc546a217721bea824c')
_distdir="$_distname-$pkgver"

prepare() {
  cd "$srcdir/$_distdir"

  # Workaround bug with --with-sdl-config
  sed -i '/^GetOptions/d' Build.PL
}

build() {
  cd "$srcdir/$_distdir"

  ( unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

    # install module in vendor directories
    /usr/bin/perl Build.PL --with-sdl-config
    /usr/bin/perl Build
  )

}

check() {
  cd "$srcdir/$_distdir"

  ( unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"

  ( unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    /usr/bin/perl Build install installdirs=vendor destdir="$pkgdir"
  )

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
