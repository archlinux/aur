# Maintainer: neycrol <330578697@qq.com>
pkgname=bcachefs-kernel-dkms-git
_pkgname=bcachefs-kernel
pkgver=20251209.r1.g1cb9d8b8c
pkgrel=1
pkgdesc="Bcachefs kernel module (DKMS) built directly from upstream kernel tree (fs/bcachefs), preserving directory structure"
arch=('x86_64')
url="https://bcachefs.org/"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
# 兼容性声明：防止与其他 bcachefs 驱动包冲突
provides=('bcachefs-dkms' 'bcachefs-dkms-git')
conflicts=('bcachefs-dkms' 'bcachefs-dkms-git' 'bcachefs-git' 'bcachefs-source-git')
source=(
    "dkms.conf.in"
    "Makefile.dkms"
)
sha256sums=('b57dd60f10e457258b894badc561f9a43339ae7491aebf3a98e56ef74934dfa0'
            'ad66094a544f86e2ac89180aee35e1bdd8c8941e51812e1553b0e0c8b0c487aa')

pkgver() {
    # 防止第一次运行时目录不存在报错
    if [ -d "$srcdir/$_pkgname" ]; then
        cd "$srcdir/$_pkgname"
        printf "%s.r%s.g%s" \
            "$(git show -s --format=%cd --date=format:%Y%m%d HEAD)" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
    else
        # 初始占位符
        printf "2025.12.09.r0.g0000000"
    fi
}

prepare() {
    local _kernel_repo="https://github.com/koverstreet/bcachefs.git"
    local _repo_dir="$srcdir/$_pkgname"

    # --- 1. 初始化仓库 ---
    if [ ! -d "$_repo_dir" ]; then
        msg2 "Initializing sparse checkout..."
        mkdir -p "$_repo_dir"
        cd "$_repo_dir"
        git init --initial-branch=master
        git remote add origin "$_kernel_repo"
        git config core.sparseCheckout true
    else
        cd "$_repo_dir"
        git remote set-url origin "$_kernel_repo"
    fi

    # --- 2. 配置稀疏检出 ---
    cat > .git/info/sparse-checkout <<EOF
fs/bcachefs/
include/trace/events/bcachefs.h
EOF
    
    # --- 3. 拉取代码 ---
    msg2 "Fetching latest kernel source..."
    
    git config http.postBuffer 524288000
    
    local _success=0
    for _i in {1..5}; do
        if git fetch --depth=1 origin master; then
            _success=1
            break
        fi
        msg2 "Fetch failed (Attempt $_i/5). Retrying in 10 seconds..."
        sleep 10
    done

    if [ $_success -eq 0 ]; then
        error "Failed to download kernel source after 5 attempts."
        return 1
    fi

    git reset --hard origin/master

    # --- 4. 准备构建环境 ---
    # 这里只清理 build 目录，不清理源码目录
    rm -rf "$srcdir/build"
    install -dm755 "$srcdir/build"

    install -dm755 "$srcdir/build/fs"
    cp -r "$_repo_dir/fs/bcachefs" "$srcdir/build/fs/"

    if [ -d "$_repo_dir/include" ]; then
        cp -r "$_repo_dir/include" "$srcdir/build/"
    fi

    install -m644 "$srcdir/dkms.conf.in" "$srcdir/build/dkms.conf"
    install -m644 "$srcdir/Makefile.dkms" "$srcdir/build/Makefile"

    if [ -f "$srcdir/build/fs/bcachefs/Makefile" ]; then
        msg2 "Renaming upstream Makefile to Kbuild..."
        mv "$srcdir/build/fs/bcachefs/Makefile" "$srcdir/build/fs/bcachefs/Kbuild"
    fi
}

package() {
    # 动态写入版本号到 dkms.conf
    # 先在 build 目录改好，再复制
    sed -i "s/@PKGVER@/${pkgver}/g" "$srcdir/build/dkms.conf"

    # 安装到 /usr/src/bcachefs-<version>
    local install_dir="$pkgdir/usr/src/bcachefs-${pkgver}"
    install -dm755 "$install_dir"
    
    # 整体复制 (保留了 fs/bcachefs 结构)
    cp -r "$srcdir/build/"* "$install_dir/"
}
