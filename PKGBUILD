# Maintainer: Unknown Packager

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=ytrssil
pkgver=0.5.2
pkgrel=0
pkgdesc='Subscribe to YouTube RSS feeds and keep track of watched videos'
arch=(any)
url=https://pypi.org/project/ytrssil/
license=(BSD)
depends=(python python-inject python-requests)
makedepends=(python-pip)
source=(https://files.pythonhosted.org/packages/34/83/05a6041078752623c85f3e6c118dc8fd0e46951cc314b54d5553016ce9b7/ytrssil-0.5.2-py3-none-any.whl)
sha256sums=(903b2b63aea507da75e036193ecdac574149fad1faccb9ea9f8cc3111fc49c39)
noextract=(${pkgname}-${pkgver}-py3-none-any.whl)

_dist_name() {
    find "$srcdir" -mindepth 1 -maxdepth 1 -type d -printf '%f ' | grep -v '^_tmpenv$'
}

package() {
    cd "$srcdir"
    # pypa/pip#3063: pip always checks for a globally installed version.
    python -mvenv --clear --system-site-packages _tmpenv
    _tmpenv/bin/pip install --prefix="$pkgdir/usr" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(ls ./*.whl 2>/dev/null || echo ./"$(_dist_name)")"
    if [[ -d "$pkgdir/usr/bin" ]]; then  # Fix entry points.
        for f in "$pkgdir/usr/bin/"*; do
            if [[ $(head -n1 "$f") = "#!$(readlink -f _tmpenv)/bin/python" ]]; then
                sed -i '1c#!/usr/bin/python' "$f"
            fi
        done
    fi
    if [[ -d "$pkgdir/usr/etc" ]]; then
        mv "$pkgdir/usr/etc" "$pkgdir/etc"
    fi
}
