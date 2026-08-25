# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=codebase-memory-mcp
pkgbase=$_pkgname-bin
pkgname=($_pkgname-bin $_pkgname-ui-bin)
pkgver=0.10.8 # renovate: datasource=github-releases depName=DeusData/codebase-memory-mcp
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
sha512sums_x86_64=('ea34155736a55ffa4446aced4f70f8f68a52125b1a5f35f326a3d021b4bb4a8ba4dafcfaa407c43f9bd4c607bc299d1c02fe40757c2040f9a40f1b3f0ec73899'
                   'ea34155736a55ffa4446aced4f70f8f68a52125b1a5f35f326a3d021b4bb4a8ba4dafcfaa407c43f9bd4c607bc299d1c02fe40757c2040f9a40f1b3f0ec73899')
sha512sums_aarch64=('33fbf28df2ce93292a8930f376f90f08a6436b1166ab4382beb6a10be95524c6619f3f759f35764dab3b8c72e88643ba4446ced81ce9252cee85e5b5b1f4e3a0'
                    '33fbf28df2ce93292a8930f376f90f08a6436b1166ab4382beb6a10be95524c6619f3f759f35764dab3b8c72e88643ba4446ced81ce9252cee85e5b5b1f4e3a0')
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
