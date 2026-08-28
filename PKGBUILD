# Maintainer: Marc Gibb
pkgname=proton-command-center-git
_pkgname=proton-command-center
pkgver=1.26.1.r1.g9d46796
pkgrel=1
pkgdesc="Per-game launch options, Proton selection, DLSS/FSR DLL management, native Ultra+ and RHI (ReShade/OptiScaler/DXVK) mod install, and controller navigation for Steam on Linux (git version)"
arch=('any')
url="https://github.com/mrcgibb9876-hash/proton_command_center"
license=('MIT')
depends=('python' 'xdg-utils' 'curl')
optdepends=(
    'steam: the storefront this manages (required in practice)'
    'mangohud: performance overlay toggle'
    'nvidia-utils: DLSS DLL management and driver-aware compile tracking'
    '7zip: OptiScaler install/update and DXVK Lilium HDR variant (both ship as .7z)'
)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm644 pcc.py     "$pkgdir/usr/share/$_pkgname/pcc.py"
    install -Dm644 index.html "$pkgdir/usr/share/$_pkgname/index.html"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -Dm644 -t "$pkgdir/usr/share/$_pkgname/optiscaler_inis" optiscaler_inis/*.ini

    install -Dm755 packaging/proton-command-center \
        "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 packaging/proton-command-center.desktop \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 packaging/proton-command-center.service \
        "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
}
