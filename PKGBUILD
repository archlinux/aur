# vim: set filetype=sh:
# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>

pkgbase=python-jedihttp-git
pkgname=(python-jedihttp-git python2-jedihttp-git)
pkgver=r178.d283a73
pkgrel=3
pkgdesc="Simple http wrapper around jedi (with yan12125's packaging patch)"
license=('Apache')
arch=('any')
url='https://github.com/vheon/JediHTTP'
makedepends=('python-setuptools' 'python2-setuptools' 'git'
             'python2-bottle' 'python2-jedi' 'python2-waitress'
             'python-bottle' 'python-jedi' 'python-waitress')
# See test_requirements.txt for checkdepends
checkdepends=(
    'python-tox'
    # XXX: webtest and coverage are installed by tox anyway as jedihttp requires older versions for them,
    # while the nosetests command uses globally-installed packages
    'python2-flake8' 'python2-nose' 'python2-webtest' 'python2-pyhamcrest' 'python2-requests' 'python2-coverage'
    'flake8' 'python-nose' 'python-webtest' 'python-pyhamcrest' 'python-requests' 'python-coverage'
    # Missing packages. They are not necessary for packaging as we don't run flake8 tests in check().
    # 'python2-pep8-naming'
    # 'python-pep8-naming'
    )
source=('git+https://github.com/vheon/JediHTTP'
        'setup.py'
        'allow-missing-vendor.patch')
sha256sums=('SKIP'
            '1008eeddf02def5a41d3200124f407e96a2f5085da5676080d33334b352130ac'
            'dc8be481565b3276b6c30449ea9f31dc4fb3d8d1f760cf10728fe1910bf622b5')

pkgver() {
  cd "$srcdir/JediHTTP"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd "${srcdir}/JediHTTP"
    patch -Np1 -F0 -i ../allow-missing-vendor.patch
    ln -sf ../setup.py
}

check() {
    cd "${srcdir}/JediHTTP"

    tox -vv -e py27 --sitepackages
    tox -vv -e py36 --sitepackages
}

package_python-jedihttp-git() {
    depends=('python-bottle' 'python-jedi' 'python-waitress')
    conflicts=('python2-jedihttp-git')

    cd "${srcdir}/JediHTTP"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-jedihttp-git() {
    depends=('python2-bottle' 'python2-jedi' 'python2-waitress')
    conflicts=('python-jedihttp-git')

    cd "${srcdir}/JediHTTP"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
