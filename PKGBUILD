# Maintainer: SiHuan <sihuan at sakuya.love>
_pkgname=shitama
pkgname=$_pkgname-git
pkgver="r34.fb2748e"
pkgrel=1
pkgdesc="「Shitama」是一个类毛玉服务，可以为「东方非想天则」提供简单的端口转发功能。"
arch=('any')
url="https://github.com/Si-Huan/shitama"
license=('AGPL3')
depends=('qt5-charts' 'hicolor-icon-theme')
makedepends=('git' 'qt5-base' 'go' 'imagemagick')
provides=("$_pkgname")
conflicts=()
replaces=()
backup=()
options=()
install=shitama.install
source=(
    'shitama::git+https://github.com/Si-Huan/shitama.git'
    'shitama.install'
)
noextract=()
sha512sums=(
    'SKIP'
    '57c56b5b04d089042a19182504993454fdae52acb645895cda3bbaf064cf5cb8c1c0102b6a9e80b33df2f4ca5ce4ab7f7003f56c1fa5965a5e0cf503d3c475c0'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i 's|./client|/usr/bin/shitama-client|g' client-ui-qt/mainwindow.cpp

    sed -i 's|shitama.tldr.run|shitama.sakuya.love|g' client/lib/client.go
    sed -i 's|115.159.87.170|115.159.91.168|g' client/lib/client.go
}

build() {
    cd "$srcdir/$_pkgname/client-ui-qt"
    export SHITAMA_BUILD_ID=`git rev-list --count HEAD`
    export SHITAMA_COMMIT=`git rev-parse HEAD`
    qmake
    make all -j8

    cd "$srcdir/$_pkgname"
    ### 如果你可以正常的下载 go 的依赖库，可选择注释掉下一行 ###
    export GOPROXY=https://goproxy.cn,direct
    go build -o ./build/client/client ./client
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 "$srcdir/$_pkgname/build/client/client" "$pkgdir/usr/bin/shitama-client"
    install -D -m755 "$srcdir/$_pkgname/build/client-ui-qt/Shitama" "$pkgdir/usr/bin/shitama"

    for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p "$target"
        convert "$srcdir/$_pkgname/client-ui-qt/shitama.png" -resize ${size}x${size} "$target/shitama.png"
    done

    echo "[Desktop Entry]
Version=r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
Encoding=UTF-8
Name=Shitama
Comment=Shitama for Linux
Exec=shitama
Icon=shitama
Terminal=false
Type=Application
Categories=Network;Game;
    " > "$srcdir/shitama.desktop"
    install -Dm644 "$srcdir/shitama.desktop" "$pkgdir/usr/share/applications/shitama.desktop"
}
