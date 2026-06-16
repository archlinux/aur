# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=codebase-memory-mcp
pkgbase=$_pkgname-bin
pkgname=($_pkgname-bin $_pkgname-ui-bin)
pkgver=0.8.1 # renovate: datasource=github-releases depName=DeusData/codebase-memory-mcp
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
sha512sums_x86_64=('c88aa4cb082d39e7e9b488f7e1493ddda7d6a5ea128f1455f1a388f25225c8ce71481a435e9400af1426d8e3430ff72d5f444a10b79a7d4d572d3fee78d7c419'
                   'f8ad87760455fe82c49b482f232ec64250d94cdf7c8dd48ba66096111b86f19fe7e58771f4e9f7ad69e31994c152a0f4884aa6f0ce08326fc26a02b67fe9b2d3')
sha512sums_aarch64=('80d2332a693239fc264c2c3519c195603e421b306d82b71fe9519e5570ffedf2e6fe8da5704915560eab4edacfa9f1d2249c7523aad580a726228322dc0f413e'
                    'e77d056adde852a428731d9ae7ab1d137149acc776b32898494d717f239e58307a86520ba6e5f332d2cb321b4915babeae9bca78756e3ff174559f03b589662c')
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
