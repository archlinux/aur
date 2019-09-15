# Maintainer: Anti Räis antirais at gmail dot com

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=python-estnin
pkgver=1.0.1
pkgrel=1
pkgdesc='library for working with Estonian national identity numbers'
arch=(any)
url=https://github.com/antirais/estnin
license=(MIT)
depends=(python)
_name=${pkgname#python-}

## EXTRA_DEPENDS ##
makedepends=(python-pip)
checkdepends=()
provides=()
conflicts=(${provides%=*})  # No quotes, to avoid an empty entry.
source+=(https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py3-none-any.whl)
md5sums+=(677a7379437f260bf69053ad8c315d93)
noextract=("${source[@]##*/}")

package() {
    cd "$srcdir"

    # pypa/pip#3063: pip always checks for a globally installed version.
    /usr/bin/pip --quiet install --root="$pkgdir" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(ls ./*.whl 2>/dev/null || echo ./"$(_dist_name)")"

    if [[ -f LICENSE ]]; then
        install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
