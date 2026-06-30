# Maintainer: taotieren <admin@taotieren.com>

pkgname=officecli
pkgver=1.0.126
pkgrel=1
pkgdesc="The first and best Office suite designed for AI agents"
arch=($CARCH)
url="https://github.com/iOfficeAI/OfficeCLI"
license=('Apache-2.0')
provides=(${pkgname} ${pkgname}-sdk)
conflicts=(${pkgname} ${pkgname}-sdk)
replaces=()
depends=(
    sh
    glibc
    libgcc
    libstdc++
    python
)
makedepends=(
    git
    dotnet-host
    dotnet-runtime
    dotnet-sdk
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
backup=()
options=('!strip' '!debug' '!lto')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('bef267d049cf28a3ebd87f38d1499fd412bece657c2c1514f9e951cddf9288f6')
noextract=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    ./build.sh
    cd sdk/python
    python -m build --wheel --no-isolation
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
    cp -R examples ${pkgdir}/usr/share/doc/${pkgname}/
    cd sdk/python
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
