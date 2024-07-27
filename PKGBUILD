# Maintainer: Indusy <indusywu@qq.com>

pkgname=miru-app-git
_gitname=${pkgname%-git}
pkgver=20240416.8599d0d
pkgrel=1
pkgdesc="🎉 A versatile application that is free, open-source, and supports extension sources for videos, comics, and novels, available on Android, Windows, and Web platforms. "
url=https://github.com/miru-project/miru-app.git
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
    "ninja"
    "flutter"
    "cmake"
)
provides=("${pkgname%-git}")
license=("GPLv3")
source=(
    "git+https://github.com/miru-project/miru-app#branch=dev"
    "modify-data-directory.patch"
    "fix-deps-version.patch"
    "miru.png::https://github.com/miru-project/miru-app/blob/dev/assets/icon/logo.png?raw=true"
)
sha256sums=(
    "SKIP"
    "890b1615cf114dd829c3f0a38c170239dcf0a19ac99462d5d3e0512f98461967"
    "52131f7df13bf963fbbbf57a5477b621b8a059b9a19183dea7ebe8ae781922f4"
    "df41ad6c2e544cfb066162b8ba1ea1d6b3fdc5a058233a7c0300d87f092d5f08"
)

pkgver() {
    cd "$_gitname"
    printf "%s.%s" "$(git show -s --format=%cs | tr -d -)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "$_gitname"
    git submodule update --init --recursive
    git apply ../modify-data-directory.patch
    git apply ../fix-deps-version.patch
}

build() {
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
