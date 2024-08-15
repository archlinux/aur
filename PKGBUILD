# Maintainer: someone <6t551t29c at mozmail dot com>

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=python-libbs
epoch=
pkgver=1.18.1
pkgrel=00
pkgdesc='Your Only Decompiler API Lib - A generic API to script in and out of decompilers'
arch=(any)
url=https://github.com/binsync/libbs
license=(BSD-2-Clause)
depends=(python python-filelock python-ghidra-bridge python-jfx-bridge python-platformdirs python-prompt_toolkit python-psutil python-pycparser python-pyhidra python-setuptools python-toml python-tqdm)
depends+=(pyside6 python-pyqt5)
makedepends=(python-pip)
checkdepends=()
provides=()
conflicts=(${provides%=*}) # No quotes, to avoid an empty entry.
source=(PKGBUILD_EXTRAS)
md5sums=(SKIP)
noextract=()
source+=(https://files.pythonhosted.org/packages/de/7a/63e2b529ebdb3e17fb2a1c036f5ab8706c2aac3f7944903dd86b5a3db52d/libbs-1.18.1-py3-none-any.whl)
md5sums+=(e5747c2a6c0b0be812626771150692e7)
noextract+=(libbs-1.18.1-py3-none-any.whl)
source+=(LICENSE)
md5sums+=(f8866b44fd45600f9f8ba78ec2d6594e)

_first_source() {
    echo " ${source_i686[@]} ${source_x86_64[@]} ${source[@]}" |
        tr ' ' '\n' | grep -Pv '^(PKGBUILD_EXTRAS)?$' | head -1
}

_vcs="$(grep -Po '^[a-z]+(?=\+)' <<<"$(_first_source)")"
if [[ "$_vcs" ]]; then
    makedepends+=("$(pkgfile --quiet /usr/bin/$_vcs)")
    provides+=("${pkgname%-$_vcs}")
    conflicts+=("${pkgname%-$_vcs}")
fi

_is_wheel() {
    [[ $(_first_source) =~ \.whl$ ]]
}

if [[ _is_wheel &&
    $(basename "$(_first_source)" | rev | cut -d- -f1 | rev) =~ ^manylinux ]]; then
    options=(!strip) # https://github.com/pypa/manylinux/issues/119
fi

_dist_name() {
    find "$srcdir" -mindepth 1 -maxdepth 1 -type d -printf '%f
' |
        grep -v '^_tmpenv$'
}

if [[ $(_first_source) =~ ^git+ ]]; then
    _pkgver() {
        (
            set -o pipefail
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
    cd "$srcdir"
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
    # Use the latest version of pip, as Arch's version is historically out of
    # date(!) and newer versions do fix bugs (sometimes).
    python -mvenv --clear --system-site-packages _tmpenv
    _tmpenv/bin/pip --quiet install -U pip
    # Build the wheel (which we allow to fail) only after fetching the license.
    # In order to isolate from ~/.pydistutils.cfg, we need to set $HOME to a
    # temporary directory, and thus first $XDG_CACHE_HOME back to its real
    # location, so that pip inserts the wheel in the wheel cache.  We cannot
    # use --global-option=--no-user-cfg instead because that fully disables
    # wheels, causing a from-source build of build dependencies such as
    # numpy/scipy.
    XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}" HOME=_tmpenv \
        _tmpenv/bin/pip wheel -v --no-deps --wheel-dir="$srcdir" \
        "./$(_dist_name)" || true
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
    python -mvenv --clear --system-site-packages _tmpenv
    _tmpenv/bin/pip install --prefix="$pkgdir/usr" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(ls ./*.whl 2>/dev/null || echo ./"$(_dist_name)")"
    if [[ -d "$pkgdir/usr/bin" ]]; then # Fix entry points.
        for f in "$pkgdir/usr/bin/"*; do
            if [[ $(head -n1 "$f") = "#!$(readlink -f _tmpenv)/bin/python" ]]; then
                sed -i '1c#!/usr/bin/python' "$f"
            fi
        done
    fi
    if [[ -d "$pkgdir/usr/etc" ]]; then
        mv "$pkgdir/usr/etc" "$pkgdir/etc"
    fi
    if [[ -f LICENSE ]]; then
        install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

package() { _package; }

. "$(dirname "$BASH_SOURCE")/PKGBUILD_EXTRAS"

# Remove makedepends already in depends (which may have been listed for the
# first build, but autodetected on the second.
makedepends=($(printf '%s\n' "${makedepends[@]}" |
    grep -Pwv "^($(
        IFS='|'
        echo "${depends[*]}"
    ))$"))
: # Apparently ending with makedepends assignment sometimes fails.
