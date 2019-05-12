# Maintainer: desbma
pkgname=pacman-hooks-desbma-git
pkgver='r14.d1488e8'
pkgrel=1
pkgdesc='Various personal Pacman hooks'
arch=('x86_64')
_gitname='pacman-hooks'
url="https://github.com/desbma/${_gitname}"
license=('GPL')
depends=('git' 'pacman-contrib' 'patch' 'reflector')
makedepends=('rust')
source=("git+https://github.com/desbma/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}/check-broken-packages"
    cargo build --release
}

package() {
    cd "${srcdir}/${_gitname}"

    install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" check-broken-packages/check-broken-packages.hook
    install -Dm 644 cinnamon-tweaks/cinnamon-tweaks.hook "${pkgdir}/usr/share/libalpm/hooks/10-cinnamon-tweaks.hook"
    install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" pacdiff/pacdiff.hook
    install -Dm 755 -t "${pkgdir}/usr/share/libalpm/scripts" pacdiff/pacdiff_diffprog
    install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" reflector/reflector.hook
    install -Dm 644 sync/boot_sync.hook "${pkgdir}/usr/share/libalpm/hooks/99-boot_sync.hook"
    install -Dm 644 sync/root_sync.hook "${pkgdir}/usr/share/libalpm/hooks/99-root_sync.hook"

    install -Dm 644 -t "${pkgdir}/usr/share/cinnamon/theme" cinnamon-tweaks/cinnamon.css.patch

    install -Dm 755 -t "${pkgdir}/usr/bin" check-broken-packages/target/release/check-broken-packages

    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
