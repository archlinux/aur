# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xiaomi-hyperos-bootloader-bypass-git
pkgname=xiaomi-hyperos-bootloader-bypass-git
pkgver=1.0.fix.r6.gb932fa7
pkgrel=1
pkgdesc="A PoC that exploits a vulnerability to bypass the Xiaomi HyperOS community restrictions of BootLoader unlocked account bindings."
arch=(any)
url="https://github.com/MlgmXyysd/Xiaomi-HyperOS-BootLoader-Bypass"
license=('unkown')
provides=(${pkgname%-git} php-adb)
conflicts=(${pkgname%-git} php-adb)
replaces=()
depends=(
    android-tools
    curl
    php
    openssl)
makedepends=(git)
backup=()
options=()
install=${pkgname}.install
source=("${pkgbase}::git+${url}.git"
    "php-adb::git+https://github.com/MlgmXyysd/php-adb.git"
    "${pkgname}.install")
sha256sums=('SKIP'
            'SKIP'
            '34b832d219c551fd01c6980eed6e0ca9b981ed07c52b920df712171eba27b359')

pkgver() {
    cd "${srcdir}/${pkgbase}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgbase}" clean -dfx
    git -C "${srcdir}/php-adb" clean -dfx
}

package() {
    install -D ${pkgbase}/bypass.php -t "$pkgdir/usr/share/${pkgname}/"
    install -D php-adb/src/adb.php -t "$pkgdir/usr/share/${pkgname}/"
#     install -d "$pkgdir/usr/share/${pkgname}/libraries"
#     ln -sf /usr/bin/adb "$pkgdir/usr/share/${pkgname}/libraries/adb"
    cp -rv ${pkgbase}/docs "$pkgdir/usr/share/${pkgname}/"
    install -Dm0755 /dev/stdin "$pkgdir/usr/bin/${pkgname%-git}" <<EOF
#!/usr/bin/env bash
cd /usr/share/${pkgname}/

php bypass.php
EOF
}

