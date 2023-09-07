_godot=true # We need a newer godot version than aur/godot-headless
_godot_template=true # Set to false to download them through Scripts project
#Note: please let those variables be set to true, or their versions may not be sync.

pkgname=thrive
pkgver=0.6.3
pkgrel=1
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
    "git+https://github.com/Revolutionary-Games/RevolutionaryGamesCommon.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

if $_godot
then
    makedepends+=("libxcursor" "libxinerama" "libxrandr" "libxi" "libglvnd")
    source+=(
        "godot-3.5.2.zip::https://github.com/godotengine/godot/releases/download/3.5.2-stable/Godot_v3.5.2-stable_mono_linux_headless_64.zip"
    )
    sha256sums+=('57d7d729c5af7191f0284b2b97de38c81a7979e30e39a9aa0d145767676df4cf')
    if $_godot_template
    then
        source+=(
            "3.5.2.stable.mono.zip::https://github.com/godotengine/godot/releases/download/3.5.2-stable/Godot_v3.5.2-stable_mono_export_templates.tpz"
        )
        sha256sums+=('88f6246b3cba7676a1c84485ac71849745001de7bec0c791c8096b6507674e53')
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
    sed -i 's/"3.5"/"3.5.2"/' Scripts/GodotVersion.cs
    if $_godot
    then
        rm -rf "$srcdir/godot-3.5.2"
        mv "$srcdir/Godot_v3.5.2-stable_mono_linux_headless_64" "$srcdir/godot-3.5.2"
        mv "$srcdir/godot-3.5.2/Godot_v3.5.2-stable_mono_linux_headless.64" "$srcdir/godot-3.5.2/godot"
        export PATH="$srcdir/godot-3.5.2:$PATH"
        if $_godot_template
        then
            mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/godot/templates"
            cp -r "$srcdir/templates" "${XDG_DATA_HOME:-$HOME/.local/share}/godot/templates/3.5.2.stable.mono"
        else
            dotnet run --project Scripts -- godot-templates
        fi
    else
        dotnet run --project Scripts -- godot-templates
    fi

}

build(){
    cd "$srcdir/Thrive"
    if $_godot
    then
        export PATH="$srcdir/godot-3.5.2:$PATH"
    fi
    dotnet run --project Scripts -- package --compress=false Linux
}

check(){
    cd "$srcdir/Thrive"
    if $_godot
    then
        export PATH="$srcdir/godot-3.5.2:$PATH"
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
