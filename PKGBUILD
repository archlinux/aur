# Maintainer: aksr <aksr at t-com dot me>
pkgname=troff-git
pkgver=r78.593565b
pkgrel=1
epoch=
pkgdesc="A port of Plan9 troff tools to Linux, contains troff, tr2ps (dpost), eqn, tbl, pic, and grap."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/troff.git"
license=('Lucent Public License' 'custom')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('troff')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git://repo.or.cz/troff.git")
noextract=()
md5sums=('SKIP')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prefix="/usr"
libdir="$prefix/lib/troff"
docdir="/share/doc"
## uncomment bellow to avoid conflict with groff and grap package by installing to, e.g. /opt directory
#prefix="/opt/$pkgname"
#libdir="$prefix/lib"
#docdir="/doc"

licensedir="/usr/share/licenses/$pkgname/"

if [ "$prefix" == "/usr" ]; then
  conflicts=('groff' 'grap')
fi

prepare() {
  cd "$srcdir/$pkgname"
  sed -i "s|/root/troff/home|$libdir|" conf.mk
}

build() {
  cd "$srcdir/$pkgname"
  for i in troff tr2ps eqn tbl pic grap refer; do cd $i; make; cd ..; done
  cd "$srcdir/$pkgname/mkdev"
  ./mkdev.sh
}

package() {
  cd "$srcdir/$pkgname"
  prefix=$pkgdir/$prefix
  install -Dm755 eqn/eqn $prefix/bin/eqn
  install -Dm755 grap/grap $prefix/bin/grap
  install -Dm755 pic/pic $prefix/bin/pic
  install -Dm755 refer/refer $prefix/bin/refer
  install -Dm755 tbl/tbl $prefix/bin/tbl
  install -Dm755 troff/troff $prefix/bin/troff
  install -Dm755 tr2ps/tr2ps $prefix/bin/tr2ps
  install -Dm644 README $prefix/$docdir/README
  install -Dm644 NOTICE $pkgdir/$licensedir/NOTICE

  libdir=$pkgdir/$libdir
  mkdir -p $libdir
  cd "$srcdir/$pkgname/home"
  cp -a font hyphen ps term tmac $libdir/
}

