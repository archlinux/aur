# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-linenoise
pkgver=0.1.0
pkgrel=4
pkgdesc="Bindings to linenoise"
arch=('i686' 'x86_64')
depends=('perl6')
checkdepends=('perl')
makedepends=('git' 'make' 'perl6-librarymake')
groups=('perl6')
url="https://github.com/hoelzro/p6-linenoise"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/hoelzro/p6-linenoise)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  mkdir -p blib/lib
  cat > build.p6 <<'EOF'
my $workdir = $*CWD;
my %vars = get-vars("$workdir/blib/lib");
%vars<helper> = 'resources/libraries/' ~ $*VM.platform-library-name('liblinenoise'.IO);
process-makefile("$workdir", %vars);
shell(%vars<MAKE>);
EOF
  perl6 -MLibraryMake build.p6
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
