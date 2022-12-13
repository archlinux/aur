# Maintainer: jopejoe1 <johannes@joesn.email>

pkgname=python-nanoemoji
pkgver=0.15.1
pkgrel=1
pkgdesc='Compiler for color fonts'
arch=(any)
url=https://pypi.org/project/nanoemoji/
license=(Apache)
depends=(python python-absl python-fonttools-git python-lxml python-ninja python-picosvg python-pillow python-pngquant-cli python-regex python-resvg-cli python-toml python-ufo2ft python-ufolib2 python-zopfli python-importlib_resources)
source=(https://files.pythonhosted.org/packages/94/14/10c813f774a2aa6348c186d2ce0534374ec50aff96658c6ace4e56b7a715/nanoemoji-0.15.1-py3-none-any.whl)
md5sums=(07af07e2a2bc56029dcd73512fcd76e3)
noextract=(nanoemoji-0.15.1-py3-none-any.whl)

package() {
    cd "$srcdir"
    # pypa/pip#3063: pip always checks for a globally installed version.
    python -mvenv --clear --system-site-packages _tmpenv
    _tmpenv/bin/pip install --prefix="$pkgdir/usr" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(ls ./*.whl 2>/dev/null || echo ./"$(_dist_name)")"
    if [[ -d "$pkgdir/usr/bin" ]]; then  # Fix entry points.
        python="#!$(readlink -f _tmpenv)/bin/python"
        for f in "$pkgdir/usr/bin/"*; do
            # Like [[ "$(head -n1 "$f")" = "#!$(readlink -f _tmpenv)/bin/python" ]]
            # but without bash warning on null bytes in "$f" (if it is actually
            # a compiled executable, not an entry point).
            if python -c 'import os, sys; sys.exit(not open(sys.argv[1], "rb").read().startswith(os.fsencode(sys.argv[2]) + b"\n"))' "$f" "$python"; then
                sed -i '1c#!/usr/bin/python' "$f"
            fi
        done
    fi
    if [[ -d "$pkgdir/usr/etc" ]]; then
        mv "$pkgdir/usr/etc" "$pkgdir/etc"
    fi
}

