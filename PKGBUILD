# Maintainer: Salamandar <felix@piedallu.me>

_pkgname=kicad-library-utils
pkgname="${_pkgname}-git"
pkgver=r1202.93e559b
pkgrel=1
pkgdesc='Some scripts for helping with library development, git checkout'
arch=('any')
url='https://gitlab.com/kicad/libraries/kicad-library-utils'
license=('GPLv3')
depends=('python3')
source=(
    "git+${url}.git#branch=master"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"

    install_dir="/usr/share/kicad/scripting/$_pkgname"
    mkdir -p "$pkgdir/$install_dir"
    cp .  -R "$pkgdir/$install_dir"

    mkdir -p "$pkgdir/usr/bin"

    declare -A scripts=(
        [check_symbol.py]=kicad_check_symbol
        [check_footprint.py]=kicad_check_footprint
        [check_3d_coverage.py]=kicad_check_3d_coverage
        [comparelibs.py]=kicad_comparelibs
    )
    for script in "${!scripts[@]}"; do
        printf '#!/usr/bin/env bash\nexec %s $@\n' "$install_dir/klc-check/$script" \
            > "$pkgdir/usr/bin/${scripts[$script]}"
        chmod +x "$pkgdir/usr/bin/${scripts[$script]}"
    done
}
