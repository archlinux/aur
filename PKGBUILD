# Maintainer: zocker_160 <zocker1600 at posteo dot net>
# Contributor: Brian Schubert <bewschubert@gmail.com>

pkgname=ifm-git
_gitname=ifm
pkgver=r1090.1f6eb78
pkgrel=1
pkgdesc="A language and a program for keeping track of your progress through an Interactive Fiction game."
arch=('x86_64')
url="https://ifm.readthedocs.io/en/latest/intro.html"
license=('GPL2')
depends=('tk' 'perl')
makedepends=('tk' 'help2man')
conflicts=('ifm')
source=('git://github.com/zocker-160/ifm.git')
sha256sums=('SKIP')
options=('docs')

pkgver() {
  cd $srcdir/$_gitname/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_gitname/

    chmod +x ./autogen.sh
    ./autogen.sh

    export CPPFLAGS=-D_GNU_SOURCE
    ./configure --prefix=/usr --mandir=/usr/share/man
    make || true # I need to run make twice, because for some stupid reason it fails on the first run
    make
}

package() {
    cd $srcdir/$_gitname/
    make DESTDIR=$pkgdir docdir=$pkgdir/usr/share/doc install
}
