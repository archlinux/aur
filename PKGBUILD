# Maintainer: Indusy <indusywu@qq.com>

pkgname=miru-app-git
_gitname=${pkgname%-git}
pkgver=20240921.4556f07
pkgrel=2
pkgdesc="🎉 A versatile application that is free, open-source, and supports extension sources for videos, comics, and novels, available on Android, Windows, and Web platforms. "
url=https://github.com/benbensy/miru-app.git
arch=("x86_64")
depends=(
    "gtk3"
    "mpv"
)
optdepends=(
    "vlc"
)
makedepends=(
    "git"
    "clang"
    "cmake"
    "ninja"
)
provides=("${pkgname%-git}")
license=("GPLv3")
source=(
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.8-stable.tar.xz"
    "git+https://github.com/benbensy/miru-app.git"
    "miru.png::https://github.com/benbensy/miru-app/blob/dev/assets/icon/logo.png?raw=true"
)
sha256sums=(
    '7cb12032cf615a92a7bc9042100f3f2af62df7df3ca3bee27f4b153fe218b239'
    'SKIP'
    'df41ad6c2e544cfb066162b8ba1ea1d6b3fdc5a058233a7c0300d87f092d5f08'
)
pkgver() {
    cd "$_gitname"
    printf "%s.%s" "$(git show -s --format=%cs | tr -d -)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_gitname"
    git submodule update --init --recursive
}

build() {
    local FLUTTER_PATH=$(realpath flutter)
    export PATH="$FLUTTER_PATH/bin:$PATH"
    cd "$_gitname"
    flutter pub get
    flutter build linux --release
}

package() {
    cd "$_gitname"

    install -dm755 ${pkgdir}/opt
    mv build/linux/x64/release/bundle ${pkgdir}/opt/${_gitname}

    install -dm755 ${pkgdir}/usr/bin
    ln -s /opt/${_gitname}/miru ${pkgdir}/usr/bin/${_gitname}

    install -Dm 644 assets/icon/logo.png ${pkgdir}/usr/share/pixmaps/${_gitname}.png
    install -dm 755 "${pkgdir}/usr/share/applications"

    cat >${pkgdir}/usr/share/applications/${_gitname}.desktop <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Miru
Comment=Miru App
Exec=${_gitname}
Icon=${_gitname}
Categories=AudioVideo;Video;Player;TV;
Keywords=animation;anime;movie;player;tv;video;ebook;novel;
Terminal=false
EOF
}
