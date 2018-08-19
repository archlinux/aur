# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=lilv
pkgname=lib32-lilv
pkgver=0.24.4
pkgrel=1
pkgdesc="A C library interface to the LV2 plug-in standard (32-bit)"
arch=('x86_64')
url="https://drobilla.net/software/lilv/"
license=('custom:ISC')
depends=('lib32-sratom' 'lilv')
makedepends=('lib32-libsndfile' 'lv2' 'python')
source=("https://download.drobilla.net/$_basename-$pkgver.tar.bz2"{,.sig})
sha512sums=('cb909c83dbac36b51a206fe508aec51e52ddf068f9a159d053888594402def8d140aae0d9e1e1866e722396f7ec8dea4b86d4c1b958f56eb3193b78307918a89'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3')

prepare() {
    cd "$_basename-$pkgver"

    # don't run local ldconfig
    sed -i "/ldconfig/d" wscript
}

build() {
    cd "$_basename-$pkgver"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    python waf configure --prefix=/usr \
                         --libdir=/usr/lib32 \
                         --no-bash-completion \
                         --dyn-manifest \
                         --test

    python waf build
}

check() {
    cd "$_basename-$pkgver"

    python waf test
}

package() {
    cd "$_basename-$pkgver"

    python waf install --destdir="$pkgdir"

    install -vDm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$pkgdir"/usr

    rm -r bin include share/man
}
