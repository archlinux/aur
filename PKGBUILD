# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=codebase-memory-mcp
pkgbase=$_pkgname-bin
pkgname=($_pkgname-bin $_pkgname-ui-bin)
pkgver=0.9.0 # renovate: datasource=github-releases depName=DeusData/codebase-memory-mcp
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
sha512sums_x86_64=('22acb6c92a8c0eaf97af6dc4f5d8d7193270048fc6e5a89c97e610751f6c506468b60547541fb454785189e72f1f746eb246e9bd1b567135acecf6fc715604a8'
                   '61bd7a52c37c55a221a0b79f3e4ef19aa6c94622428be49d68bfb943becfb7968cb49d7140add190d8812dbca3a759ca8a1c856e6fc839bb9e0d3ef381ae9195')
sha512sums_aarch64=('32b9c433242bf1ebcd5d6ca5f0c13a1e9747f5f9c14606e877eea428eee084465b39cb133e28034a46c580992e47bf2ee59bf623005fbec48eae6738cb8b05d0'
                    'ab8e2dd3f6904e4c8c518a59a9d9e7cf666ad86dabb80c107321dfed95df36f0f8d3cea09add82cdda070760a60da8bb0905f5f3ce19ad7dfe29dbbd2ff503e0')
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
