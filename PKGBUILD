# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>

_gitname=cascadia-code
pkgbase=cascadia-code-git
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=2407.24.r0.g56bcca3f2
pkgrel=1
pkgdesc="A new monospaced font that includes programming ligatures"
url="https://github.com/microsoft/${_gitname}"
arch=('any')
license=('custom:OFL')
makedepends=(git python)
provides=("otf-cascadia-code=${pkgver}" "ttf-cascadia-code=${pkgver}")
conflicts=('nerd-fonts-cascadia-code' 'ttf-cascadia-code')
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_gitname}"
    python -m venv .venv
    source .venv/bin/activate
    # Install from upstream's unpinned manifest, not the stale 2024 lock
    # file (requirements.txt), so versions compatible with current Python
    # and build backends resolve. Microsoft hasn't refreshed the lock.
    pip install -r requirements.in
    python build.py -S
}

package_otf-cascadia-code-git() {
    cd "${_gitname}"
    install -Dm644 build/otf/static/*.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-cascadia-code-git() {
    cd "${_gitname}"
    install -Dm644 build/ttf/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
