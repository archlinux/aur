# Maintainer: eon <eon@localhost>
pkgname=azur-promilia-launcher
pkgver=1.0.0
pkgrel=8
pkgdesc="蓝色星原：旅谣 Linux 启动器（dwproton + azur 补丁 + SDK 桥接登录）"
arch=('x86_64')
url="https://github.com/puji4810/azur-sdk-qt"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6' 'dwproton-bin' 'dwproton-azur-patch')
optdepends=('libnotify: 桌面通知（从图标启动失败时提示原因）'
            'xdg-utils: --install 时打开官方下载页'
            'lsof: X11 连接数预检')
makedepends=('git' 'mingw-w64-gcc')
options=('!strip')
install=azur-promilia-launcher.install
source=("azur-sdk-qt::git+https://github.com/puji4810/azur-sdk-qt.git"
        "azur-promilia.sh"
        "azur-promilia.desktop"
        "azur-promilia-login.desktop"
        "azur-promilia.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
    cd "$srcdir/azur-sdk-qt"

    # 桥接的两个 PE 文件：宿主 + 替换官方 union_pcsdk.dll 的代理
    x86_64-w64-mingw32-gcc -DUNICODE -O2 -municode bridge/sdk-bridge-host.c \
        -o azur-sdk-host.exe -luser32 -lgdi32 -lws2_32 -lbcrypt
    x86_64-w64-mingw32-gcc -O2 -shared bridge/sdk-bridge-proxy.c bridge/sdk-bridge.def \
        -o union_pcsdk.dll -luser32
}

package() {
    cd "$srcdir/azur-sdk-qt"

    install -dm755 "$pkgdir/usr/share/azur-promilia/build/selected"
    install -m644 run.py login_window.py upstream-lock.json \
        "$pkgdir/usr/share/azur-promilia/"
    install -m755 azur-sdk-host.exe union_pcsdk.dll \
        "$pkgdir/usr/share/azur-promilia/build/selected/"

    install -Dm755 "$srcdir/azur-promilia.sh" "$pkgdir/usr/bin/azur-promilia"
    install -Dm644 "$srcdir/azur-promilia.desktop" \
        "$pkgdir/usr/share/applications/azur-promilia.desktop"
    install -Dm644 "$srcdir/azur-promilia-login.desktop" \
        "$pkgdir/usr/share/applications/azur-promilia-login.desktop"
    install -Dm644 "$srcdir/azur-promilia.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/azur-promilia.png"
}
