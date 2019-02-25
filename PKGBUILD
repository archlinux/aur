# Maintainer: Matt Kline <matt[at]bitbashing[d0t]io>
pkgname=python2-backblaze-b2
pkgver=1.3.8
pkgrel=2
# The Python 3 variants and CLI can be found in the backblaze-b2 AUR package.
pkgdesc="Backblaze B2 libraries for Python 2"
url="https://www.backblaze.com/b2/cloud-storage.html"
depends=('python2>=2.7'
         'python2-arrow>=0.8.0'
         'python2-logfury>=0.1.2'
         'python2-requests>=2.9.1'
         'python2-tqdm>=4.5.0'
         'python2-six>=1.10'
         'python2-futures>=3.0.5'
        )
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

# Need a better source URL at some point
source=("https://github.com/Backblaze/B2_Command_Line_Tool/archive/v${pkgver}.tar.gz")
sha512sums=('9c7bac5760693d4b6927db1b040896fd75b8f09072363a60d6201f97f88e2288d5c7f5b62afc69b62f5c9f910eddd5be38a97eeb9c3e29f5c9dc3be089a560d7')

build() {
    cd ${srcdir}/B2_Command_Line_Tool-${pkgver}
    sed -i -e 's:^\(arrow.*\),<0.12.1:\1:' requirements.txt
    python2 setup.py build
}

package() {
    cd ${srcdir}/B2_Command_Line_Tool-${pkgver}
    python2 setup.py build
    python2 setup.py install --root="$pkgdir" --optimize=1

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/

    # Only provide python libraries (e.g., for duplicity).
    # Let the backblaze-b2 package provide the CLI
    rm -rv ${pkgdir}/usr/bin
}

