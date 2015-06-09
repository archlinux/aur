
# Contributor: Philipp Sieweck

pkgname=cvc4
pkgver=1.4
pkgrel=3
pkgdesc="CVC4: An automatic theorem prover"
arch=(i686 x86_64)
url="http://cvc4.cs.nyu.edu/web/"
depends=('boost' 'libantlr3c' 'gmp')
optdepends=('readline: for an improved interaction support'
            # 'glpk' -- incompatible :(
            'cln: Alternative to gmp; can offer more performance')
license=('custom')
source=("http://cvc4.cs.nyu.edu/builds/src/cvc4-$pkgver.tar.gz"
        configure-boost-version.patch)
md5sums=('581c559c02b94fcb18b2e5b11432e009'
         'd9cbfad2415d4a675ebabf3f7c5cdd5d')
options=(!libtool)

if [[ -r /usr/lib/libcln.so ]]; then
  WITH_CLN="--with-cln --enable-gpl"
  depends=('cln' ${depends[@]});
fi

# ArchLinux GLPK is not compatible
# if [[ -r /usr/lib/libglpk.so ]]; then
#   WITH_GLPK="--with-glpk"
#   depends=('glpk' ${depends[@]});
# fi

prepare() {
    patch "$srcdir"/cvc4-$pkgver/configure configure-boost-version.patch
}

build() {
    cd "$srcdir"/cvc4-$pkgver
    ./configure --prefix=/usr --enable-optimization --disable-doxygen-doc $WITH_CLN
    make
}

package() {
    cd "$srcdir"/cvc4-$pkgver
    make prefix="$pkgdir"/usr install
    install -D COPYING "$pkgdir"/usr/share/licenses/cvc4/LICENCE

    dirs=("usr/share/perl5" "usr/lib/pyshared" "usr/lib/php" "usr/lib/jni"
          "usr/lib/csharp" "usr/share/java" "usr/share/php" "usr/share/csharp"
          "usr/lib/ruby" "usr/lib/tcltk" "usr/lib/perl5" "usr/share/pyshared"
          "usr/lib/ocaml/cvc4" "usr/lib/ocaml")

    for d in "${dirs[@]}"; do rmdir "$pkgdir/$d"; done
}
