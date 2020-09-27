# Maintainer: Dct Mei <dctxmei@gmail.com>

pkgbase=vmessping
pkgname=('vmessconv' 'vmessping' 'vmessspeed')
pkgver=0.3.4
pkgrel=1
pkgdesc="A ping prober for vmess:// links in common seen formats"
arch=('x86_64')
url="https://github.com/v2fly/vmessping"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "vmessping-0.3.4.patch")
sha256sums=('1f3f1759039f83e32d3b8a824b9f7518e22ee07e515069a35d1dc22f36cd5f64'
            '68b77256c1ec20f1628667719afbd2653b3005001ae94e4754e3cba38b7bbd00')

prepare() {
    cd "$srcdir"/"$pkgbase-$pkgver"/
    patch -p1 -i ../vmessping-0.3.4.patch
}

build() {
    export GOFLAGS="-buildmode=pie -trimpath"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    for VMESSPING in vmessconv vmessping vmessspeed; do
        cd "$srcdir"/"$pkgbase-$pkgver"/
        cd cmd/"${VMESSPING}"/
        go build -ldflags="-X=main.MAINVER=${pkgver} -linkmode=external"
    done
}

package_vmessconv() {
    cd "$srcdir"/"$pkgbase-$pkgver"/
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/vmessconv/
    cd cmd/vmessconv/
    install -Dm 755 vmessconv -t "${pkgdir}"/usr/bin/
}

package_vmessping() {
    cd "$srcdir"/"$pkgbase-$pkgver"/
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/vmessping/
    cd cmd/vmessping/
    install -Dm 755 vmessping -t "${pkgdir}"/usr/bin/
}

package_vmessspeed() {
    cd "$srcdir"/"$pkgbase-$pkgver"/
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/vmessspeed/
    cd cmd/vmessspeed/
    install -Dm 755 vmessspeed -t "${pkgdir}"/usr/bin/
}
