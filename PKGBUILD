# Maintainer: sudoskys <tururu02 at gmail dot com>
# Contributor: ilovesusu (Joy Jasper) <0x73757375@gmail.com>
# 云听的发行版包：按 pkgver 取对应的 git 标签构建，只装发布过的版本。发版时把 pkgver 改成新版本号。
# 不在 AUR 上：用户按 README「安装」克隆仓库后在这里 makepkg -si。
# 本地试打包这个仓库（标签要已存在）：
#   YUNTING_REPO="git+file://$(git rev-parse --show-toplevel)" makepkg -si
pkgname=yunting
pkgver=0.6.30
pkgrel=2
pkgdesc='Native KDE client for NetEase Cloud Music (Qt 6 / Kirigami)'
arch=(x86_64 aarch64)
url='https://github.com/nephelesound/yunting'
license=('GPL-3.0-or-later' 'MIT' 'Apache-2.0')   # MIT：应用图标（Microsoft Fluent Emoji），见 data/ICON-LICENSE；
                                                   # Apache-2.0：编进程序的 Material Color Utilities（src/third_party/）
depends=(
  qt6-base qt6-declarative mpvqt mpv
  kirigami kirigami-addons kcoreaddons kdbusaddons kwindowsystem ki18n kcolorscheme kconfig kstatusnotifieritem prison
  qtkeychain-qt6 openssl fontconfig
  layer-shell-qt   # Wayland 下桌面歌词置顶
  zstd
)
makedepends=(cmake ninja git)
conflicts=(yunting-git)   # 以前从主干构建的包；装这个时 pacman 会提示替换
# 系统 makepkg.conf 默认开 debug：会把剥过符号的二进制挪进 -debug 子包，主包变空
options=(!debug)
source=("$pkgname::${YUNTING_REPO:-git+https://github.com/nephelesound/yunting.git}#tag=v$pkgver")
sha256sums=(SKIP)

build() {
  cmake -S "$pkgname/src" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  # 打包检查不连构建者的桌面：断开会话总线，要对着真实 Plasma 测的（抑制睡眠）自己跳过。
  # 否则桌面门户一时异常（例如后端没起来）就装不上
  DBUS_SESSION_BUS_ADDRESS=unix:path=/nonexistent ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
