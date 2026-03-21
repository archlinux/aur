# Maintainer: unicxrn
pkgname=xerahs-git
pkgver=r2405.3cc83c40
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
    'webkit2gtk-4.1'
)
makedepends=(
    'dotnet-sdk-10.0'
    'git'
    'nodejs'
    'npm'
)
optdepends=(
    'wl-clipboard: Wayland clipboard support'
    'xclip: X11 clipboard support'
    'xdotool: X11 window management'
    'grim: Wayland screenshot utility'
    'slurp: Wayland region selection for screenshots'
)
provides=('xerahs')
conflicts=('xerahs')
source=(
    "xerahs::git+https://github.com/ShareX/XerahS.git"
    "xerahs-editor::git+https://github.com/ShareX/ShareX.ImageEditor.git#branch=develop"
    "xerahs-videoeditor::git+https://github.com/ShareX/ShareX.VideoEditor.git#branch=main"
    "xerahs.desktop"
    "xerahs.sh"
)
sha256sums=(
    'SKIP'
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
    # ShareX.ImageEditor and ShareX.VideoEditor are submodules inside the XerahS tree;
    # git clone creates empty directories for them, so remove them first then symlink our clones
    rm -rf "$srcdir/xerahs/ShareX.ImageEditor"
    ln -sfn "$srcdir/xerahs-editor" "$srcdir/xerahs/ShareX.ImageEditor"

    rm -rf "$srcdir/xerahs/ShareX.VideoEditor"
    ln -sfn "$srcdir/xerahs-videoeditor" "$srcdir/xerahs/ShareX.VideoEditor"
}

build() {
    cd "$srcdir/xerahs"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1

    dotnet publish src/desktop/app/XerahS.App/XerahS.App.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained false \
        -p:PublishSingleFile=false \
        -p:DebugType=none \
        -p:DebugSymbols=false \
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
    install -Dm644 "$srcdir/xerahs/src/desktop/app/XerahS.UI/Assets/Logo.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/xerahs.png"

    # Install license
    install -Dm644 "$srcdir/xerahs/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
