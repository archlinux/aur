pkgname=termtosvg-git
pkgver=0.9.0.r0.ge107277
pkgrel=1

pkgdesc='record terminal sessions as svg animations'
url='https://github.com/nbedos/termtosvg'
arch=('any')
license=('BSD')

depends=('python-pyte' 'python-lxml')
makedepends=('git' 'python-setuptools' 'pandoc')

provides=('termtosvg')
conflicts=('termtosvg')

source=('git+https://github.com/nbedos/termtosvg#branch=develop')

sha256sums=('SKIP')

pkgver() {
    cd termtosvg
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd termtosvg
    # There is a Makefile but seems to be intended as a development aid rather
    # than a build tool
    python setup.py build

    # Manually generate the man pages and skip the needless tarballing done in
    # the Makefile
    pandoc man/termtosvg.md -st man > man/termtosvg.man.1
    pandoc man/termtosvg-templates.md -st man > man/termtosvg-templates.man.5
}

check() {
    cd termtosvg
    python setup.py test
}

package() {
    cd termtosvg
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm0644 man/termtosvg.man.1 "$pkgdir"/usr/share/man/man1/termtosvg.1
    install -Dm0644 man/termtosvg-templates.man.5 "$pkgdir"/usr/share/man/man5/termtosvg-templates.5
    install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
