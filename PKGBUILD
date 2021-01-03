# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>

_gitname=cascadia-code
pkgbase=cascadia-code-git
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=2009.22.r4.g643858a5
pkgrel=1
pkgdesc="A new monospaced font that includes programming ligatures"
url="https://github.com/microsoft/${_gitname}"
arch=('any')
license=('custom:OFL')
makedepends=('git' 'python' 'ttfautohint')
provides=("otf-cascadia-code=${pkgver}" "ttf-cascadia-code=${pkgver}")
conflicts=('nerd-fonts-cascadia-code' 'ttf-cascadia-code')
source=("git+${url}.git"
        'python-deps.patch')
sha256sums=('SKIP'
            '201882415e4420730df7d787e3578bff8358551acf1b37d0ececdc25b8f24ce3')

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_gitname}"
    patch --forward --strip=1 --input="${srcdir}/python-deps.patch"
}

build() {
    cd "${_gitname}"
    # Using pip because deps in AUR are broken.
    python -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
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
