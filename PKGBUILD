# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=matrix-registration-git
_pkgbase=matrix-registration
pkgver=r301.15044e5
pkgrel=1

pkgdesc="Webapp for token based matrix registration"
url="https://github.com/ZerataX/matrix-registration"
arch=('any')
license=('MIT')

depends=('python-appdirs' 'python-flask' 'python-flask-sqlalchemy' 'python-flask-cors'
         'python-flask-httpauth' 'python-flask-limiter' 'python-waitress' 'python-alembic'
         'python-dateutil' 'python-yaml' 'python-requests' 'python-wtforms' 'systemd')
checkdepends=('python-parameterized')
conflicts=('matrix-registration')
provides=('matrix-registration')
source=("matrix-registration::git+https://github.com/ZerataX/matrix-registration.git"
	"matrix-registration.service"
	"https://github.com/zeratax/matrix-registration/pull/99.patch")

sha256sums=('SKIP'
            '36b204dea08c49e2f02f82cd469a828c1f99742339a9f4b8dd4bf59dbe2f9c45')
install=matrix-registration.install

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
	cd $srcdir/$_pkgbase
	sed -i 's|"config"|"/etc/matrix-registration"|' setup.py
	sed -i -e '/psycopg2-binary/d' setup.py
	python setup.py build
}

check() {
	cd $srcdir/$_pkgbase
	PYTHONWARNINGS=ignore PYTHONPATH=build/lib python -m tests.test_registration -v
}

package() {
	install -Dm644 ${_pkgbase}.service "$pkgdir"/usr/lib/systemd/system/${_pkgbase}.service
	cd $srcdir/$_pkgbase

	python setup.py install --root "$pkgdir" --optimize=1 --skip-build

	install -dm755 "$pkgdir"/etc/${_pkgbase}
	mv ${pkgdir}/usr/{alembic,alembic.ini} ${pkgdir}/etc/${_pkgbase}
	sed -i -e "s|script_location = alembic|script_location = /etc/${_pkgbase}/alembic/|" ${pkgdir}/etc/${_pkgbase}/alembic.ini
}
sha256sums=('SKIP'
            '36b204dea08c49e2f02f82cd469a828c1f99742339a9f4b8dd4bf59dbe2f9c45'
            'fac0f957455b86bfc786a5f85ed6ac886ce19b2cfdbac616345d264bd2169044')
