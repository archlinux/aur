# Maintainer: Unknown Packager

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=ytrssil
pkgver=0.5.0
pkgrel=0
pkgdesc='Subscribe to YouTube RSS feeds and keep track of watched videos'
arch=(any)
url=https://pypi.org/project/ytrssil/
license=(BSD)
depends=(python python-inject python-requests)
makedepends=(python-pip)
source=(https://files.pythonhosted.org/packages/18/65/c79b06ce443955e83b4df1abfe316d7ac1da53d5ab5e0c37b5353a838b6f/ytrssil-0.5.0-py3-none-any.whl)
sha256sums=(4a9299f7233035964a18e02986b666175287eac0e1faadf6415b0ff16d6ef8c4)
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
