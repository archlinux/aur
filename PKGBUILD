# Maintainer: Florian Schweikert <kelvan@ist-total.org>
# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_gitname=dput-ng
pkgname="${_gitname}-git"
pkgver=1.44.r0.ga051387
pkgrel=1
pkgdesc='Like dput but better'
url='https://salsa.debian.org/debian/dput-ng'
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-sphinx'
    'python-wheel'
)
depends=(
    'distro-info'
    'python'
    'python-debian'
    'python-jsonschema'
    'python-paramiko'
    'python-pyxdg'
)
optdepends=(
    'hy: Hy support'
    'clojure: Clojure support'
)
license=('GPL-2.0-or-later')
arch=('any')
provides=('dput')
conflicts=('dput')
source=(
    "git+https://salsa.debian.org/debian/${_gitname}.git"
    "0001-xdg-import.patch"
)
b2sums=('SKIP'
	'b65e2c06fee5d2c25cacfbcf901c26176cd205664113e408f6d1e20859c37253cd43bb21d9387b1a429b8376be0764415692c63658bf26ba13fd5ad0f05f4c65')

pkgver()
{
    cd "${srcdir}/${_gitname}"
    git describe --long --abbrev=7 --tags | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/^debian\///'
}

prepare()
{
    cd "${srcdir}/${_gitname}"
    patch --forward --strip=1 --input=../0001-xdg-import.patch
}

build()
{
    cd "${srcdir}/${_gitname}"
    python -m build --wheel --no-isolation
    cd docs
    make man
}

package()
{
    cd "${srcdir}/${_gitname}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # Binaries
    install -Dm755 bin/dcut "${pkgdir}/usr/bin/dcut"
    install -Dm755 bin/dirt "${pkgdir}/usr/bin/dirt"
    install -Dm755 bin/dput "${pkgdir}/usr/bin/dput"

    # Config
    find skel/metas -exec install -Dm644 {} --target-directory="${pkgdir}/etc/dput.d/" \;
    find skel/profiles -exec install -Dm644 {} --target-directory="${pkgdir}/etc/dput.d/" \;

    find skel/hooks -exec install -Dm644 {} --target-directory="${pkgdir}/usr/share/dput-ng/" \;
    find skel/commands -exec install -Dm644 {} --target-directory="${pkgdir}/usr/share/dput-ng/" \;
    find skel/interfaces -exec install -Dm644 {} --target-directory="${pkgdir}/usr/share/dput-ng/" \;
    find skel/uploaders -exec install -Dm644 {} --target-directory="${pkgdir}/usr/share/dput-ng/" \;
    find skel/schemas -exec install -Dm644 {} --target-directory="${pkgdir}/usr/share/dput-ng/" \;
    find skel/codenames -exec install -Dm644 {} --target-directory="${pkgdir}/usr/share/dput-ng/" \;

    # Docs
    install -Dm644 docs/_build/man/dput.1 "${pkgdir}/usr/share/man/man1/dput.1"
}
