# Maintainer: Unknown Packager

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=ytrssil
epoch=
pkgver=0.1.0
pkgrel=0
pkgdesc='Subscribe to YouTube RSS feeds and keep track of watched videos'
arch=(any)
url=https://pypi.org/project/ytrssil/
license=(BSD)
depends=(python python-feedparser python-inject python-aiohttp)
makedepends=(python-pip)
source=(https://files.pythonhosted.org/packages/78/61/92465df4022c302940ed648f98b26cac91975b4650dea9d102f1de91edbc/ytrssil-0.1.0-py3-none-any.whl)
md5sums=(80de3aba87ed30f000f7f46804a65571)
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
