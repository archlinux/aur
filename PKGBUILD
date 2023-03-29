# Maintainer: Einar Lielmanis <einar@spicausis.lv>

pkgname=sylpheed-iconmod-git
_gitname=sylpheed
pkgver=3.8.c47d366a
pkgrel=1
pkgdesc="Lightweight e-mail client. Latest official beta with the coonsden.com icon theme."
arch=('i686' 'x86_64')
url="http://sylpheed.sraoss.jp/en/"
license=('GPL')
depends=('gpgme' 'gtk2' 'compface' 'gtkspell')
makedepends=('git' 'automake-1.15')
options=('libtool')
conflicts=('sylpheed' 'sylpheed-beta' 'sylpheed-beta-iconmod')
provides=('sylpheed')
source=('sylpheed::git+https://github.com/sylpheed-mail/sylpheed.git'
        Sylpheed3.0_icon-set.tar.gz)
md5sums=( 'SKIP' 'SKIP')

pkgver()
{
    cd "$_gitname"
    echo 3.8.$(git rev-parse --short HEAD)
}

prepare()
{
  cd "$_gitname"

  cp -t . -r "$srcdir/Sylpheed3.0_icon-set/src"

  # fix enchant maintainers moving things around for fun
  sed -i 's:enchant/enchant.h:enchant-2/enchant.h:g' src/compose.c
  sed -i 's:PKG_CONFIG --libs enchant:PKG_CONFIG --libs enchant-2:g' configure.ac
}

build()
{
  cd "$_gitname"

  ./autogen.sh --prefix=/usr --enable-ldap --enable-gpgme
  make
}

package()
{
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}

