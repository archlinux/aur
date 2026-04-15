# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=codebase-memory-mcp
pkgbase=$_pkgname-bin
pkgname=($_pkgname-bin $_pkgname-ui-bin)
pkgver=0.6.0 # renovate: datasource=github-releases depName=DeusData/codebase-memory-mcp
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
sha512sums_x86_64=('222407a2784a493493668ec884eb55cc3dd2989afdccc82bf376aa76f185ebfc444458d72a58d434f85dbcd6db66f216b3128e538017a8afb730ec8f1500c08b'
                   'c2f14e2bbc0359b25f21618e6eb0255a8375c2913e08552caff6ffc5e1fb8e078bb509ac80e5c48d281116c54f1f5b49c843354c639edf9569d28215563d17bf')
sha512sums_aarch64=('e6db8b19eb4bc3cb263260c58da3d88c4a9f922b1b3623de024668b746e46439cec53ae8d633c52bdb0f764f19f0f0a44c56c09cd194ba3ab93eeb0c1efdcfc0'
                    '814826fa78c058ffe51c51e680706aad13a74d021239c12758648fb274f715df5d3195bac0f2e43ae44422829a604060bd3f56eac0ef147a43a5c9966c082efc')
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
