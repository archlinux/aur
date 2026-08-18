# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=codebase-memory-mcp
pkgbase=$_pkgname-bin
pkgname=($_pkgname-bin $_pkgname-ui-bin)
pkgver=0.10.6 # renovate: datasource=github-releases depName=DeusData/codebase-memory-mcp
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
sha512sums_x86_64=('3b25dbb15562f1f5fd56b7715ee61797cdec2d962a8443d2e6ceb607401b2974efa4c9d6371be5f00113f94d655c5b9a1628b6f51240ab171667c5d44268f54d'
                   '3b25dbb15562f1f5fd56b7715ee61797cdec2d962a8443d2e6ceb607401b2974efa4c9d6371be5f00113f94d655c5b9a1628b6f51240ab171667c5d44268f54d')
sha512sums_aarch64=('9b4acf181e61874841e1750ba0cca0ee128d2a2008855cc7592495a553efa9601810c8335b045525bd8994e16c0fdc7daafb69ece650f287ff87177787a63684'
                    '9b4acf181e61874841e1750ba0cca0ee128d2a2008855cc7592495a553efa9601810c8335b045525bd8994e16c0fdc7daafb69ece650f287ff87177787a63684')
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
