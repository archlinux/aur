# Maintainer: Erfan Kheyrollahi <ekm507@gmail.com>

# Contributor: Komeil Parseh <ahmdparsh129@gmail.com>

pkgname="araste-git"
_gitname="araste"
pkgver=r1.3_350.45eb90f
pkgrel=1
pkgdesc="Making ascii-art out of Persian/Arabic text"
arch=("any")
url="https://github.com/ekm507/araste"
license=("AGPLv3")
depends=("python" "python-setuptools" "python-pip")
makedepends=("git")
install="beauty.install"
source=("araste::git+https://github.com/ekm507/araste.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed "s/\([^-]*-g\)/r\1/;s/-/./g" ||
    printf "r%s_%s.%s" "$(python -c 'from araste import __version__;print(__version__)')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
    cd "${srcdir}/${_gitname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_gitname}"

    install -d "${pkgdir}/usr/share/licenses/${_gitname}"
    install -d "${pkgdir}/usr/share/man/man1/${_gitname}.1.gz"

    install -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
    install -m644 "assest/${_gitname}.1.gz" "${pkgdir}/usr/share/man/man1/${_gitname}.1.gz"

    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
