# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=micropython-lib-git
pkgver=20150823
pkgrel=1
pkgdesc="Core Python libraries ported to MicroPythona"
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=()
makedepends=('git' 'python')
conflicts=('micropython-lib')
provides=('micropython-lib')
options=('!emptydirs')
source=('git://github.com/micropython/micropython-lib.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/micropython-lib"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "$srcdir/micropython-lib"
    make
}

package() {
    cd "$srcdir/micropython-lib"
    for _d in $(find -mindepth 1 -maxdepth 1 -type d); do
        if grep -qr 'import metadata' ./$_d/*; then
            error "Skipping $_d (bad import)"
            continue
        fi
        if [[ ! -f $_d/setup.py ]]; then
            error "Skipping $_d (no setup)"
            continue
        fi
        msg "Installing $_d"
        cd $_d
        python3 setup.py install --prefix=/usr --root="${pkgdir}" --install-lib='/usr/lib/micropython'
        cd ..
    done

    # micropython doesn't support pyc
    find "${pkgdir}" -name '*.pyc' -delete

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

