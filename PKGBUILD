# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=codebase-memory-mcp
pkgbase=$_pkgname-bin
pkgname=($_pkgname-bin $_pkgname-ui-bin)
pkgver=0.11.0 # renovate: datasource=github-releases depName=DeusData/codebase-memory-mcp
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
sha512sums_x86_64=('de5def44f1455ec864e7186b136ed4c4e8c9b465c16a509b7e5bdb1c5ee2d5eee4eb1dea16ac503d58e004d4e86229004f29be08e247f2c213ae244627ead48f'
                   'de5def44f1455ec864e7186b136ed4c4e8c9b465c16a509b7e5bdb1c5ee2d5eee4eb1dea16ac503d58e004d4e86229004f29be08e247f2c213ae244627ead48f')
sha512sums_aarch64=('8c7d688a92975223e9e507340c96152ae9e657472ef132a02c071a81ce6694c455001d6a93564e1bab3abd5efd1086b2b6220abedfffc61950731739b62a3d8a'
                    '8c7d688a92975223e9e507340c96152ae9e657472ef132a02c071a81ce6694c455001d6a93564e1bab3abd5efd1086b2b6220abedfffc61950731739b62a3d8a')
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
