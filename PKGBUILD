# Maintainer Daniel Landau <daniel+aur@landau.fi>

_pkgname=athame
pkgname=${_pkgname}-git
pkgver=r84.1459143
pkgrel=1
pkgdesc="Full Vim support for readline"
url="https://github.com/ardagnir/$_pkgname"
license=('GPL3')
depends=('glibc' 'ncurses')
optdepends=()
provides=("readline=6.3")
conflicts=("readline")
arch=('i686' 'x86_64')
options=(!emptydirs)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf
  git submodule init
  git submodule update
}

build() {
  cd $_pkgname

  # build with -fPIC for x86_64 (FS#15634)
  [[ $CARCH == "x86_64" ]] && CFLAGS="$CFLAGS -fPIC"

  ./configure --prefix=/usr
  make SHLIB_LIBS=-lncurses
}


package() {
    make -C $_pkgname DESTDIR="$pkgdir" install
    install -Dm644 $_pkgname/athamerc "$pkgdir"/etc/athamerc
}

