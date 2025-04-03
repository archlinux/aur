# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Lucki <https://aur.archlinux.org/account/Lucki/>
# Contributor: Johan Reitan (venatux) <johan.reitan@gmail.com>
# Contributor: Kenneth Lyons (ixjlyons) <ixjlyons@gmail.com>

pkgname=python-poppler-qt5
pkgver=0.75.0
pkgrel=6
pkgdesc='Python binding to libpoppler-qt5'
arch=('any')
url="https://github.com/frescobaldi/$pkgname"
license=('LGPL')
depends=('python-pyqt5-sip4' 'poppler-qt5')
makedepends=('python-sip4' 'sip4' 'python-setuptools')
source=("https://github.com/frescobaldi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('92e6bd8f4ce90ba4e3e0c2ada026b643481ba1b109d45e8fdbdaedca8416a995')

build() {
    cd "$pkgname-$pkgver"
    # std::optional requires C++17
    sed -i '/extra_compile_args/s/-std=c++11/-std=c++17/' setup.py
    # python setup.py build
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    python setup.py build_ext --pyqt-sip-dir="$site_packages"/PyQt5/bindings/
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}
