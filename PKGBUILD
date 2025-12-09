# Maintainer: neycrol <330578697@qq.com>
pkgname=bcachefs-kernel-dkms-git
pkgver=20251208.r1.gb9726ef92
pkgrel=1
pkgdesc="Bcachefs kernel module (DKMS) built directly from upstream kernel tree (fs/bcachefs)"
arch=('x86_64')
url="https://bcachefs.org/"
license=('GPL')
depends=('dkms')
makedepends=('git')
conflicts=('bcachefs-dkms' 'bcachefs-git' 'bcachefs-source-git')
provides=('bcachefs-dkms')
source=(
    "dkms.conf.in"
    "Makefile.dkms"
)

sha256sums=('ec9ac141c9d72ef07c40715a89d8d6f55803ce716da7e98a0daed10ac19104e2'
            'ad66094a544f86e2ac89180aee35e1bdd8c8941e51812e1553b0e0c8b0c487aa')

pkgver() {
    # 健壮性检查：防止目录不存在报错
    if [ -d "$srcdir/bcachefs-kernel" ]; then
        cd "$srcdir/bcachefs-kernel"
        printf "%s.r%s.g%s" \
            "$(git show -s --format=%cd --date=format:%Y%m%d HEAD)" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
    else
        # 第一次运行时的回退版本
        printf "2025.12.09.r0.g0000000"
    fi
}

prepare() {
    local _kernel_repo="https://github.com/koverstreet/bcachefs.git"
    local _kernel_dir="$srcdir/bcachefs-kernel"

    # --- 1. 初始化仓库 (如果不存在) ---
    if [ ! -d "$_kernel_dir" ]; then
        msg2 "Initializing sparse checkout..."
        mkdir -p "$_kernel_dir"
        cd "$_kernel_dir"
        git init
        git remote add origin "$_kernel_repo"
        git config core.sparseCheckout true
    else
        cd "$_kernel_dir"
    fi

    # --- 2. 配置稀疏检出 (每次都刷新配置，防止漏文件) ---
    echo "fs/bcachefs/" > .git/info/sparse-checkout
    echo "include/trace/events/bcachefs.h" >> .git/info/sparse-checkout
    
    # --- 3. 拉取代码 ---
    msg2 "Pulling latest kernel source..."
    git pull --depth=1 origin master

    # --- 4. 准备构建环境 ---
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"

    # 复制 fs/bcachefs 目录结构到 build/fs/bcachefs
    install -d "$srcdir/build/fs"
    cp -r "$_kernel_dir/fs/bcachefs" "$srcdir/build/fs/"

    # 复制 include 目录 (如果有)
    if [ -d "$_kernel_dir/include" ]; then
        cp -r "$_kernel_dir/include" "$srcdir/build/"
    fi

    # 注入配置
    cp "$srcdir/dkms.conf.in" "$srcdir/build/dkms.conf"
    cp "$srcdir/Makefile.dkms" "$srcdir/build/Makefile"

    # 改名 Kbuild (防止与 Wrapper 冲突)
    if [ -f "$srcdir/build/fs/bcachefs/Makefile" ]; then
        msg2 "Renaming upstream Makefile to Kbuild..."
        mv "$srcdir/build/fs/bcachefs/Makefile" "$srcdir/build/fs/bcachefs/Kbuild"
    fi
}

package() {
    # 动态写入版本号到 dkms.conf
    sed -i "s/@PKGVER@/${pkgver}/g" "$srcdir/build/dkms.conf"

    # 安装到 /usr/src/bcachefs-<version>
    local install_dir="$pkgdir/usr/src/bcachefs-${pkgver}"
    install -d "$install_dir"
    
    # 整体复制
    cp -r "$srcdir/build/"* "$install_dir/"
}
