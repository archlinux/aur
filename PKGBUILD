# Maintainer: unicxrn
pkgname=xerahs-git
pkgver=r4924.9712850d
pkgrel=2
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
    'grim: Wayland screenshot utility'
    'slurp: Wayland region selection for screenshots'
)
provides=('xerahs')
conflicts=('xerahs')
options=('!debug' '!strip')
source=(
    "xerahs::git+https://github.com/ShareX/XerahS.git"
    "xerahs-editor::git+https://github.com/KovaForge/ShareX.ImageEditor.git"
    "xerahs-omacut::git+https://github.com/KovaForge/omacut.git"
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
    cd "$srcdir/xerahs"

    # Check out ShareX.ImageEditor and Omacut at the commits XerahS pins, using our
    # local clones as the submodule remotes. Tracking branch tips instead breaks the
    # build whenever a submodule API changes ahead of XerahS. (native/omasnap is not
    # referenced by any project, so it is left uninitialised.)
    git submodule init ShareX.ImageEditor Omacut
    git config submodule.ShareX.ImageEditor.url "$srcdir/xerahs-editor"
    git config submodule.Omacut.url "$srcdir/xerahs-omacut"
    git -c protocol.file.allow=always submodule update --checkout ShareX.ImageEditor Omacut

    # XerahS.Core.csproj references ImageEditor with GlobalPropertiesToRemove="OS", which
    # strips the MSBuild OS property during restore. NuGet then writes assets to the
    # non-OS-specific obj/project.assets.json, but the build's runtime OS detection reads
    # from obj/os-Unix/project.assets.json, a consistent mismatch on Linux. Removing
    # GlobalPropertiesToRemove="OS" from the ImageEditor reference lets both restore and
    # build use obj/os-Unix/project.assets.json consistently.
    sed -i 's| GlobalPropertiesToRemove="OS"||g' \
        src/desktop/core/XerahS.Core/XerahS.Core.csproj \
        src/desktop/app/XerahS.UI/XerahS.UI.csproj

    # Clean stale NuGet intermediate outputs so the restore runs fresh
    rm -rf ShareX.ImageEditor/src/ShareX.ImageEditor/obj \
           ShareX.ImageEditor/src/ShareX.ImageEditor/bin
}

build() {
    cd "$srcdir/xerahs"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1

    # Restore with the publish RID so project.assets.json gains a net10.0/linux-x64
    # target for every project (including ImageEditor into obj/os-Unix/).
    dotnet restore src/desktop/app/XerahS.App/XerahS.App.csproj -r linux-x64

    # dotnet publish -r linux-x64 evaluates ImageEditor twice internally:
    # once in a "host framework" context (MSBuildProjectExtensionsPath=obj/os-Unix/host-net10.0/)
    # and once in the publish context (…/rid-linux-x64/).  The embedded restore only writes
    # project.assets.json into those subdirs, but it does NOT write the .g.props/.g.targets
    # files that import NuGet package targets (including the Avalonia source generator that
    # generates InitializeComponent).  Pre-populate both the host-net10.0/ and the
    # rid-linux-x64/ contexts from the plain-restore output so package targets are
    # available during the build phase.
    local _img_obj="$srcdir/xerahs/ShareX.ImageEditor/src/ShareX.ImageEditor/obj/os-Unix"
    local _ctx
    for _ctx in host-net10.0 rid-linux-x64; do
        mkdir -p "$_img_obj/$_ctx"
        cp "$_img_obj/project.assets.json" \
           "$_img_obj/project.nuget.cache" \
           "$_img_obj/ShareX.ImageEditor.csproj.nuget.dgspec.json" \
           "$_img_obj/ShareX.ImageEditor.csproj.nuget.g.props" \
           "$_img_obj/ShareX.ImageEditor.csproj.nuget.g.targets" \
           "$_img_obj/$_ctx/"
    done

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
