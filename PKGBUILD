# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname="uasm"
pkgver=2.47.1
pkgrel=1
pkgdesc="free MASM-compatible assembler based on JWasm"
arch=('x86_64')
url="http://www.terraspace.co.uk/uasm.html"
license=(
  'custom:JWasm License'
  'custom:Sybase Open Watcom Public License'
)
# options=(!strip debug)
# options=(!strip)
# PKGEXT=.pkg.tar
# source=('uasm::git+https://github.com/Terraspace/UASM.git#branch=v2.47.1')
source=(
  'uasm::git+https://github.com/Terraspace/UASM.git#commit=f36556139c658bb8f970579d6d84497210d10958'
  'suppress_color_from_help.patch'
)
md5sums=(
  'SKIP'
  '7a0e3562bfd82b3b9470bc67aaad2b03'
)


prepare() {

  # if [ "$(git rev-parse HEAD)"!="f36556139c658bb8f970579d6d84497210d10958" ];then
  #   echo "Error."
  #   echo "Branch v2.47.1 should be at f36556139c658bb8f970579d6d84497210d10958."
  #   exit 1
  # fi

  patch --verbose "$srcdir/$pkgname/errmsg.c" "$srcdir/suppress_color_from_help.patch"
  # patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"

}

build() {
  cd "$srcdir/$pkgname"
  # CFLAGS="-g" CXXFLAGS="-g" DEBUG=1 make -f GccUnix.mak
  make -f GccUnix.mak
}


package() {
  cd "$srcdir/$pkgname"

  install -v -Dm755 GccUnixR/uasm "$pkgdir/usr/bin/uasm"

  install -v -dDm755 "$pkgdir/usr/share/doc/uasm"

  install -v -m644 Readme.txt History.txt Doc/* "$pkgdir/usr/share/doc/uasm/" # 7 txts

  install -v -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
