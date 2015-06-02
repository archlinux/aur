# Maintainer: James An <james@jamesan.ca>

_pkgname=subbrute
pkgname=$_pkgname-git
pkgver=77.r8.gd4aab4f
pkgrel=1
pkgdesc="A (fast) multi-threaded python tool for enumerating subdomains"
arch=('any')
url="https://github.com/TheRook/$_pkgname"
license=('unknown')
depends=('python-dnspython')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgnamee)
options=(!emptydirs)
source=("$_pkgname"::"git+https://github.com/TheRook/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    (
        set -o pipefail
        git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd $_pkgname

    # install upstream files
    install -m755 -d "$pkgdir/usr/lib/$_pkgname"
    install -m755 -t "$pkgdir/usr/lib/$_pkgname" resolvers.txt subbrute.py names.txt names_small.txt
    install -Dm755 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"

    # create symlink from /usr/bin
    install -m755 -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$_pkgname/$_pkgname.py" "${pkgdir}/usr/bin/$_pkgname"
}
