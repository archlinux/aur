# Maintainer: aksr <aksr at t-com dot me>
pkgname=troff-git
pkgver=0.r72.dc0f798
pkgrel=2
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
conflicts=('groff' 'grap')
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
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's/\/root\/troff\/home/\/usr\/share\/troff/ ' conf.mk
}

build() {
  cd "$srcdir/$pkgname"
  for i in troff tr2ps eqn tbl pic grap refer; do cd $i; make; cd ..; done
  cd "$srcdir/$pkgname/mkdev"
  ./mkdev.sh
}

package() {
  mkdir -p $pkgdir/usr/share/{doc/$pkgname,licenses/$pkgname,troff}
  cd "$srcdir/$pkgname"
  install -Dm755 eqn/eqn $pkgdir/usr/bin/eqn
  install -Dm755 grap/grap $pkgdir/usr/bin/grap
  install -Dm755 pic/pic $pkgdir/usr/bin/pic
  install -Dm755 refer/refer $pkgdir/usr/bin/refer
  install -Dm755 tbl/tbl $pkgdir/usr/bin/tbl
  install -Dm755 troff/troff $pkgdir/usr/bin/troff
  install -Dm755 tr2ps/tr2ps $pkgdir/usr/bin/tr2ps
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 NOTICE $pkgdir/usr/share/licenses/$pkgname/NOTICE
  cd "$srcdir/$pkgname/home"
  cp -a font hyphen ps term tmac $pkgdir/usr/share/troff
}

