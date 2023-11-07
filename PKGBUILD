# Maintainer: humanbeing27 <electronneutrino27@proton.me>

_quackdoc_scripts_commit=d7ad1900690f39589d16c2f481096ce130faf0f1
_waydroid_10_11_switch_script_commit=f50121ae1e106c0b594ef3c392f6b58a562e1d26
_wd_scripts_commit=f8f4e3ca2c9501063d59168946cd2cdc23f6c60d

pkgname='waydroid-settings-git'
pkgver=r115.d2e9aa9
pkgrel=2
makedepends=('git')
arch=('any')
pkgdesc="GTK app written in Python to control Waydroid settings"
url="https://github.com/axel358/Waydroid-Settings"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "git+$url.git#branch=main"
    "quackdoc_scripts::git+https://github.com/Quackdoc/waydroid-scripts.git#commit=$_quackdoc_scripts_commit"
    "git+https://github.com/electrikjesus/waydroid-10-11-switch-script.git#commit=$_waydroid_10_11_switch_script_commit"
    "git+https://github.com/electrikjesus/wd-scripts.git#commit=$_wd_scripts_commit")
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare(){
    target_dirs=(
        "$srcdir/Waydroid-Settings"
    )
    for target_dir in "${target_dirs[@]}"
    do
        cd $target_dir
        git submodule init
        grep submodule .gitmodules | sed 's/\[submodule "//;s/"\]//' | while read -r module
        do
            repo=$(basename "$module")
            git config "submodule.$module.url" "$srcdir/$repo"
        done
        git -c protocol.file.allow=always submodule update
    done
}
pkgver() {
    cd "$srcdir/Waydroid-Settings"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
    depends=("waydroid" "polkit" "gtk3" "vte3" "webkit2gtk")
    cp -vr "$srcdir/Waydroid-Settings/usr" "$pkgdir"
    chmod +x "$pkgdir/usr/bin/waydroid-helper"
    chmod +x "$pkgdir/usr/bin/waydroid-settings"
    # Some modifications
    sed -i 's/sudo //' "$pkgdir/usr/share/applications/install-to-waydroid.desktop"
    grep -q 'Categories=X-WayDroid-App;' "$pkgdir/usr/share/applications/waydroid-settings.desktop" || \
        echo 'Categories=X-WayDroid-App;' >> "$pkgdir/usr/share/applications/waydroid-settings.desktop"
}
