# Maintainer: Aaron Esau <aur@aaronesau.com>
pkgname="onionr-git"
pkgver="0.1"
pkgrel="1"
conflicts=("onionr2")
license=("GPL")
arch=("i686" "x86_64")
md5sums=("SKIP")
url="https://onionr.net/"
pkgdesc="anonymous P2P communication platform"
source=("${pkgname}-${pkgver}::git+https://gitlab.com/beardog/onionr.git#branch=master")
makedepends=("python" "python-setuptools" "python-pip")
depends=("git" "curl" "tor")

rinstall() {
    if [ -f "$1" ]; then
        install -D "$1" "$2/" "$3" "$4"
        return 0
    fi

    for file in $(find "$1" -type f -printf '%P\n'); do
        install -D "$1/$file" "$2/$file" "$3" "$4"
    done

    return 0
}

prepare() {
    # pre_build

    cd "${srcdir}/${pkgname}-${pkgver}"
    
}

build() {
    # build

    cd "${srcdir}/${pkgname}-${pkgver}"
    sh install/build.sh
}

check() {
    # post_build

    cd "${srcdir}/${pkgname}-${pkgver}"
    
}

package() {
    # "movements"
    # ensure target directories exist
    mkdir -p "$pkgdir//usr/bin/"
    mkdir -p "$pkgdir//etc/systemd/system/"
    mkdir -p "$pkgdir//usr/share/onionr"
    
    # copy files over and change perms
    rinstall "${srcdir}/${pkgname}-${pkgver}/install/onionr" "${pkgdir}//usr/bin/" --mode=755 --owner="root" --group="root"
    rinstall "${srcdir}/${pkgname}-${pkgver}/install/onionr.service" "${pkgdir}//etc/systemd/system/" --mode=644 --owner="root" --group="root"
    rinstall "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}//usr/share/onionr" --mode=755 --owner="root" --group="root"
}
