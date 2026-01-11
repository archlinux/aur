# Maintainer: Your Name <your.email@domain.com>
pkgname=memprocfs
providers=(memprocfs)

makedepends=('curl' 'jq')

# 自动获取最新版本号、pkgrel 和日期
_get_release_info() {
    curl -s "https://api.github.com/repos/ufrisk/MemProcFS/releases/latest"
}

# 获取一次 Release 信息并缓存
_release_info="$(_get_release_info)"

# 占位符默认值（空值，由自动提取脚本填充）
pkgver=0
pkgrel=0
pkgdate=0

# 尝试从 Release 信息中提取，如果失败则使用占位符
_try_extract_values() {
    local ver=$(echo "$_release_info" | jq -r '.tag_name' 2>/dev/null | sed 's/^v//' | grep -E '^[0-9]')
    if [ -n "$ver" ]; then
        pkgver="$ver"
    fi

    # 获取 x86_64 Linux 包信息
    local x64_asset=$(echo "$_release_info" | jq -r '.assets[] | select(.name | contains("linux_x64")) | .name' 2>/dev/null | head -1)
    if [ -n "$x64_asset" ]; then
        local rel=$(echo "$x64_asset" | grep -oP 'v\d+\.\d+\.\K\d+' | head -1)
        local date=$(echo "$x64_asset" | grep -oP '\d{8}' | head -1)
        if [ -n "$rel" ] && [ -n "$date" ]; then
            pkgrel="$rel.$date"
            pkgdate="$date"
        fi
    fi
}

_try_extract_values

pkgdesc="MemProcFS is an easy and convenient way of viewing physical memory as files in a virtual file system."
arch=('x86_64' 'aarch64')
url="https://github.com/ufrisk/MemProcFS"
license=('GPL3')
depends=('fuse' 'lz4' 'openssl' 'libusb')
optdepends=('python: for python bindings')

_get_source_url() {
    local arch=$1
    local pattern
    case "$arch" in
        x86_64) pattern="linux_x64" ;;
        aarch64) pattern="linux_aarch64" ;;
    esac
    echo "$_release_info" | jq -r ".assets[] | select(.name | contains(\"$pattern\")) | .browser_download_url" | head -1
}

source_x86_64=("$(_get_source_url x86_64)")
source_aarch64=("$(_get_source_url aarch64)")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha512sums_x86_64=('SKIP')
sha512sums_aarch64=('SKIP')

package() {
    cd "$srcdir"

    # Create directories
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/memprocfs"
    install -dm755 "$pkgdir/usr/include"

    # Install binaries
    install -Dm755 memprocfs "$pkgdir/usr/bin/memprocfs"

    # Install headers
    install -Dm644 *.h "$pkgdir/usr/include"

    # Install libraries
    install -Dm755 *.so "$pkgdir/usr/lib/"

    # Install Python files if any
    if [ -d "python" ]; then
        cp -r python "$pkgdir/usr/share/memprocfs/"
    fi

    # Install documentation if any
    if [ -f "README.md" ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
