# Maintainer: unicxrn
pkgname=xerahs-git
pkgver=r1069.46190a5
pkgrel=1
pkgdesc="Cross-platform screen capture and file sharing tool (ShareX port) built with Avalonia UI"
arch=('x86_64')
url="https://github.com/ShareX/XerahS"
license=('GPL-3.0-or-later')
depends=(
    'dotnet-runtime-10.0'
    'libx11'
    'libxrandr'
    'dbus'
)
makedepends=(
    'dotnet-sdk-10.0'
    'git'
)
optdepends=(
    'wl-clipboard: Wayland clipboard support'
    'xclip: X11 clipboard support'
    'xdotool: X11 window management'
)
provides=('xerahs')
conflicts=('xerahs')
source=(
    "xerahs::git+https://github.com/ShareX/XerahS.git"
    "xerahs-editor::git+https://github.com/ShareX/XerahS.Editor.git"
    "xerahs.desktop"
    "xerahs.sh"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/xerahs"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # XerahS.Editor needs to be a sibling directory named XerahS.Editor
    # The solution references ../XerahS.Editor/src/XerahS.Editor/XerahS.Editor.csproj
    ln -sfn "$srcdir/xerahs-editor" "$srcdir/XerahS.Editor"
}

build() {
    cd "$srcdir/xerahs"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1

    dotnet publish src/XerahS.App/XerahS.App.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained false \
        -p:PublishSingleFile=false \
        -o "$srcdir/publish"
}

package() {
    # Install application files
    install -dm755 "$pkgdir/usr/lib/xerahs"
    cp -r "$srcdir/publish/"* "$pkgdir/usr/lib/xerahs/"

    # Make main executable... executable
    chmod +x "$pkgdir/usr/lib/xerahs/XerahS"

    # Install wrapper script
    install -Dm755 "$srcdir/xerahs.sh" "$pkgdir/usr/bin/xerahs"

    # Install desktop file
    install -Dm644 "$srcdir/xerahs.desktop" "$pkgdir/usr/share/applications/xerahs.desktop"

    # Install icon
    install -Dm644 "$srcdir/xerahs/src/XerahS.UI/Assets/Logo.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/xerahs.png"

    # Install license
    install -Dm644 "$srcdir/xerahs/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
