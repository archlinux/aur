# Maintainer:  me <me@me.me>
pkgname=toxcrawler-git
pkgver=r37.fecab84
pkgrel=1
epoch=
pkgdesc="An Tox DHT network crawler and static tox library"
arch=('i686' 'x86_64')
url="https://github.com/envsh/toxcrawler"
license=('GPL')
groups=()
depends=('libvpx' 'libsodium' 'geoip')
makedepends=('git' 'go')
checkdepends=()
optdepends=()
provides=()
conflicts=('toxcrawler')
replaces=()
backup=()
options=()
install=
changelog=
source=("toxcore-git::git+https://github.com/JFreegman/toxcore.git#branch=DHT-addon"
        "toxcrawler-git::git+https://github.com/envsh/toxcrawler#branch=master"
       "mkldflags.patch")
md5sums=('SKIP'
         'SKIP'
         '87a2f10ca7d995098a72865794cee0eb')
noextract=()

pkgver()
{
     cd toxcrawler-git
     ( set -o pipefail
       git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
       printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
     )
}

prepare() {
  cd "$srcdir/toxcore-git"
}

build() {
    cd "$srcdir/toxcore-git"

    if [ ! -f configure ];then
        ./autogen.sh
    fi
    ./configure --prefix=/opt/toxcrawler --enable-static --disable-shared --disable-tests --disable-testing
    make -j3

    cd "$srcdir/toxcrawler-git/"
    patch -p1 -i "$srcdir/mkldflags.patch"

    cd "$srcdir/toxcrawler-git/crawler"
    make
    make -f Makefile-go
}

check() {
  cd "$srcdir/toxcore-git"

}

package() {
  cd "$srcdir/toxcore-git"
  make DESTDIR="$pkgdir/" install
  install -m755 "$srcdir/toxcrawler-git/crawler/crawler" "$pkgdir/opt/toxcrawler/bin/crawler"
  install -m755 "$srcdir/toxcrawler-git/crawler/src/gotoxcwl" "$pkgdir/opt/toxcrawler/bin/toxcwl"
}


# vim:set ts=2 sw=2 et:
