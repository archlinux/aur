# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Abhishek Dasgupta <michael.gruz@gmail.com>
pkgname=primer3-git
_pkgname=(${pkgname%-git})
pkgver=2.6.1.r135.g4d4c905
pkgrel=1
pkgdesc="Tool to design flanking oligo nucleotides for DNA amplification"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gcc-libs')
url=https://github.com/primer3-org/primer3
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+https://github.com/primer3-org/primer3.git"
	"001-hardening.patch"
	"002-primer_thermodynamic_parameters_path_2_etc.patch"
	"003-set_prefix.patch"
	"004-buildflags.patch"
	"005-gcc15.patch")
sha256sums=('SKIP'
            '8d09fbaf0dd373437b8b42f0178edfafc5230997ada0b7400e7018eced9d3770'
            'a86e6d19818dbdc869a6d54dc8ae315cb7c6c4e4c183eeb260b1954984c48e6f'
            '053a9aac933a4d05e5d0be4219e76fcebd7a4e74174754c829ab18ed3d28c695'
            '5f6324ffd99f191466591450d28db268e1756790d3493297497f22682a5409d4'
            'bd915bb98ab25898ca797b2e515eb198526a751f52751a9a75c18e5970226ddf')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "../001-hardening.patch"
  patch -Np1 -i "../002-primer_thermodynamic_parameters_path_2_etc.patch"
  patch -Np1 -i "../003-set_prefix.patch"
  patch -Np1 -i "../004-buildflags.patch"
  patch -Np1 -i "../005-gcc15.patch"
}

build() {
  cd "$srcdir/$_pkgname/src"
  make CFLAGS=-fpermissive
}

check() {
  cd "$srcdir/$_pkgname/src"
  make test
}

package() {
  cd "$srcdir/$_pkgname/src"
  for EXEC in long_seq_tm_test ntdpal ntthal oligotm primer3_core; do
      install -Dm755 $EXEC "$pkgdir"/usr/bin/$EXEC
  done
  install -dm755 "$pkgdir"/usr/share
  cp -dpr --no-preserve=ownership primer3_config "$pkgdir"/usr/share/primer3
}
