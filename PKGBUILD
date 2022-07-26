# Maintainer: JITHIN JOHNSON jithu7432 at gmail dot com 

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=nbviewer-gui
pkgver=1.0.4
pkgrel=00
pkgdesc='A Utility for previewing *.ipynb files in linux machines'
arch=(any)
url=https://github.com/jithu7432/nb-viewer
license=(MIT)
depends=(ipython jupyter-nbconvert jupyter-nbformat python-pyqt5-webengine)
makedepends=(python-pip python-wheel xdg-utils)
checkdepends=()
source=(PKGBUILD_EXTRAS)
md5sums=(SKIP)
noextract=()
source+=(https://files.pythonhosted.org/packages/ba/10/334ca62f0ba583d99843a512e0135bb35035e369ba5e08c7af5858337a0e/nbviewer_gui-1.0.4.tar.gz)
md5sums+=(8ec4a32c9879bd352304d49320b5f319)
source+=(LICENSE)
md5sums+=(c9f2d93db9b68e8b27f9f99080d177f5)

_first_source() {
    echo " ${source_i686[@]} ${source_x86_64[@]} ${source[@]}" |
        tr ' ' '\n' | grep -Pv '^(PKGBUILD_EXTRAS)?$' | head -1
}

_vcs="$(grep -Po '^[a-z]+(?=\+)' <<< "$(_first_source)")"
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
    options=(!strip)
fi

_dist_name() {
    find "$srcdir" -mindepth 1 -maxdepth 1 -type d -printf '%f
' |
        grep -v '^_tmpenv$'
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
    cd "$srcdir"
    local test_name
    if [[ ${license[0]} =~ ^(BSD|MIT|ZLIB|Python)$ ]]; then
        for test_name in LICENSE LICENSE.txt license.txt COPYING COPYING.md COPYING.rst COPYING.txt COPYRIGHT; do
            if cp "$srcdir/$(_dist_name)/$test_name" "$srcdir/LICENSE" 2>/dev/null; then
                break
            fi
        done
    fi
    python -mvenv --clear --system-site-packages _tmpenv
    _tmpenv/bin/pip --quiet install -U pip
    XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}" HOME=_tmpenv \
        _tmpenv/bin/pip wheel -v --no-deps --wheel-dir="$srcdir" \
        "./$(_dist_name)" || true
    xdg-desktop-menu install --novendor "$srcdir/$(_dist_name)/nbviewergui/notebook.desktop"
    xdg-icon-resource install --novendor --size 128 "$srcdir/$(_dist_name)/nbviewergui/notebook.png"
}

build() { _build; }

_check() {
    if _is_wheel; then return; fi
    cd "$srcdir/$(_dist_name)"
    /usr/bin/python setup.py -q test
}

_package() {
    cd "$srcdir"
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
    if [[ -f LICENSE ]]; then
        install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
package() { _package; }

. "$(dirname "$BASH_SOURCE")/PKGBUILD_EXTRAS"
makedepends=($(printf '%s\n' "${makedepends[@]}" |
               grep -Pwv "^($(IFS='|'; echo "${depends[*]}"))$"))
# :  # Apparently ending with makedepends assignment sometimes fails.
