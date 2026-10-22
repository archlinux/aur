# PKGBUILD

# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=beet-summarize-git
_pkgname=beet-summarize
pkgdesc='Summarize your beets library'
pkgver=r98.4d9ce21
pkgrel=2
url="https://github.com/steven-murray/$_pkgname"
arch=('any')
license=('LGPL-3.0-only')
makedepends=('git'
             'python-setuptools-scm'
             'python-build'
             'python-installer')
depends=('python>=3.14'
         'python<3.15'
         'beets>=1.5.0')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver()
{
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare()
{
    git -C "$srcdir"/"$_pkgname" clean -dfx
}

build()
{
    cd "$srcdir"/"$_pkgname"
    python -m build --wheel --no-isolation
}

package()
{
    cd "$srcdir"/"$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # beets owns the beetsplug namespace; drop the plugin's own __init__
    local site_packages
    site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm "$pkgdir""$site_packages"/beetsplug/__init__.py
    rm "$pkgdir""$site_packages"/beetsplug/__pycache__/__init__.*.pyc
}
