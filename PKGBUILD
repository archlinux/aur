# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep-git
_gitname=dpsprep
pkgver=r86.5ee6667
pkgrel=1
pkgdesc='A DjVu to PDF converter with a focus on small output size and the ability to preserve document outlines and text layers'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL3')
makedepends=(git python-build python-installer python-wheel)
depends=(python python-click python-djvulibre python-fpdf2 python-loguru
         python-pillow python-pdfrw)
optdepends=('ocrmypdf: Optional OCR and advanced PDF optimization')
source=('git+https://github.com/kcroker/dpsprep.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    git -C "${srcdir}/${_gitname}" clean -fdx
}

build() {
    cd "${srcdir}/${_gitname}/"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_gitname}/"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m755 bin/dpsprep "$pkgdir/usr/bin/dpsprep"
    install -D -m755 dpsprep.1 "$pkgdir/usr/share/man/man1/dpsprep.1"
}
