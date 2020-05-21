# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=python-aspy-refactor-imports
epoch=
pkgver=2.1.1
pkgrel=0
pkgdesc='Utilities for refactoring imports in python-like syntax.'
arch=(any)
url=https://github.com/asottile/aspy.refactor_imports
license=(MIT)
depends=(python python-cached-property)
makedepends=(python-pip python-wheel)
checkdepends=()
provides=()
conflicts=(${provides%=*})  # No quotes, to avoid an empty entry.
md5sums=('98bea44fb46d7c3bba1ea52784c98307'
         'ec6e4db5d90408877624a1ff7086f824')
source=(https://files.pythonhosted.org/packages/21/cb/c1b7faffb5b802b6408f0957b39401a5bc95c989a0bf7c1965475d9cfb5e/aspy.refactor_imports-1.1.0.tar.gz
        LICENSE)

_first_source() {
    echo " ${source_i686[@]} ${source_x86_64[@]} ${source[@]}" |
        tr ' ' '\n' | grep -Pv '^(PKGBUILD_EXTRAS)?$' | head -1
}

if [[ $(_first_source) =~ ^git+ ]]; then
    provides+=("${pkgname%-git}")
    conflicts+=("${pkgname%-git}")
fi

_is_wheel() {
    [[ $(_first_source) =~ \.whl$ ]]
}

_dist_name() {
    basename "$(_first_source)" |
      sed 's/\(\.tar\.gz\|\.tgz\|\.tar\.bz2\|\.zip\|\.git\)$//'
}

if [[ $(_first_source) =~ ^git+ ]]; then
    _pkgver() {
        ( set -o pipefail
          cd "$srcdir/$(_dist_name)"
          git describe --long --tags 2>/dev/null |
            sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" \
              "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
    }

    pkgver() { _pkgver; }
fi

build() {
    if _is_wheel; then return; fi
    cd "$srcdir/$(_dist_name)"
    # See Arch Wiki/PKGBUILD/license.
    # Get the first filename that matches.
    local test_name
    if [[ ${license[0]} =~ ^(BSD|MIT|ZLIB|Python)$ ]]; then
        for test_name in LICENSE LICENSE.txt license.txt COPYING COPYING.md COPYING.rst COPYING.txt COPYRIGHT; do
            if cp "$srcdir/$(_dist_name)/$test_name" "$srcdir/LICENSE" 2>/dev/null; then
                break
            fi
        done
    fi
    # Build the wheel (which we allow to fail) only after fetching the license.
    /usr/bin/pip wheel -v --no-deps --wheel-dir="$srcdir" \
        --global-option=--no-user-cfg \
        --global-option=build --global-option=-j"$(nproc)" . ||
        true
}

_check() {
    # Define check(), possibly using _check as a helper, to run the tests.
    # You may need to call `python setup.py build_ext -i` first.
    if _is_wheel; then return; fi
    cd "$srcdir/$(_dist_name)"
    /usr/bin/python setup.py -q test
}

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
