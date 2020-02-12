# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=python-salt
epoch=
pkgver=3000
pkgrel=00
pkgdesc='Portable, distributed, remote execution and configuration management system'
arch=(any)
url=http://saltstack.org
license=('custom:Apache Software License 2.0')
depends=(python python-markupsafe python-pycrypto python-pyzmq python-requests python-msgpack python-jinja python-yaml)
## EXTRA_DEPENDS ##
makedepends=(python-distro python-pip python-wheel)
checkdepends=()
provides=()
conflicts=(${provides%=*} salt)  # No quotes, to avoid an empty entry.
source=(PKGBUILD_EXTRAS)
md5sums=(SKIP)
noextract=()
source+=(https://files.pythonhosted.org/packages/28/63/ad60e60c982810d55e23012e2359c96f92694842a476708f44e5d671a9b6/salt-3000.tar.gz)
md5sums+=(8084ef6f2a275b627ae364b9d562b4ff)
source+=(LICENSE)
md5sums+=(c996f5a78d858a52c894fa3f4bec68c1)

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

if [[ _is_wheel &&
      $(basename "$(_first_source)" | rev | cut -d- -f1 | rev) =~ ^manylinux ]]; then
    options=(!strip)  # https://github.com/pypa/manylinux/issues/119
fi

_dist_name() {
    find "$srcdir" -mindepth 1 -maxdepth 1 -type d -printf %f
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
    if [[ -d "$pkgdir/usr/etc" ]]; then
        mv "$pkgdir/usr/etc" "$pkgdir/etc"
    fi
    if [[ -f LICENSE ]]; then
        install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

package() { _package; }

. "$(dirname "$BASH_SOURCE")/PKGBUILD_EXTRAS"
