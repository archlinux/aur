# Maintainer: James An <james@jamesan.ca>

pkgname=subbrute-git
_gitname=subbrute
pkgver=r27.fbe48d9
pkgrel=1
pkgdesc="A (fast) multi-threaded python tool for enumerating subdomains"
arch=('any')
url="https://github.com/TheRook/${_gitname}"
license=('unknown')
depends=('python-dnspython')
makedepends=('git')
provides=($_gitname)
conflicts=($_gitname)
options=(!emptydirs)
source=(
    "git+https://github.com/TheRook/${_gitname}.git"
    pwd.patch
)
md5sums=(
    'SKIP'
    '6e46e8465d2306bc66da7ce9a2a2a41d'
)

pkgver() {
    cd $_gitname
    (
        set -o pipefail
        git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd $_gitname

    patch -p1 < ../pwd.patch
}

package() {
    cd $_gitname

    # install upstream files
    install -m755 -d "${pkgdir}/usr/lib/${_gitname}"
    install -m755 -t "${pkgdir}/usr/lib/${_gitname}" resolvers.txt subbrute.py subs.txt subs_small.txt
    install -Dm755 README.md "${pkgdir}/usr/share/doc/${_gitname}/README.md"

    # create symlink from /usr/bin
    install -m755 -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_gitname}/${_gitname}.py" "${pkgdir}/usr/bin/${_gitname}"
}
