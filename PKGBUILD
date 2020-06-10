# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=lilv
pkgname=lib32-lilv
pkgver=0.24.8
pkgrel=1
pkgdesc="A C library interface to the LV2 plug-in standard (32-bit)"
arch=('x86_64')
url="https://drobilla.net/software/lilv/"
license=('custom:ISC')
depends=('lib32-sratom' 'lilv')
makedepends=('lib32-libsndfile' 'lib32-lv2' 'waf')
source=("https://download.drobilla.net/$_basename-$pkgver.tar.bz2"{,.sig})
sha512sums=('f2b2638372a8280041f6e88e2077f2109f89dad6feedb9d07a88c6b5a05c37b62112f5d03282da4335ddd0d14339cfb49ad96a3df3de310265a40c24718be192'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3')

prepare() {
    cd "$_basename-$pkgver"

    # let wscript(s) find the custom waf scripts
    mkdir -pv tools
    touch __init__.py
    cp -v waflib/extras/{autoship,autowaf,lv2}.py tools/
    mkdir -pv plugins/tools/
    cp -v waflib/extras/{autoship,autowaf,lv2}.py plugins/tools/
    rm -rv waflib
    sed -e 's/waflib.extras/tools/g' \
        -e "s/load('autowaf'/load('autowaf', tooldir='tools'/g" \
        -e "s/load('lv2'/load('lv2', tooldir='tools'/g" \
        -i wscript
}

build() {
    cd "$_basename-$pkgver"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    waf configure --prefix=/usr \
                  --libdir=/usr/lib32 \
                  --no-bash-completion \
                  --no-bindings \
                  --dyn-manifest \
                  --test

    waf -v build
}

check() {
    cd "$_basename-$pkgver"

    waf test
}

package() {
    cd "$_basename-$pkgver"

    waf install --destdir="$pkgdir"

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"

    cd "$pkgdir"/usr

    rm -r bin include share/man
}
