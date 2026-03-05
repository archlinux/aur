pkgname=ncm-desktop-for-linux-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A third-party NetEase Cloud Music client for Linux"
arch=('x86_64')
url="https://github.com/dddqmmx/ncm-desktop-for-linux"
license=('MIT')
depends=('electron')
makedepends=('nodejs' 'npm' 'git' 'rust' 'cargo')
provides=('ncm-desktop-for-linux')
conflicts=('ncm-desktop-for-linux')

# 解决符号丢失和大小变化的核心配置
options=(!strip)

source=(
    "git+$url.git"
    "ncm-desktop-for-linux.sh"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/ncm-desktop-for-linux"
  git describe --tags --long --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/ncm-desktop-for-linux"
    
    # 避免 Arch 默认 LDFLAGS/CFLAGS 干扰 Rust 与 aws-lc-sys 编译
    CFLAGS="${CFLAGS/-fno-plt/}"
    CXXFLAGS="${CXXFLAGS/-fno-plt/}"
    LDFLAGS="${LDFLAGS/-Wl,-z,now/}"

    # 禁用 LTO：aws-lc-sys 静态库在 LTO 下会导致未定义符号
    CFLAGS="${CFLAGS//-flto=auto/}"
    CFLAGS="${CFLAGS//-flto=thin/}"
    CFLAGS="${CFLAGS//-flto/}"
    CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    CXXFLAGS="${CXXFLAGS//-flto=thin/}"
    CXXFLAGS="${CXXFLAGS//-flto/}"
    LDFLAGS="${LDFLAGS//-flto=auto/}"
    LDFLAGS="${LDFLAGS//-flto=thin/}"
    LDFLAGS="${LDFLAGS//-flto/}"

    export CFLAGS CXXFLAGS LDFLAGS
    export AWS_LC_SYS_CFLAGS="$CFLAGS"
    
    npm ci
    npm run build:unpack
}

package() {
    cd "$srcdir/ncm-desktop-for-linux"

    install -d "$pkgdir/usr/lib/$pkgname"
    cp -r dist/linux-unpacked/resources/* "$pkgdir/usr/lib/$pkgname/"

    install -Dm755 "$srcdir/ncm-desktop-for-linux.sh" \
        "$pkgdir/usr/bin/ncm-desktop-for-linux"

    install -Dm644 packaging/ncm-desktop-for-linux.desktop \
        "$pkgdir/usr/share/applications/ncm-desktop-for-linux.desktop"

    install -Dm644 packaging/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/ncm-desktop-for-linux.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
