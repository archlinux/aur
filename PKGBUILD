# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=matrix-registration
pkgver=0.9.1
pkgrel=2

pkgdesc="Webapp for token based matrix registration"
url="https://github.com/ZerataX/matrix-registration"
arch=('any')
license=('MIT')

depends=('python-appdirs' 'python-flask' 'python-flask-sqlalchemy' 'python-flask-cors'
         'python-flask-httpauth' 'python-flask-limiter' 'python-waitress' 'python-alembic'
         'python-dateutil' 'python-yaml' 'python-requests' 'python-wtforms' 'systemd')
checkdepends=('python-parameterized')

source=("matrix-registration::git+https://github.com/ZerataX/matrix-registration.git"
	"matrix-registration.service")

sha256sums=('SKIP'
            '36b204dea08c49e2f02f82cd469a828c1f99742339a9f4b8dd4bf59dbe2f9c45')
install=matrix-registration.install

prepare() {
    cd $srcdir/matrix-registration
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
    done
    sed -i -e 's/~=/>=/g' setup.py
}

build() {
	cd $srcdir/$pkgname
	sed -i 's|"config"|"/etc/matrix-registration"|' setup.py
	sed -i -e '/psycopg2-binary/d' setup.py
	python setup.py build
}

check() {
	cd $srcdir/$pkgname
	PYTHONWARNINGS=ignore PYTHONPATH=build/lib python -m tests.test_registration -v
}

package() {
	install -Dm644 ${pkgname}.service "$pkgdir"/usr/lib/systemd/system/${pkgname}.service
	cd $srcdir/$pkgname
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build

	install -dm755 "$pkgdir"/etc/${pkgname}
	mv ${pkgdir}/usr/{alembic,alembic.ini} ${pkgdir}/etc/${pkgname}
	sed -i -e "s|script_location = alembic|script_location = /etc/${pkgname}/alembic/|" ${pkgdir}/etc/${pkgname}/alembic.ini
}
