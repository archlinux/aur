# Maintainer: Aaron Esau <moome@arinerron.com>
pkgname="moome-git"
pkgver="1.0"
pkgrel="1"
license=("GPL")
arch=("i686" "x86_64")
md5sums=("SKIP")
url="https://github.com/BlackberryCode/moome"
pkgdesc="a server for the Moome client"
source=("${pkgname}-${pkgver}::git+https://github.com/BlackberryCode/moome.git#branch=master")
makedepends=("jdk-openjdk" "java-environment-common" "zip" "git")
depends=("java-runtime-common")

pkgver() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    printf "%s" "${pkgver}"
    #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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

build() {
    # build

    #cd "${srcdir}/${pkgname}-${pkgver}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./compile.sh
}

package() {
    # ensure target directories exist
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/moome/lib"
    mkdir -p "$pkgdir/usr/share/moome/data"
    mkdir -p "$pkgdir/usr/share/moome/data/maps"
    
    # copy files over and change perms
    install "${srcdir}/${pkgname}-${pkgver}/lib/_run.sh" "${pkgdir}/usr/bin/moome" --mode=755 --owner="root" --group="root"
    rinstall "${srcdir}/${pkgname}-${pkgver}/lib" "${pkgdir}/usr/share/moome/lib" --mode=755 --owner="root" --group="root"
    rinstall "${srcdir}/${pkgname}-${pkgver}/data" "${pkgdir}/usr/share/moome/data" --mode=755 --owner="root" --group="root"

    cd "${pkgdir}/usr/share/moome/data/maps/"
    zip -jr map.zip map/map.txt map/map1.txt map/properties.txt
}
