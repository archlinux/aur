# Maintainer: jopejoe1 <johannes@joens.email>

pkgname=python-statmake
pkgver=0.6.0
pkgrel=1
pkgdesc='Applies STAT information from a Stylespace to a variable font.'
arch=(any)
url=https://github.com/daltonmaag/statmake
license=(MIT)
depends=(python python-attrs python-cattrs python-fonttools-git)
source=(https://files.pythonhosted.org/packages/85/86/beef05605ca6d316906406151cc2b8969fe92d8e24f78bb7850bd42c38bc/statmake-0.6.0-py3-none-any.whl)
md5sums=(73c7e00002f9da61bac8d07c1c714cea)
noextract=(statmake-0.6.0-py3-none-any.whl)


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
