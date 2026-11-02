# Maintainer: Zius <ziuusdev@gmail.com>

pkgname=liquid-glass-git
_pkgname=liquid-glass
pkgver=0.1.0.r54.gc12f6a8
pkgrel=1
pkgdesc="Physical liquid glass & optical lensing UI engine for Linux & Wayland (WGPU + WGSL)"
arch=('x86_64' 'aarch64')
url="https://github.com/ziuus/liquid-glass"
license=('MIT')
depends=('vulkan-icd-loader' 'wayland')
makedepends=('git' 'cargo')
provides=('liquid-glass')
conflicts=('liquid-glass')
source=("git+https://github.com/ziuus/liquid-glass.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --workspace
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/glass-panel" "${pkgdir}/usr/bin/glass-panel"
    install -Dm755 "target/release/glass-clock" "${pkgdir}/usr/bin/glass-clock"
    install -Dm755 "target/release/glass-todo" "${pkgdir}/usr/bin/glass-todo"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
