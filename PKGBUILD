# Maintainer: unicxrn
pkgname=xerahs-git
pkgver=r3172.2c007ee4
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

    # XerahS.UI.csproj references ImageEditor with GlobalPropertiesToRemove="OS", which
    # strips the MSBuild OS property during restore. NuGet then writes assets to the
    # non-OS-specific obj/project.assets.json, but the build's runtime OS detection reads
    # from obj/os-Unix/project.assets.json — a consistent mismatch on Linux. Removing
    # GlobalPropertiesToRemove="OS" from the ImageEditor reference lets both restore and
    # build use obj/os-Unix/project.assets.json consistently.
    sed -i 's| GlobalPropertiesToRemove="OS"||g' \
        "$srcdir/xerahs/src/desktop/app/XerahS.UI/XerahS.UI.csproj"

    # Clean stale NuGet intermediate outputs so the restore runs fresh
    rm -rf "$srcdir/xerahs-editor/src/ShareX.ImageEditor/obj" \
           "$srcdir/xerahs-editor/src/ShareX.ImageEditor/bin"
}

build() {
    # Build VideoEditor frontend (required by XerahS.App.csproj)
    cd "$srcdir/xerahs-videoeditor/frontend"
    npm ci
    npm run build

    cd "$srcdir/xerahs"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1

    # Restore with the publish RID so project.assets.json gains a net10.0/linux-x64
    # target for every project (including ImageEditor into obj/os-Unix/).
    dotnet restore src/desktop/app/XerahS.App/XerahS.App.csproj -r linux-x64

    # dotnet publish -r linux-x64 evaluates ImageEditor twice internally:
    # once in a "host framework" context (MSBuildProjectExtensionsPath=obj/os-Unix/host-net10.0/)
    # and once in the publish context (…/rid-linux-x64/).  The embedded restore only writes
    # project.assets.json into those subdirs — it does NOT write the .g.props/.g.targets
    # files that import NuGet package targets (including the Avalonia source generator that
    # generates InitializeComponent).  Pre-populate host-net10.0/ from the plain-restore
    # output so package targets are available during the build phase.
    local _img_obj="$srcdir/xerahs/ShareX.ImageEditor/src/ShareX.ImageEditor/obj/os-Unix"
    mkdir -p "$_img_obj/host-net10.0"
    cp "$_img_obj/project.assets.json" \
       "$_img_obj/project.nuget.cache" \
       "$_img_obj/ShareX.ImageEditor.csproj.nuget.dgspec.json" \
       "$_img_obj/ShareX.ImageEditor.csproj.nuget.g.props" \
       "$_img_obj/ShareX.ImageEditor.csproj.nuget.g.targets" \
       "$_img_obj/host-net10.0/"

    dotnet publish src/desktop/app/XerahS.App/XerahS.App.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained false \
        -p:PublishSingleFile=false \
        -p:DebugType=none \
        -p:DebugSymbols=false \
        --no-restore \
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
