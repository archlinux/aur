# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=('jed-git')
_pkgname="${pkgname/-git/}"
pkgver=0.99.20.r172.g726ef21
pkgrel=1
pkgdesc='Powerful editor designed for use by programmers (latest development version)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://www.jedsoft.org/jed/'
source=(
  'git://git.jedsoft.org/git/jed.git'
  "$pkgname.install"
)
install="$pkgname.install"
license=('GPL')
provides=('jed' 'xjed' 'rgrep')
conflicts=('jed' 'xjed' 'rgrep')
options=('lto')
depends=('gpm' 'slang' 'libxft')
makedepends=('git' 'libxext' 'libxt')

prepare() {
  cd "$srcdir/$_pkgname" || exit 1

  sed \
    -e "s|\(^all.*\)|\1 xjed rgrep getmail|" \
    -e "s|..DEST.*doc|$pkgdir/usr/share/doc/$pkgname|g" \
    -i src/Makefile.in
}

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1

  _version=$(
    awk '$2 == "JED_VERSION_STR" {print $3}' src/version.h \
    | sed -e 's/pre//;s/-/.r/;s/"//g'
  )
  _commit=$(git log -n 1 --pretty=format:'g%h')

  printf '%s.%s\n' "$_version" "$_commit"
}

build() {
  cd "$srcdir/$_pkgname" || exit 1

  ./configure --prefix=/usr JED_ROOT=/usr/share/jed

  make
  make xjed
  make getmail
}

package() {
  cd "$srcdir/$_pkgname" || exit 1

  make DESTDIR="${pkgdir}" install

  install -Dm0755 'src/objs/rgrep' "$pkgdir/usr/bin/rgrep"
}

sha256sums=('SKIP' 'SKIP')

# eof
