# Maintainer Daniel Landau <daniel+aur@landau.fi>

_pkgname=athame
_readline=readline-6.3
pkgname=${_pkgname}-git
pkgver=r174.e9663ed
pkgrel=1
pkgdesc="Full Vim support for readline"
url="https://github.com/ardagnir/$_pkgname"
license=('GPL3')
depends=('ncurses')
optdepends=()
provides=("readline=6.3")
conflicts=("readline")
arch=('i686' 'x86_64')
options=(!emptydirs)
source=("git+$url.git" https://ftp.gnu.org/gnu/readline/$_readline.tar.gz https://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-{001..008})
install="$pkgname.install"
sha256sums=('SKIP'
            '56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43'
            '1a79bbb6eaee750e0d6f7f3d059b30a45fc54e8e388a8e05e9c3ae598590146f'
            '39e304c7a526888f9e112e733848215736fb7b9d540729b9e31f3347b7a1e0a5'
            'ec41bdd8b00fd884e847708513df41d51b1243cecb680189e31b7173d01ca52f'
            '4547b906fb2570866c21887807de5dee19838a60a1afb66385b272155e4355cc'
            '877788f9228d1a9907a4bcfe3d6dd0439c08d728949458b41208d9bf9060274b'
            '5c237ab3c6c97c23cf52b2a118adc265b7fb411b57c93a5f7c221d50fafbe556'
            '4d79b5a2adec3c2e8114cbd3d63c1771f7c6cf64035368624903d257014f5bea'
            '3bc093cf526ceac23eb80256b0ec87fa1735540d659742107b6284d635c43787')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  pushd $_pkgname
  git submodule init
  git submodule update
  popd
  cd $_readline
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf
  for f in ../readline63-*
  do
    patch -p0 < $f
  done
  patch -p1 < ../$_pkgname/readline.patch
  cp -r ../$_pkgname/vimbed .
  cp ../$_pkgname/athame.* .
  cp ../$_pkgname/athame_readline.h athame_intermediary.h
}

build() {
  cd $_readline
  # build with -fPIC for x86_64 (FS#15634)
  [[ $CARCH == "x86_64" ]] && CFLAGS="$CFLAGS -fPIC"

  ./configure --prefix=/usr
  make SHLIB_LIBS=-lncurses
}


package() {
  make -C $_readline DESTDIR="$pkgdir" install
  install -Dm644 $_pkgname/athamerc "$pkgdir"/etc/athamerc
}

