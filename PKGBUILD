# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

pkgname=reclass.net-git
_pkgname=ReClass.NET
pkgver=1.2.r245.g2e48bce
pkgrel=1
pkgdesc="A reverse-engineering tool for dissecting data structures in memory"
arch=('x86_64')
license=('MIT')
url="https://github.com/ReClassNET/ReClass.NET"
provides=('reclass.net')
depends=('mono-msbuild')
makedepends=('git' 'lib32-gcc-libs' 'lib32-glibc')
source=("git+https://github.com/ReClassNET/ReClass.NET.git"
        "linux-native-plugin-path.patch"
        "linux-windows-sections.patch")
sha256sums=('SKIP'
            '78d3136c874a2c43042cf4685aa8520a25145c09e7118d3c1724df5a10caf613'
            '66d87fec0d6f330ba518cd7d97abaeeb6fb2c2f3232fb7229d13264a54aeaa15')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${_pkgname}

    local src
    for src in ${source[@]}; do
        src=${src%%::*}
        src=${src##*/}
        [[ ${src} = *.patch ]] || continue
        echo "applying patch ${src}..."
        patch -Np1 < ../${src}
    done
}

build() {
    cd ${_pkgname}
    make release
}

package() {
    cd ${_pkgname}

    mkdir -p ${pkgdir}/usr/lib/${_pkgname}/Plugins

    install -Dm755 ${_pkgname}/bin/Release/x64/${_pkgname}.exe ${pkgdir}/usr/bin/${_pkgname}
    install -Dm755 NativeCore/Unix/build/release/x64/NativeCore.so -t ${pkgdir}/usr/lib
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${_pkgname}
}
