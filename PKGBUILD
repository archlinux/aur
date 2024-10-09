# Maintainer: taotieren <admin@taotieren.com>

pkgname=ts.net-git
pkgver=r213.ea6fa52
pkgrel=1
epoch=
pkgdesc="Thunderscope-compatible PC-host software written in C# using high-performing primitives & SIMD."
arch=("x86_64" "aarch64")
url="https://github.com/EEVengers/TS.NET"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(bash
    gcc-libs
    glibc
    zlib)
makedepends=(
    curl
    git
    dotnet-host
    dotnet-sdk)
optdepends=('scopehal-apps: glscopeclient and other client applications for libscopehal')
backup=()
options=('!strip' '!debug' '!lto')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
noextract=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/build-scripts"
    bash ./"TS.NET.Engine (linux-x64).bash"
}

package() {
    install -dm755 ${pkgdir}/usr/share/${pkgname%-git} \
        ${pkgdir}/usr/bin
    cd "${srcdir}/${pkgname}/build-scripts"
    version=$(cat ../source/TS.NET.Engine/TS.NET.Engine.csproj | grep -oPm1 "(?<=<Version>)[^<]+")
    cp -rv ${srcdir}/${pkgname}/builds/linux-x64/TS.NET.Engine/${version}/* ${pkgdir}/usr/share/${pkgname%-git}/
    install -Dm755 /dev/stdin ${pkgdir}/usr/bin/${pkgname%-git} <<EOF
#!/bin/env bash

cd /usr/share/${pkgname%-git}
./TS.NET.Engine
EOF

}
