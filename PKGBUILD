# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgbase=python-pyjade
pkgname=(python-pyjade python2-pyjade)
_commit=eb84811fcac898f678652f48b71479d95c3fbff8
pkgver=4.0.0
pkgrel=5
pkgdesc='Jade template system for Jinja2, Mako and Tornado'
license=('MIT')
arch=('any')
url='https://github.com/syrusakbary/pyjade'
makedepends=('git' 'python-setuptools' 'python-six'
             'python2-setuptools' 'python2-six')
checkdepends=('python-jinja' 'python-tornado' 'python-mako' 'python-nose'
              'python2-jinja' 'python2-tornado' 'python2-mako' 'python2-nose')
source=("git+$url#commit=$_commit"
        'no-django.patch')
sha256sums=('SKIP'
            '1f0ad5782b9055670e23b4f0514fcdf21701a827a0597134f79f2efc0f90c482')

prepare() {
    pushd pyjade
    # not compatible with Django >= 1.11 (https://github.com/syrusakbary/pyjade/issues/277)
    patch -Np1 -i ../no-django.patch
    # not compatible with pyramid >= 1.5
    sed -i '/pyramid/d' setup.py
    popd

    cp -r pyjade{,-py2}
}

check() {
    cd "$srcdir"/pyjade
    ./test.sh

    cd "$srcdir"/pyjade-py2
    ./test.sh
}

package_python-pyjade() {
    depends=('python-six')
    cd pyjade
    python setup.py install --root="$pkgdir" --optimize=1

    install -Ddm755 "$pkgdir"/usr/share/licenses/$pkgname
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python2-pyjade() {
    depends=('python2-six')
    cd pyjade-py2
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "$pkgdir"/usr/bin/pyjade{,2}

    install -Ddm755 "$pkgdir"/usr/share/licenses/$pkgname
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}
