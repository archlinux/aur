# Maintainer: DarkLord-W <42199147+DarkLord-W@users.noreply.github.com>

pkgname=appimage-manager-gtk
pkgver=1.1.0
pkgrel=1
pkgdesc="Scan for AppImages and create and maintain their desktop launchers"
arch=('x86_64')
url="https://github.com/DarkLord-W/appimage-manager"
license=('GPL-3.0-or-later')

# 上游的仓库名，和 pkgname **不是一回事**：pkgname 带 -gtk 是因为 AUR 上
# appimage-manager 这个名字被一个残留的 git 仓库占着（详见 README.md）。
#
# 凡是拼上游文件名或目录名的地方都必须用这个变量。写成 $pkgname 的话，
# 下载会去要一个不存在的 appimage-manager-gtk-1.1.0-src.tar.gz（404），
# 打包会 cd 进一个不存在的目录 —— 两种都是构建期才炸，报错还看不出原因。
_upstream=appimage-manager

depends=('gtk3' 'json-glib')
makedepends=('vala' 'pkgconf')
checkdepends=('desktop-file-utils')

# 源包是 GitHub Release 里的确定性产物（git archive 生成，
# .gitattributes 的 export-ignore 排掉了截图和 CI 配置）。
#
# 不用 GitHub 自动生成的 <tag>.tar.gz：那种包的校验和会变，AUR 不能接受 ——
# 用户会莫名其妙地校验失败。
#
# 左侧重命名成 $pkgname-$pkgver.tar.gz 是惯例，那是**本地存盘名**；
# 右边要的是上游真实资产名，必须用 $_upstream。解包后顶层目录是
# $_upstream-$pkgver/，和下面 cd 的路径对上。
source=("$pkgname-$pkgver.tar.gz::https://github.com/DarkLord-W/$_upstream/releases/download/v$pkgver/$_upstream-$pkgver-src.tar.gz")
sha256sums=('53bd3378dc5cca67d844fd85a27915f851775a635db87166d7804f0bf7c4a0f6')

build() {
    cd "$_upstream-$pkgver"
    make
}

check() {
    cd "$_upstream-$pkgver"
    # 258 项引擎自测，不需要图形环境。夹具由 make selftest 自己生成。
    make selftest
}

package() {
    cd "$_upstream-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr

    # make install 会对着 $pkgdir 跑 gtk-update-icon-cache 和
    # update-desktop-database（Makefile 里那两行，带 || true）。产出的是
    # 指向**构建目录**的缓存文件，打进包里会覆盖掉用户机器上正确的缓存。
    # pacman 的钩子（gtk-icon-cache / update-desktop-database）在安装时
    # 会重新生成，所以这里删掉。
    rm -f "$pkgdir/usr/share/applications/mimeinfo.cache" \
          "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
