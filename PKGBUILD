# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=codebase-memory-mcp
pkgbase=$_pkgname-bin
pkgname=($_pkgname-bin $_pkgname-ui-bin)
pkgver=0.6.1 # renovate: datasource=github-releases depName=DeusData/codebase-memory-mcp
pkgrel=1
pkgdesc="High-performance code intelligence MCP server with persistent knowledge graph"
url="https://github.com/DeusData/$_pkgname"
license=('MIT')
arch=('x86_64' 'aarch64')
source_x86_64=(
    "$_pkgname-x86_64.tar.gz::$url/releases/download/v${pkgver}/$_pkgname-linux-amd64.tar.gz"
    "$_pkgname-ui-x86_64.tar.gz::$url/releases/download/v${pkgver}/$_pkgname-ui-linux-amd64.tar.gz"
)
source_aarch64=(
    "$_pkgname-aarch64.tar.gz::$url/releases/download/v${pkgver}/$_pkgname-linux-arm64.tar.gz"
    "$_pkgname-ui-aarch64.tar.gz::$url/releases/download/v${pkgver}/$_pkgname-ui-linux-arm64.tar.gz"
)
sha512sums_x86_64=('67cfc269ae2332e2ed30a6084fe1bdc4c8da3ae23ddf91a927049f9945b61b713dabde06a3895afd8b279f75894600231c83a291de2f5adca2971280e3ad4bcf'
                   '99b8660732a27b25537a05d27ec5f6b1611a975410fdce6e9819ced3494af9c856cf2e88c2e6c8897ba9bb58edd7f9568edd5471f238cbb8b8e7705206598cde')
sha512sums_aarch64=('25f1c6bcff895123819d81fd3d3cc8cd0bc8feeeba7909a247d3af651036e4ff24871f3798074886f39b76c890066cd797a155b4149f2d19a662615e9b82423c'
                    '4f1c0d483aaa4dcd51f071a11d04077a5054b6f73a260a805630f26a0ddd816d788610d3aebd0f2a351109ed41c30e1eedf7e0220314b0ea9bf1bb071b7fec13')
noextract=(
    "$_pkgname-ui-x86_64.tar.gz"
    "$_pkgname-ui-aarch64.tar.gz"
)

prepare() {
    mkdir -p ui
    tar -xf "$_pkgname-ui-$CARCH.tar.gz" -C ui
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
