# Maintainer: taotieren <admin@taotieren.com>

pkgname=ts.net-git
pkgver=r652.c181cd8
pkgrel=5
epoch=
pkgdesc="Thunderscope-compatible PC-host software written in C# using high-performing primitives & SIMD."
arch=(x86_64)
url="https://github.com/EEVengers/TS.NET"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    sh
    glibc
    libgcc
    libstdc++
    # AUR
    scopehal-apps
    libtslitex
    ts-litex-driver
)
makedepends=(
    curl
    git
    dotnet-host
    dotnet-runtime
    dotnet-sdk
)
optdepends=(
    # "scopehal-apps: ngscopeclient and other client applications for libscopehal"
)
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
    ./TS.NET.Engine.cs
}

package() {
    cd ${srcdir}/${pkgname}/build/TS.NET.Engine/linux-x64
    install -vDm755 TS.NET.Engine -t ${pkgdir}/usr/share/${pkgname}/
    install -vDm644 thunderscope* -t ${pkgdir}/usr/share/${pkgname}/
    ln -sf /usr/lib/libtslitex.so ${pkgdir}/usr/share/${pkgname}/libtslitex.so
    install -vDm755 /dev/stdin ${pkgdir}/usr/bin/ts-net <<EOF
#!/usr/bin/env bash
cd /usr/share/${pkgname}/
./TS.NET.Engine "\$@"
EOF
    cd "${srcdir}/${pkgname}/"
    install -vDm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -vDm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
    install -vDm644 docs/*.md -t ${pkgdir}/usr/share/doc/${pkgname}/docs/
    install -vDm644 docs/*.drawio -t ${pkgdir}/usr/share/doc/${pkgname}/docs/
    install -vDm644 docs/simulations/*.asc -t ${pkgdir}/usr/share/doc/${pkgname}/docs/simulations/
}
