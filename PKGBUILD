# Maintainer: muhammad <your@email.com>
# Contributor: Team Forever <https://github.com/ElspethThePict>

pkgname=sonic1forever-git
pkgver=r0.g0000000
pkgrel=1
pkgdesc="Sonic the Hedgehog Forever - a fan overhaul of Sonic 1 (2013 mobile) built on the RSDKv4 decompilation. Requires the original Sonic 1 2013 APK data files."
arch=('x86_64' 'aarch64')
url="https://github.com/ElspethThePict/S1Forever"
license=('custom')
depends=('sdl2' 'glew' 'libvorbis' 'libogg' 'libtheora')
makedepends=('git' 'base-devel')
conflicts=('sonic2013-git')
provides=('sonic1forever')
source=(
    "teamforever-engine::git+https://github.com/ElspethThePict/TeamForever-v4-1.3.git"
    "s1forever-mod::git+https://github.com/ElspethThePict/S1Forever.git"
    "s1-scripts::git+https://github.com/RSDKModding/RSDKv4-Script-Decompilation.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/teamforever-engine"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/teamforever-engine"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/teamforever-engine"
    make -j$(nproc)
}

package() {
    # Install the engine binary
    install -Dm755 "$srcdir/teamforever-engine/bin/Linux/s1fs2a" \
        "$pkgdir/usr/bin/s1fs2a"

    # Install mod files
    install -dm755 "$pkgdir/usr/share/sonic1forever"
    cp -r "$srcdir/s1forever-mod/Mods" "$pkgdir/usr/share/sonic1forever/"
    install -m644 "$srcdir/s1forever-mod/Forever.ini" "$pkgdir/usr/share/sonic1forever/"

    # Install base scripts
    install -dm755 "$pkgdir/usr/share/sonic1forever/Scripts"
    cp -r "$srcdir/s1-scripts/Sonic 1/Scripts/." "$pkgdir/usr/share/sonic1forever/Scripts/"

    # Install launcher script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/sonic1forever-launcher" <<'EOF'
#!/bin/bash
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/sonic1forever"

if [[ ! -d "$data_dir" ]]; then
    mkdir -p "$data_dir"
fi

# First run setup
if [[ ! -f "$data_dir/Data.rsdk" ]]; then
    echo "============================================"
    echo "  Sonic 1 Forever - First Run Setup"
    echo "============================================"
    echo ""
    echo "You need the original Sonic the Hedgehog (2013) APK."
    echo ""
    echo "Steps:"
    echo "  1. Obtain the Sonic 1 2013 APK (e.g. from your Android device)"
    echo "  2. Extract it:  unzip SonicTheHedgehog.apk -d /tmp/sonic1apk"
    echo "  3. Find the data file:"
    echo "     find /tmp/sonic1apk -name 'Data.rsdk*'"
    echo "  4. Copy it here:"
    echo "     cp /tmp/sonic1apk/.../Data.rsdk.xmf $data_dir/Data.rsdk"
    echo "  5. Run this launcher again."
    echo ""
    exit 1
fi

# Copy mod and script files from shared location on first setup
if [[ ! -d "$data_dir/Mods" ]]; then
    echo "Setting up Sonic 1 Forever mod files..."
    cp -r /usr/share/sonic1forever/Mods "$data_dir/"
    cp -r /usr/share/sonic1forever/Scripts "$data_dir/"
    cp /usr/share/sonic1forever/Forever.ini "$data_dir/"
    echo "Done! Mod files installed."
fi

# Write settings.ini if it doesn't exist
if [[ ! -f "$data_dir/settings.ini" ]]; then
    cat > "$data_dir/settings.ini" <<'SETTINGS'
[Dev]
DevMenu=true
EngineDebugMode=false
TxtScripts=true
StartingCategory=255
StartingScene=255
StartingPlayer=255
StartingSaveFile=255
FastForwardSpeed=8
UseHQModes=true
DataFile=Data.rsdk
[Game]
Language=0
GameType=0
SkipStartMenu=true
DisableFocusPause=3
[Window]
FullScreen=false
Borderless=false
VSync=false
ScalingMode=0
WindowScale=2
ScreenWidth=424
RefreshRate=60
DimLimit=300
[Audio]
BGMVolume=1.000000
SFXVolume=1.000000
SETTINGS
fi

cd "$data_dir"
exec /usr/bin/s1fs2a "$@"
EOF

    # Install desktop entry
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/sonic1forever.desktop" <<'EOF'
[Desktop Entry]
Name=Sonic the Hedgehog Forever
Comment=Fan overhaul of Sonic the Hedgehog (2013 mobile port)
Exec=sonic1forever-launcher
Icon=sonic1forever
Terminal=false
Type=Application
Categories=Game;
EOF

    # License
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Sonic the Hedgehog Forever is a non-profit fan project.
Not affiliated with SEGA, Sonic Team, or Christian Whitehead.
Sonic the Hedgehog is a trademark of SEGA.

Engine based on RSDKv4 decompilation by RubberDuckyCooly and RMGRich.
Modified for Sonic 1 Forever by Team Forever (ElspethThePict, AlyStyle, et al).
EOF
}
