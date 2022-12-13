# Maintainer: jopejoe1 <johannes@joens.email>

pkgname=python-hyperglot
pkgver=0.4.4
pkgrel=1
pkgdesc='Detect language support for font binaries'
arch=(any)
url=https://github.com/rosettatype/hyperglot
license=(GPL3)
depends=(python python-click python-colorlog python-fonttools-git python-yaml python-unicodedata2)
source=(https://files.pythonhosted.org/packages/59/4d/344eeb1c75e8a95669aa5d71f1bfb820e9e70f4bde19aa80a13dc2651881/hyperglot-0.4.4-py3-none-any.whl)
md5sums=(125b6ed512a15bc537d683609c15f8de)
noextract=(hyperglot-0.4.4-py3-none-any.whl)

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
    if [[ -f LICENSE ]]; then
        install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
