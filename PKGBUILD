# Maintainer: humanbeing27 <electronneutrino27@proton.me>

pkgname='waydroid-settings-git'
pkgver=r112.7716d97
pkgrel=1
makedepends=('git')
arch=('any')
pkgdesc="GTK app written in Python to control Waydroid settings"
url="https://github.com/axel358/Waydroid-Settings"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "git+$url.git#branch=main"
    "quackdoc_scripts::git+https://github.com/Quackdoc/waydroid-scripts.git"
    "git+https://github.com/electrikjesus/waydroid-10-11-switch-script.git"
    "git+https://github.com/electrikjesus/wd-scripts.git")
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
}
