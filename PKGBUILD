# vim: set filetype=sh:
# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>

pkgbase=python-jedihttp-git
pkgname=(python-jedihttp-git python2-jedihttp-git)
pkgver=r164.db3d083
pkgrel=1
pkgdesc="Simple http wrapper around jedi (with yan12125's packaging patch)"
license=('Apache')
arch=('any')
url='https://github.com/vheon/JediHTTP'
makedepends=('python-setuptools' 'python2-setuptools' 'git')
source=('git+https://github.com/vheon/JediHTTP'
        'setup.py'
        'allow-missing-vendor.patch')
sha256sums=('SKIP'
            '6454c24288fad1a79ed0b3c7fa70902b87084384037ce5edab5be4eb4e4138d1'
            '896bde3c60bc31b566a410ddf93161ecec61affea370eb5d3bcdcfbde551ee02')

pkgver() {
  cd "$srcdir/JediHTTP"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd "${srcdir}/JediHTTP"
    patch -i ../allow-missing-vendor.patch -p1
    ln -sf ../setup.py
    mv jedihttp{,-main}.py
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
