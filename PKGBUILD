# Maintainer: Nick Knight <nickknight@netc.fr>
pkgname=skix-git
_pkgname=skix
pkgver=r5.73d2e14
pkgrel=1
pkgdesc="Small skiing game (terminal + SDL) inspired by SkiFree"
arch=('any')
url="https://codeberg.org/nickknight/Skix"
license=('MIT')
depends=('python' 'python-pygame')
optdepends=('python-numpy: enables procedural sound effects in the SDL version')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/Skix"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/Skix"

    # Game scripts under /usr/share/skix/
    install -Dm755 skix.py     "${pkgdir}/usr/share/${_pkgname}/skix.py"
    install -Dm755 skix_sdl.py "${pkgdir}/usr/share/${_pkgname}/skix_sdl.py"

    # Doc + license
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # Launcher wrappers in /usr/bin/
    install -dm755 "${pkgdir}/usr/bin"
    printf '#!/bin/sh\nexec /usr/bin/python3 /usr/share/%s/skix.py "$@"\n' \
        "${_pkgname}" > "${pkgdir}/usr/bin/skix"
    chmod 755 "${pkgdir}/usr/bin/skix"
    printf '#!/bin/sh\nexec /usr/bin/python3 /usr/share/%s/skix_sdl.py "$@"\n' \
        "${_pkgname}" > "${pkgdir}/usr/bin/skix-sdl"
    chmod 755 "${pkgdir}/usr/bin/skix-sdl"
}
