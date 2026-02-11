# Maintainer: Aliom <aliom_@outlook.com>
pkgname=dev-janitor-bin
_pkgname=dev-janitor
pkgver=2.2.9
pkgrel=3
pkgdesc="Dev Janitor - A developer tool management app (Binary release)"
arch=('x86_64')
url="https://github.com/cocojojo5213/Dev-Janitor"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'openssl' 'libappindicator-gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")

# ⚡️ 使用 'latest' 自动跳转到最新发布页
source=("https://github.com/cocojojo5213/Dev-Janitor/releases/latest/download/Dev.Janitor_${pkgver}_amd64.deb")

sha256sums=('SKIP')

package() {
    # 1. 解压 deb 包的第一层 (得到 control.tar.gz, data.tar.gz 等)
    bsdtar -xf *.deb -C "$pkgdir"

    # 2. 解压真正的程序数据
    # 兼容性处理：Tauri 2.x 通常使用 data.tar.gz，旧版或其他工具可能用 data.tar.xz
    if [ -f "$pkgdir/data.tar.gz" ]; then
        bsdtar -xf "$pkgdir/data.tar.gz" -C "$pkgdir"
        rm "$pkgdir/data.tar.gz" "$pkgdir/control.tar.gz" "$pkgdir/debian-binary"
    elif [ -f "$pkgdir/data.tar.xz" ]; then
        bsdtar -xf "$pkgdir/data.tar.xz" -C "$pkgdir"
        rm "$pkgdir/data.tar.xz" "$pkgdir/control.tar.xz" "$pkgdir/debian-binary"
    fi

    # 3. 修正权限 (确保安装的文件属于 root)
    chown -R root:root "$pkgdir" || true
}
