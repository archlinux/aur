# Maintainer: Jeffrey Bouter <jb@warpnet.nl>

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=salt-lint
epoch=
pkgver=0.5.2
pkgrel=00
pkgdesc='A command-line utility that checks for best practices in SaltStack.'
arch=(any)
url=https://github.com/warpnet/salt-lint
license=(MIT)
depends=(python python-six python-pyaml python-pathspec)
## EXTRA_DEPENDS ##
makedepends=(python-pip python-distro python-wheel)
checkdepends=()
provides=()
conflicts=(${provides%=*})  # No quotes, to avoid an empty entry.
source=(PKGBUILD_EXTRAS)
sha256sums=(SKIP)
noextract=()
source+=(https://files.pythonhosted.org/packages/b6/0b/3970a2770097b2399dd02232a0173bf5642e2f0235fb4ae7b5ed2e185bac/salt_lint-0.5.2-py3-none-any.whl)
sha256sums+=(464c3a8c096b4eca9fbcf003c79c62c39bf1444c94b8c1ac270f1e6e0d4ecf98)
noextract+=(salt_lint-0.5.2-py3-none-any.whl)
source+=(LICENSE)
sha256sums+=(0aa56ec10b6c3f24385b7c684e61520fc24b1d913c3618b54ed5eead5655e552)

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
