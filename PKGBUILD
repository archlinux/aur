# Maintainer: aksr <aksr at t-com dot me>
pkgname=mawk-git
pkgver=20171017.r114.f448f23_1.9.9.6.r6.f1c6a55
_m2ver=1.9.9.6
pkgrel=1
epoch=
pkgdesc="Both Dickey's and Brennan's versions of mawk"
arch=('i686' 'x86_64')
url="https://github.com/ThomasDickey/mawk-snapshots"
url="https://github.com/mikebrennan000/mawk-2"
license=('GPL' 'GPL3')
categories=()
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "mawk2-git")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/ThomasDickey/mawk-snapshots"
        "mawk-2::git+https://github.com/mikebrennan000/mawk-2")
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/^t//;s/([^-]*-g)/r\1/;s/-/./g')" \
                     "$(git rev-list --count HEAD)" \
                     "$(git rev-parse --short HEAD)"
  printf "_"

  cd "$srcdir/mawk-2"
  printf "${_m2ver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -ie 's|log()|log(1.0)|g' configure
  sed -ie "s|trap  *0|trap 'exit 0' 0|g" test/*

  cd "$srcdir/mawk-2"
  tar xzf mawk-${_m2ver}.tar.gz
}

build() {
  cd "$srcdir/$pkgname"
  ./configure
  make -j2

  cd "$srcdir/mawk-2/mawk-${_m2ver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname"
  make check

  cd "$srcdir/mawk-2/mawk-${_m2ver}"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  make BINDIR=$pkgdir/usr/bin MANDIR=$pkgdir/usr/share/man/man1 install

  cd "$srcdir/mawk-2/mawk-${_m2ver}"
  #mkdir -p $pkgdir/usr/{bin,share/man/man1}
  #make prefix="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1" install
  install -D -m755 mawk $pkgdir/usr/bin/mawk-2
  install -D -m644 man/mawk.1 $pkgdir/usr/share/man/man1/mawk-2.1
  install -D -m644 ../about-mawk.pdf $pkgdir/usr/share/doc/${pkgname%-*}/about-mawk-2.pdf
  install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README-mawk2
  install -D -m644 ChangeLog.beebe $pkgdir/usr/share/doc/${pkgname%-*}/ChangeLog.beebe
}

