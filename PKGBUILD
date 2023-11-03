_godot=3.5.3 # We need a newer godot version than aur/godot-headless, set to empty to use aur version
_godot_template=$_godot # Set to empty to download them through Scripts project
# Note: please let those variables be set to same version.
_revolutionary_games_common_commit=4650b092a91389b660b1fcf67337fd3b20ada4cd

pkgname=thrive
pkgver=0.6.3
pkgrel=2
pkgdesc="the evolution game Thrive."
arch=("x86_64")
url="https://revolutionarygamesstudio.com/"
license=("GPL3" "CCPL")
depends=(
    "libxrender" "hicolor-icon-theme" "libxi" "libx11" "libglvnd" "libxinerama" "zlib" "libxrandr"
    "libxext" "glibc" "libxcursor"
)
makedepends=("git" "git-lfs" "dotnet-sdk-7.0" "p7zip")
source=(
    "git+https://github.com/Revolutionary-Games/Thrive.git#tag=v$pkgver"
    "git+https://github.com/Revolutionary-Games/RevolutionaryGamesCommon.git#commit=$_revolutionary_games_common_commit"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

if [ -n "$_godot" ]
then
    _godot_repo="https://github.com/godotengine/godot"
    makedepends+=("libxcursor" "libxinerama" "libxrandr" "libxi" "libglvnd")
    source+=(
        "godot-$_godot.zip::$_godot_repo/releases/download/$_godot-stable/Godot_v$_godot-stable_mono_linux_headless_64.zip"
    )
    sha256sums+=('9602657c95a6fb0d8411ac6603aca4dd1bb1700373b06e6358c01c63eb2cca51')
    if [ -n "$_godot_template" ]
    then
        source+=(
            "$_godot_template.stable.mono.zip::$_godot_repo/$_godot_template-stable/Godot_v$_godot_template-stable_mono_export_templates.tpz"
        )
        sha256sums+=('5984f7452187a00b3f606c7790d7470784663442a0ba9f73b0a9a2c84ef4d541')
    fi
else
    makedepends+=("godot-headless>=3.5")
fi

prepare(){
    git lfs install
    target_dirs=(
        "$srcdir/Thrive"
    )
    for dir in "${target_dirs[@]}"
    do
        cd $dir
        git submodule init
        grep submodule .gitmodules | sed 's/\[submodule "//;s/"\]//' | while read -r module
        do
            repo=$(basename $module)
            git config "submodule.$module.url" "$srcdir/$repo"
        done
        git -c protocol.file.allow=always submodule update
    done
    cd "$srcdir/Thrive"
    git lfs pull
    sed -i "s/\"3.5\"/\"$_godot\"/" Scripts/GodotVersion.cs
    if [ -n "$_godot" ]
    then
        rm -rf "$srcdir/godot-$_godot"
        mv "$srcdir/Godot_v$_godot-stable_mono_linux_headless_64" "$srcdir/godot-$_godot"
        mv "$srcdir/godot-$_godot/Godot_v$_godot-stable_mono_linux_headless.64" "$srcdir/godot-$_godot/godot"
        export PATH="$srcdir/godot-$_godot:$PATH"
        if [ -n "$_godot_template" ]
        then
            mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/godot/templates"
            cp -r "$srcdir/templates" "${XDG_DATA_HOME:-$HOME/.local/share}/godot/templates/$_godot_template.stable.mono"
        else
            dotnet run --project Scripts -- godot-templates
        fi
    else
        dotnet run --project Scripts -- godot-templates
    fi

}

build(){
    cd "$srcdir/Thrive"
    if [ -n "$_godot" ]
    then
        export PATH="$srcdir/godot-$_godot:$PATH"
    fi
    dotnet run --project Scripts -- package --compress=false Linux
}

check(){
    cd "$srcdir/Thrive"
    if [ -n "$_godot" ]
    then
        export PATH="$srcdir/godot-$_godot:$PATH"
    fi
    dotnet run --project Scripts -- test
}

package(){
    cd "$srcdir/Thrive"
    mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/thrive"
    cp -a builds/Thrive_*_linux_x11 "$pkgdir/opt/thrive"
    ln -s /opt/thrive/Thrive "$pkgdir/usr/bin/Thrive"
    ln -s /opt/thrive/ThriveAssetsLICENSE.txt "$pkgdir/usr/share/licenses/thrive/ThriveAssetsLICENSE.txt"
    ln -s /opt/thrive/GodotLicense.txt "$pkgdir/usr/share/licenses/thrive/GodotLicense.txt"
    ln -s /opt/thrive/LICENSE.txt "$pkgdir/usr/share/licenses/thrive/LICENSE.txt"
    install -Dm644 "$pkgdir/opt/thrive/Thrive.png" "$pkgdir/usr/share/icons/hicolor/1000x1000/apps/Thrive.png"
    install -Dm644 "$pkgdir/opt/thrive/Thrive.desktop" "$pkgdir/usr/share/applications/Thrive.desktop"
}
