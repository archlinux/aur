# Contributor:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=perl-sdl
pkgver=2.548
pkgrel=12
pkgdesc='Simple DirectMedia Layer for Perl'
arch=('x86_64')
license=('LGPL')
url='https://metacpan.org/dist/SDL'
depends=(
  'perl>=5.008'
  'perl-alien-sdl>=1.446'
  'perl-cpan>=1.92'
  'perl-file-sharedir>=1.00'
  'perl-tie-simple'
  'perl-scalar-list-utils'
  'sdl_net'
  'sdl_ttf'
  'sdl_image'
  'sdl_mixer'
  'sdl_gfx'
  'sdl_pango'
)
makedepends=(
  'perl-capture-tiny'
  'perl-extutils-cbuilder'
  'perl-module-build>=0.40'
  'perl-test-most>=0.21'
  'perl-test-simple>=0.88'
)
options=('!emptydirs')
_cpan_author='FROGGS'
source=(
  "https://cpan.metacpan.org/authors/id/${_cpan_author::1}/${_cpan_author::2}/$_cpan_author/SDL-$pkgver.tar.gz"
  github-pr304-dont-use-deprecated-macro.diff
  github-pr306-distinguish-owned-and-borrowed.diff
)
sha512sums=(
  'bafc49dddb7e592861f822920915c73bf0c5eea3a6c567623b48a2332c7644caf1451e457545e6666adea5e314b23bcd85a3f3a52c770abfd498c0e4c0feae85'
  '9ac9d6185f0b1fba3c70f8eb32c2324619688bc12ce13792be24c006b7f93e9997b60f14bf8a92e3739653a2433ac52ddedb3eac35982b7e54e31d4559e9e11d'
  '02e448fcee25983f944f9fda42a79766226d2ff01bc3abc7ee3f712534e88c34fb91ee527d36044a53792e1b39a5303d60e69037df26f8ad9ac2e7966885b322'
)

prepare() {
  cd SDL-$pkgver

  # https://github.com/PerlGameDev/SDL/pull/304
  patch -p1 -i ../github-pr304-dont-use-deprecated-macro.diff

  # https://github.com/PerlGameDev/SDL/pull/306
  patch -p1 -i ../github-pr306-distinguish-owned-and-borrowed.diff
}

build() {
  cd SDL-$pkgver
  # Perl selects the proper CFLAGS set for binary modules
  unset CFLAGS
  # install module in vendor directories
  perl Build.PL installdirs=vendor
  perl Build
}

check() {
  cd SDL-$pkgver
  perl Build test
}

package() {
  cd SDL-$pkgver
  perl Build install destdir="$pkgdir"
}
