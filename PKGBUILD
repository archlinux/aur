# Maintainer: Unknown Packager

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=inkcut
epoch=
pkgver=2.1.0
pkgrel=00
pkgdesc='An application for controlling 2D plotters, cutters, engravers, and CNC machines.'
arch=(any)
url=https://github.com/codelv/inkcut/
license=(custom:GPLv3)
depends=(python python-enaml python-pycups python-pyqt5 python-pyserial python-lxml python-jsonpickle python-pyqtgraph python-enamlx python-qtconsole python-qt5reactor python-twisted)
## EXTRA_DEPENDS ##
makedepends=(python-pip)
checkdepends=()
provides=()
conflicts=(${provides%=*})  # No quotes, to avoid an empty entry.
source=(PKGBUILD_EXTRAS)
sha384sums=(SKIP)
source+=(https://files.pythonhosted.org/packages/f5/f2/76b5ff7cba74764d18fa0b0ca57a4009c35d6f227fe8f6dd95ea52647947/inkcut-2.1.0-py2.py3-none-any.whl)
sha384sums+=(f66ec4d46d21270a588b9647494d0475075dae5e12f2c1c18c1abfb45187ad997d07ca7df666568cb3a009b810a9b98e)
noextract=(inkcut-2.1.0-py2.py3-none-any.whl)
source+=(LICENSE)
sha384sums+=(4f601fed19eafc4d21f8f514b614ce87d150bc22c5eef55a2d82819b7e444635420281e80712b9595a0d0a7fa5e9095d)
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

_build() {
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

build() { _build; }

_check() {
    # Define check(), possibly using _check as a helper, to run the tests.
    # You may need to call `python setup.py build_ext -i` first.
    if _is_wheel; then return; fi
    cd "$srcdir/$(_dist_name)"
    /usr/bin/python setup.py -q test
}

_package() {
    cd "$srcdir"
    # pypa/pip#3063: pip always checks for a globally installed version.
    /usr/bin/pip --quiet install --root="$pkgdir" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(ls ./*.whl 2>/dev/null || echo ./"$(_dist_name)")"
    if [[ -f LICENSE ]]; then
        install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

package() { _package; }

. "$(dirname "$BASH_SOURCE")/PKGBUILD_EXTRAS"
