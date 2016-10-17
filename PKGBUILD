# Maintainer: Mark Huo <markhuomian at gmail dot com>
pkgname=git-repo
pkgver=1.7.4
pkgrel=2
pkgdesc="Tool for managing remote repositories from your git CLI!"
arch=('any')
url="https://github.com/guyzmo/git-repo"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("$pkgname-$pkgver.src.tar.gz::$url/archive/$pkgver.tar.gz"
        'requirements.txt.patch'
        'setup.py.patch')
sha1sums=('9818723314283ed1ce5663d08dc900c986ea5686'
          '4689336862b4e8db09d2ca8f78b79544e32f2e3b'
          '7ec358708c3250907e858028245351157bbb528c')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # bitbucket-api requires requests==2.2.1
    patch -Np2 -i "${srcdir}/requirements.txt.patch"
    # install requirements
    cp requirements.txt requirements-prod.txt
    patch -Np2 -i "${srcdir}/setup.py.patch"
}

package() {
    # update PYTHONPATH
    local python_version=$(python --version)
    local python_path="$pkgdir/usr/lib/python${python_version:7:3}/site-packages"
    mkdir -p "$python_path"
    export PYTHONPATH=$PYTHONPATH:"$python_path"
    # install with prefix
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --prefix="$pkgdir/usr" --optimize=1
}
