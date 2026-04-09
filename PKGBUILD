# Maintainer: Rémy Marquis <https://github.com/rmarquis>
_pkgname=nebula-drm
pkgname=$_pkgname-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="DRM-based color temperature tool with solar position for COSMIC DE"
arch=('x86_64')
url="https://github.com/rmarquis/nebula-drm"
license=('MIT')
depends=('libdrm')
makedepends=('zig' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=nebula-drm.install
backup=('etc/nebula-drm.conf')
source=("$_pkgname::git+https://github.com/rmarquis/nebula-drm.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$_pkgname"

    install -Dm755 "zig-out/bin/nebula-drm" "$pkgdir/usr/bin/nebula-drm"

    install -Dm644 "systemd/nebula-drm.service" \
        "$pkgdir/usr/lib/systemd/system/nebula-drm.service"

    install -Dm644 "systemd/greetd.service.d/after-nebula-drm.conf" \
        "$pkgdir/usr/lib/systemd/system/greetd.service.d/after-nebula-drm.conf"

    install -Dm644 "nebula-drm.conf" \
        "$pkgdir/etc/nebula-drm.conf"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nebula-drm/LICENSE"
}
