# Maintainer: DuckSoft <realducksoft@gmail.com>

pkgname=ipset-china-ipv4-git
pkgver=0.1
pkgrel=2
pkgdesc="ipset for matching China Mainland ipv4 network addresses"
arch=(any)
license=(GPL3)
depends=(ipset)
makedepends=(git zstd)
optdepends=('ipset-loader: load this ipset')
provides=(ipset-china-ipv4)
conflicts=(ipset-china-ipv4)
source=("https://github.com/Hackl0us/GeoIP2-CN/raw/release/CN-ip-cidr.txt")
sha512sums=(SKIP)

prepare() {
    # Strip Empty Lines
    cd $srcdir
    sed -i '/^[[:space:]]*$/d' CN-ip-cidr.txt
}

build() {
    cd $srcdir
    echo create china-ipv4 hash:net family inet maxelem `cat CN-ip-cidr.txt | wc -l` > china-ipv4
    cat CN-ip-cidr.txt | sed 's/^/add china-ipv4 /g' >> china-ipv4
}

package() {
    cd $srcdir
    zstd --ultra -f -22 china-ipv4
    install -Dm644 china-ipv4.zst -t "$pkgdir"/usr/share/ipset/
}
