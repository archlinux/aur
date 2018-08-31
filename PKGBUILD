# Maintainer: Tucker Boniface <tucker@boniface.tech>
# Submitter: Alex Chamberlain <alex@alexchamberlain.co.uk>
# Maintainer: Kars Wang <jaklsy@gmail.com>

pkgname=jq-git
_gitname='jq'
pkgver=1.6rc2.2.g341a5fc
pkgrel=2
pkgdesc='Command-line JSON processor'
arch=('i686' 'x86_64')
url='http://stedolan.github.io/jq/'
license=('custom')
depends=('oniguruma')
makedepends=('python2' 'git' 'autoconf' 'automake' 'bison' 'flex' 'glibc')
provides=('jq')
conflicts=('jq')
source=('git+https://github.com/stedolan/jq.git'
        '0001-Bugfix-Math-function-checking.patch::https://github.com/stedolan/jq/pull/1702.patch')
sha512sums=('SKIP'
            '4f092cfc4a3fb8ba25d322fe5dbdf165e1309cc3cc2789b1f337e1c5bd70e7ba7ae372ffa71a11775d4b6551faa6e172db5bd3bc9cf38eeeb4625c667d659b0c')

pkgver() {
    cd "$_gitname"
    git describe --tag | sed -e 's/^jq-//' -e 's/-/./g'
}

prepare() {
    cd "$_gitname"
    patch -p1 < "$srcdir"/0001-Bugfix-Math-function-checking.patch
}

build() {
    cd "$_gitname"

    autoreconf -i
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/jq"
}
