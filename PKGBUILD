# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Ainola
# Contributor: Ethan Schoonover

# shellcheck disable=SC2034
pkgname=gam-git
_pkgname=${pkgname%-git}
pkgver=7.30.00.r9.gdf75bb9
pkgrel=1
pkgdesc="command line management for Google Workspace"
arch=('any')
url="https://github.com/GAM-team/GAM"
license=('Apache-2.0')
replaces=('gamadv-xtd3')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
depends=('python>=3.10')
_branch=main

source=(
    "$pkgname::git+$url.git#branch=${_branch}"
    "gam.sh"
)

sha256sums=('SKIP'
            'f8613546b8d4a51f05342d3680553c20a2e0995c3be90e469f1da3bb83ca172e')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"

    install -d -m 0755 "$pkgdir/usr/share/$_pkgname"
    install -d -m 0755 "$pkgdir/usr/share/doc/$_pkgname"

    cp -a src/gam src/tools "$pkgdir/usr/share/$_pkgname/"
    cp -a wiki "$pkgdir/usr/share/doc/$_pkgname/"

    install -Dm755 \
        src/gam.py -t "$pkgdir/usr/share/$_pkgname"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 \
        src/gam.spec \
        src/gam.wxs \
        src/GamCommands.txt \
        src/GamUpdate.txt -t "$pkgdir/usr/share/$_pkgname"

    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md src/callgam.py "$pkgdir/usr/share/doc/$_pkgname"

    install -Dm755 ../gam.sh "$pkgdir/usr/bin/gam"
}
