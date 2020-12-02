# Maintainer: Lennart Eichhorn <lennart@madmanfred.com>

pkgname="awall"
pkgver=1.8.2
pkgrel=1
pkgdesc="Alpine Wall is a iptables based firewall frontend"
arch=('any')
url="https://gitlab.alpinelinux.org/alpine/awall"
license=('GPL2')
depends=('lua53' 'ldns' 'ipset' 'iptables' 'lua53-alt-getopt' 'lua53-cjson' 'lua53-lyaml' 'lua53-posix' 'lua53-pc' 'lua53-stringy' 'xtables-addons')
makedepends=('git')
source=("git+https://gitlab.alpinelinux.org/alpine/awall.git#tag=v$pkgver" 'cjson-fix.patch')
#Alternative : ttps://git.alpinelinux.org/awall/snapshot/awall-1.8.1.tar.gz
md5sums=('SKIP' '06347f7ad16611ef3feecbbd550c5b3e')

prepare() {
    cd "$srcdir/awall"

    # Remove dependency on special cjson feature, which is only supported in the alpinelinux package of lua-cjson
    patch -p1 -i "$srcdir/cjson-fix.patch"
    
    # Set correct lua version in awall-cli
    sed -i "1s/.*/#!\/usr\/bin\/env lua5.3/" awall-cli

    # remove example policies
    rm $srcdir/awall/optional/*
}

package(){
    cd "$srcdir/awall"
    
    # install awall
    make ROOT_DIR="$pkgdir/" LUA_VERSION=5.3 install
    
    # move executable to correct directory
    mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
    
    # touch awall masquerade
    mkdir -p "$pkgdir/etc/ipset.d"
    touch "$pkgdir/etc/ipset.d/awall-masquerade"
    
    # touch awall save
    mkdir -p "$pkgdir/etc/iptables"
    touch "$pkgdir/etc/iptables/awall-save"
}
