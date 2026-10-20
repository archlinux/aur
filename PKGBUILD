# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=codebase-memory-mcp
pkgbase=$_pkgname-bin
pkgname=($_pkgname-bin $_pkgname-ui-bin)
pkgver=0.12.1 # renovate: datasource=github-releases depName=DeusData/codebase-memory-mcp
pkgrel=1
pkgdesc="High-performance code intelligence MCP server with persistent knowledge graph"
url="https://github.com/DeusData/$_pkgname"
license=('MIT')
arch=('x86_64' 'aarch64')
source_x86_64=(
    "$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/$_pkgname-linux-amd64.tar.gz"
    "$_pkgname-$pkgver-ui-x86_64.tar.gz::$url/releases/download/v${pkgver}/$_pkgname-ui-linux-amd64.tar.gz"
)
source_aarch64=(
    "$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/$_pkgname-linux-arm64.tar.gz"
    "$_pkgname-$pkgver-ui-aarch64.tar.gz::$url/releases/download/v${pkgver}/$_pkgname-ui-linux-arm64.tar.gz"
)
sha512sums_x86_64=('54c9c05929c033e7e2635073397fe7167947399ab228fa3cfe4ca8acbd6b85d21e3ce383ebd34b65c0a46b7a5561fd01ca637e6d6dae85dad29b18de1990ab5b'
                   '54c9c05929c033e7e2635073397fe7167947399ab228fa3cfe4ca8acbd6b85d21e3ce383ebd34b65c0a46b7a5561fd01ca637e6d6dae85dad29b18de1990ab5b')
sha512sums_aarch64=('823a481b1b616413ac7db6a898fda1246ea967b51e331f88f8eb529f0dba1cec30caff546f393b2ece3080afa6a042d85173122e7053b8698554963f825de76a'
                    '823a481b1b616413ac7db6a898fda1246ea967b51e331f88f8eb529f0dba1cec30caff546f393b2ece3080afa6a042d85173122e7053b8698554963f825de76a')
noextract=(
    "$_pkgname-$pkgver-ui-x86_64.tar.gz"
    "$_pkgname-$pkgver-ui-aarch64.tar.gz"
)

prepare() {
    mkdir -p ui
    tar -xf "$_pkgname-$pkgver-ui-$CARCH.tar.gz" -C ui
}

declare -A _pkgdescs _srcdirs
_pkgdescs=(
    [$_pkgname-bin]="$pkgdesc"
    [$_pkgname-ui-bin]="$pkgdesc (with UI)"
)
_srcdirs=(
    [$_pkgname-bin]=""
    [$_pkgname-ui-bin]="ui/"
)

for _pkg in "${pkgname[@]}"; do
    read -r -d '' pkgfun <<EOF
function package_${_pkg}() {
    pkgdesc="${_pkgdescs[$_pkg]}"
    provides=($_pkgname)
    conflicts=($_pkgname $_pkgname-git)

    install -D -m 0755 "\$srcdir/${_srcdirs[$_pkg]}$_pkgname" "\$pkgdir/usr/bin/$_pkgname"
}
EOF
    eval "$pkgfun"
done
