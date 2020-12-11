# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=matrix-registration
pkgver=0.7.0
pkgrel=2

pkgdesc="Webapp for token based matrix registration"
url="https://github.com/ZerataX/matrix-registration"
arch=('any')
license=('MIT')

depends=('python-appdirs' 'python-flask' 'python-flask-sqlalchemy' 'python-flask-cors'
         'python-flask-httpauth' 'python-flask-limiter' 'python-waitress'
         'python-dateutil' 'python-yaml' 'python-requests' 'python-wtforms' 'systemd')
checkdepends=('python-parameterized')

source=("matrix-registration-$pkgver.tar.gz::https://github.com/ZerataX/matrix-registration/archive/v$pkgver.tar.gz"
	"https://github.com/ZerataX/matrix-registration/commit/fb9727e62c0631271c94d9b3a89e8205bb08ffc5.patch"
	"https://github.com/ZerataX/matrix-registration/commit/204a7cb69a632613c9c93d91665a806256d0a6f1.patch"
	"matrix-registration.service")

sha256sums=('19370d7a03338ec13fac426fb30d1b8a99ea2081cbbd986d03529f0f5bcf840a'
            'b7303997b31a85fbf8891f2b90153bd4bf59acbca05946801bd510260d960a8d'
            '3050a66f6bbc7344d3ab52e459a77ee09bd215b3c1732751144257f64a56f121'
            '2b58afe380dc186ec1cb38838f8f6b819a1cdf5b1e674492986c80f39ed22dfd')
install=matrix-registration.install

prepare() {
    cd $srcdir/matrix-registration-${pkgver/_rc/-rc}
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

build() {
	cd $pkgname-$pkgver
	sed -i 's|"config"|"/etc/matrix-registration"|' setup.py
	sed -i -e '/psycopg2-binary/d' setup.py
	python setup.py build
}

check() {
	cd $pkgname-$pkgver
	python -m tests.test_registration -v
}

package() {
	install -Dm644 ${pkgname}.service "$pkgdir"/usr/lib/systemd/system/${pkgname}.service

	cd $pkgname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build

	install -dm755 "$pkgdir"/etc/${pkgname}
}
