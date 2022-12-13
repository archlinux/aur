# Maintainer: jopejoe1 <johannes@joens.email>
pkgname=python-bumpfontversion
pkgver=0.4.1
pkgrel=1
pkgdesc='Bumps the version of a font source file'
arch=(any)
url=https://pypi.org/project/bumpfontversion/
license=(Apache)
depends=(python python-bump2version python-fonttools-git python-glyphslib python-openstep-plist python-ufolib2 python-fonttools)
source=(https://files.pythonhosted.org/packages/69/2a/904c0918652ec6fa1b611e23b0ea33029e8e740190b255d8516c593fc1b5/bumpfontversion-0.4.1-py3-none-any.whl)
noextract=(bumpfontversion-0.4.1-py3-none-any.whl)
md5sums=(858d4a99e49fdba04f242854a84c904e)

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
