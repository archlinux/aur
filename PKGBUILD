# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname=ktrl-git
pkgver=r165.55f7697
pkgrel=1
pkgdesc='A Supercharged Keyboard Programming Daemon'
url='https://github.com/ItayGarin/ktrl'
arch=('x86_64')
license=('GPL3')
provides=('ktrl')
depends=()
makedepends=('git' 'rust')
source=(
    "${pkgname}::git+https://github.com/ItayGarin/ktrl.git"
    ktrl.service
    ktrl.sysusers
)
sha256sums=(
    'SKIP'
    '3f091de9b6e7fae41edaec2c911d1b28dad95f6905137241216e312e4381bd7e'
    'f24bb2af5edc0e8b6143b7b27291638c1a98ab9738cb7f78870f3d1a99d0c799'
)
backup=('etc/ktrl/cfg.ron')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${pkgname}"
}

build() {
    cd "${pkgname}"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/ktrl -t "$pkgdir"/usr/bin
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
    install -Dm644 etc/99-uinput.rules -t "$pkgdir"/etc
    install -dm755 "$pkgdir"/etc/ktrl
    install -Dm644 examples/cfg.ron "$pkgdir"/etc/ktrl/cfg.ron
    install -dm755 "$pkgdir"/usr/share/ktrl/assets/sounds
    install -Dm644 assets/sounds/* -t "$pkgdir"/usr/share/ktrl/assets/
    install -Dm644 "$srcdir"/ktrl.service "$pkgdir"/usr/lib/systemd/system/ktrl@.service
    install -Dm644 "$srcdir"/ktrl.sysusers "$pkgdir"/usr/lib/sysusers.d/ktrl.conf
}
