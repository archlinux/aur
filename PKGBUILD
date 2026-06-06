# Maintainer: taotieren <admin@taotieren.com>

pkgname=officecli
pkgver=1.0.104
pkgrel=1
pkgdesc="The first and best Office suite designed for AI agents"
arch=($CARCH)
url="https://github.com/iOfficeAI/OfficeCLI"
license=('Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    libgcc
    libstdc++
)
makedepends=(
    git
    dotnet-host
    dotnet-runtime
    dotnet-sdk
)
optdepends=()
backup=()
options=('!strip' '!debug' '!lto')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('9b41307a6bc8fe3e1e21c21855f420e358d9aed7ecdc6b8f8fd7ea49c1a6a3bf')
noextract=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    ./build.sh
}

package() {
    cd "${srcdir}/${pkgname}/"
    local found_binary=$(find bin/release/ -maxdepth 1 -type f -executable ! -name "*.pdb" -printf "%f\n" | head -1)
    if [ -n "$found_binary" ]; then
        install -vDm755 "bin/release/$found_binary" "${pkgdir}/usr/bin/officecli"
    else
        echo "ERROR: No executable binary found for architecture: $CARCH"
        return 1
    fi
    install -vDm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
    install -vDm644 *.md -t ${pkgdir}/usr/share/doc/${pkgname}/
    cp -R docs ${pkgdir}/usr/share/doc/${pkgname}/
}
