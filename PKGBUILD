# Contributor:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=perl-sdl
pkgver=2.548
pkgrel=15
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
readonly -a patches=(
  github-pr304-dont-use-deprecated-macro.diff
  github-pr306-distinguish-owned-and-borrowed.diff
  github-pr308-fix-reference-counting-in-set_event_filter.diff
  surface-xs-declare-calc-offset-earlier.diff
  avoid-undefined-import.diff
  github-pr309-fix-boot-sdl-declaration.diff
  github-pr310-core-surface-test-use-4bpp.diff
)
source=(
  "https://cpan.metacpan.org/authors/id/${_cpan_author::1}/${_cpan_author::2}/$_cpan_author/SDL-$pkgver.tar.gz"
  "${patches[@]}"
)
sha512sums=(
  'bafc49dddb7e592861f822920915c73bf0c5eea3a6c567623b48a2332c7644caf1451e457545e6666adea5e314b23bcd85a3f3a52c770abfd498c0e4c0feae85'
  '9ac9d6185f0b1fba3c70f8eb32c2324619688bc12ce13792be24c006b7f93e9997b60f14bf8a92e3739653a2433ac52ddedb3eac35982b7e54e31d4559e9e11d'
  '02e448fcee25983f944f9fda42a79766226d2ff01bc3abc7ee3f712534e88c34fb91ee527d36044a53792e1b39a5303d60e69037df26f8ad9ac2e7966885b322'
  '2840f9a7173cdf3b1fb714c24f25d8d5da2fb11197a12104a07839679d2968c5ed78f32ac8487bc78f60725ffd3b86bbbdf168048c3e1a2ec2181757ad0c9e71'
  'c26a53e711b4f5c14430956afec0a2c8cd8c6280c471d428ba3bd3f8c20f337622023aac77b1679aad2ef9260207013d4cd9fd5af196cc6c1e409891fea69758'
  'de367c05c2bd0074c279b61679b5cbf012dbf70716b130c13a144dd20c4ea8fe27e0d6dfafb51237f16c5d8ee2b252baddefa87d51218a7daf43456b45b04bc8'
  '1f6f93a9b05dab10787b6cc0add4a359fb02b4686b1bef2f967f7eb9ad6a1e5588e63a7c61ae00fc66f1d9c163cb7838ed5dffb2b02c503e1a748b2c1f80e297'
  'ec13e27c2d66776e10ab1f15ac7750f2fd37b6d0d2cdd1e1ea1bd92f5c206461a768f815f7b74c6eb8beebfd19b80b2267ec8c99133df5c660d3334d5730522b'
)

prepare() {
  cd SDL-$pkgver

  for p in "${patches[@]}"; do
    patch -p1 -i "../${p}"
  done
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
