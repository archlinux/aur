# Maintainer: webstrand <webstrand at gmail dot com>
pkgname=perl6-panda
pkgver=2015.12.r0.g4709e93
pkgrel=1
pkgdesc="Perl 6 module manager."
arch=('any')
url="http://moarvm.com/"
license=(MIT)
depends=("rakudo>=2015.12")
source=("$pkgname::git+https://github.com/tadzik/panda.git#tag=2015.12"
        "PERL6LIB_bootstrap.patch")
sha512sums=('SKIP'
            'f4bf18b5f25c809e275a98db69310328e600694722c3f6a7da0ed28e473f6432566bb8b820d1e770bcf0b7083be69913ca6331da8d8d8c107dda4c609bc52837')

provides=('perl6-file-find'
          'perl6-shell-command'
          'perl6-json-fast')

conflicts=('perl6-file-find'
           'perl6-shell-command'
           'perl6-json-fast')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    patch -p0 < "$srcdir/PERL6LIB_bootstrap.patch"
}

build() {
    cd "$pkgname"
    HOME="$srcdir/install"  ./bootstrap.pl
}

package() {
    mkdir -p "$pkgdir/usr/share/perl6/"

    # Move the installation into +/usr/share/perl6/vendor
    _perl6dir=$(HOME="$srcdir/install" perl6 -e "put CompUnit::RepositoryRegistry.repository-for-name('home')" | cut -d'#' -f2-);
    cp -rT "$_perl6dir" "$pkgdir/usr/share/perl6/vendor"

    # Remove the panda repo files. Vendor is not writable.
    cd "$pkgdir/usr/share/perl6/"
    rm -d vendor/repo.lock vendor/panda/state vendor/panda

    # Make symlinks to the panda binaries
    mkdir -p "$pkgdir/usr/bin"
    cd "$pkgdir/usr/share/perl6/vendor/bin"
    for _file in *; do
        ln -s "/usr/share/perl6/vendor/bin/$_file" "$pkgdir/usr/bin/$_file"
    done

    install -Dm 644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 "$srcdir/$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}

