# Maintainer: taotieren <admin@taotieren.com>

pkgname=arch-router-git
pkgver=r11.29177d3
pkgrel=1
pkgdesc="Arch Linux Soft Router Script Toolbox"
arch=(any)
url="https://github.com/switchToLinux/arch_router"
license=('GPL-3.0-or-later')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(
    sh
)
makedepends=(
    git
)
optdepends=()
backup=()
options=('!strip' '!debug')
# install=${pkgname}.install
source=(
    "${pkgname}::git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    cd "${srcdir}/${pkgname}"
    for script in scripts/*; do
        [[ -f "$script" ]] || continue
        [[ ! -x "$script" ]] && chmod +x "$script"
        install -Dm755 "$script" "$pkgdir/usr/bin/$(basename "$script")"
    done

    install -dm755 "$pkgdir/usr/share/doc/${pkgname%-git}"
    cp -r docs/* "$pkgdir/usr/share/doc/${pkgname%-git}/"
    
    find "$pkgdir/usr/share/doc/${pkgname%-git}" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/doc/${pkgname%-git}" -type f -exec chmod 644 {} \;
}
