# Maintainer: Unknown Packager

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=ytrssil
pkgver=0.6.1
pkgrel=0
pkgdesc='Subscribe to YouTube RSS feeds and keep track of watched videos'
arch=(any)
url=https://pypi.org/project/ytrssil/
license=(BSD)
depends=(python python-inject python-requests)
makedepends=(python-pip)
source=(https://files.pythonhosted.org/packages/c9/de/85846eef740e20e72a86d86c0f19f5edafc8ea42573630442adb054378c5/ytrssil-0.6.1-py3-none-any.whl)
sha256sums=(7ebe9df2f08ba9e11c60a8345f9c2c0c2ebbc5d3d07e2a51104061c067679d42)
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
