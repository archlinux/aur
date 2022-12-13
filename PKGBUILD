# Maintainer: jopejoe1 <johannes@joens.email>
pkgname=python-bump2version
pkgver=1.0.1
pkgrel=1
pkgdesc='Version-bump your software with a single command!'
arch=(any)
url=https://github.com/c4urself/bump2version
license=(MIT)
depends=(python )
source=(https://files.pythonhosted.org/packages/1d/e3/fa60c47d7c344533142eb3af0b73234ef8ea3fb2da742ab976b947e717df/bump2version-1.0.1-py2.py3-none-any.whl)
md5sums=(9735698e470af816b0ac7f9f149ac8a1)
noextract=(bump2version-1.0.1-py2.py3-none-any.whl)

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
