# Maintainer: akac <akac@tuta.io>

pkgname=sbctl-artix
pkgver=0.14
pkgrel=1
pkgdesc="Secure Boot key manager"
arch=("x86_64" "aarch64")
url="https://github.com/Foxboron/sbctl"
license=("MIT")
depends=("binutils" "util-linux")
makedepends=("go" "git" "asciidoc")
source=("https://github.com/Foxboron/sbctl/releases/download/${pkgver}/sbctl-${pkgver}.tar.gz"{,.sig})
validpgpkeys=("C100346676634E80C940FB9E9C02FF419FECBE16")
sha256sums=('88ccdf3a87151c1b639be4e43999f4984f238eebffebe1d17d9f30e7039bf6e8'
            'SKIP')

build(){
    cd "${pkgname}-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    make
}

package(){
    cd "${pkgname}-${pkgver}"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 ./contrib/pacman/ZZ-sbctl.hook "${pkgdir}/usr/share/libalpm/hooks/zz-sbctl.hook"
    install -Dm755 ./contrib/mkinitcpio/sbctl "${pkgdir}/usr/lib/initcpio/post/sbctl"
}
