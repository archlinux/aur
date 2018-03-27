# Maintainer: NextHendrix <chris.jones.492@gmail.com>

pkgname=python-asteval
pkgver=0.9.12
pkgrel=1
pkgdesc='Safe, minimalistic evaluator of python expression using ast module'
arch=(any)
url=http://github.com/newville/asteval
license=(BSD)
depends=(python python-numpy python-six)
## EXTRA_DEPENDS ##
makedepends=(python-pip)
checkdepends=()
provides=()
conflicts=(${provides%=*})  # No quotes, to avoid an empty entry.
source=(https://pypi.python.org/packages/6f/6b/63b958aef9e2b155450d3059756e68d54ead0898b67a793a7ab79ccbbabd/asteval-0.9.12.tar.gz)
md5sums=(1db193c2c20f4ab41a2ea325940e7712)
source+=(LICENSE)
md5sums+=(d45ae5800909759cbaf63b457165e330)
if [[ ${source[0]} =~ ^git+ ]]; then
    provides+=("${pkgname%-git}")
    conflicts+=("${pkgname%-git}")
fi

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

_first_source() {
    echo " ${source_i686[@]} ${source_x86_64[@]} ${source[@]}" |
        tr -s ' ' | tail -c+2 | cut -d' ' -f1
}

_is_wheel() {
    [[ $(_first_source) =~ \.whl$ ]]
}

_dist_name() {
    basename "$(_first_source)" |
      sed 's/\(\.tar\.gz\|\.tgz\|\.tar\.bz2\|\.zip\|\.git\)$//'
}

if [[ $(_first_source) =~ ^git+ ]]; then
    pkgver() {
        ( set -o pipefail
          cd "$srcdir/$(_dist_name)"
          git describe --long --tags 2>/dev/null |
            sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" \
              "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
    }
fi

build() {
    if _is_wheel; then return; fi
    cd "$srcdir/$(_dist_name)"
    # See Arch Wiki/PKGBUILD/license.
    # Get the first filename that matches.
    local test_name
    if [[ ${license[0]} =~ ^(BSD|MIT|ZLIB|Python)$ ]]; then
        for test_name in LICENSE LICENSE.txt license.txt COPYING.md COPYING.rst COPYING.txt COPYRIGHT; do
            if cp "$srcdir/$(_dist_name)/$test_name" "$srcdir/LICENSE" 2>/dev/null; then
                break
            fi
        done
    fi
    # Build the wheel (which can fail) only after fetching the license.
    pip wheel -v --no-deps --wheel-dir="$srcdir" \
        --global-option=build --global-option=-j"$(nproc)" . ||
        true
}

check() {
    # Remove the first line line to run tests.
    # You may need to call `python setup.py build_ext -i` first.
    return 0
    if _is_wheel; then return; fi
    cd "$srcdir/$(_dist_name)"
    python setup.py -q test
}

package() {
    cd "$srcdir"
    # pypa/pip#3063: pip always checks for a globally installed version.
    pip --quiet install --root="$pkgdir" --no-deps --ignore-installed \
        "$(ls ./*.whl 2>/dev/null || echo ./"$(_dist_name)")"
    if [[ -f LICENSE ]]; then
        install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
