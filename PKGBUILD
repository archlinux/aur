# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=formiko
pkgver=2.0.0
pkgrel=1
pkgdesc="reStructuredText editor and live previewer"
url="https://formiko.zeropage.cz"
license=('BSD-3-Clause')
arch=('any')
makedepends=('python-setuptools>=64'
             'python-build'
             'python-installer'
             'python-docutils')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-gobject'
              'gtksourceview5'
              'libadwaita'
              'webkitgtk-6.0')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/ondratu/formiko/archive/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2092f452f8959acac8caadf4c7eabe8a37c082c540abdcb962c2f428fc1e96d9')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${pkgname}-${pkgver}

    PYTHONPATH="." pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package() {
    depends=('gobject-introspection-runtime'
             'gtk4' 'gtksourceview5' 'libspelling'
             'libadwaita'
             'hicolor-icon-theme'
             'python-docutils'
             'python-jsonpath-ng' 'python-gobject'
             'webkitgtk-6.0')
    optdepends=('vte: neovim support'
                'python-pygments: for syntax color in html output code blocks')
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
