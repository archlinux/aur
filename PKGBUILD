# Maintainer: jopejoe1 <johannes@joens.email>
pkgname=python-picosvg
pkgver=0.20.6
pkgrel=1
pkgdesc='Exploratory utility for svg simplification, meant for use playing with COLR fonts'
arch=(any)
url=https://pypi.org/project/picosvg/
license=(Apache)
depends=(python python-absl python-lxml python-skia-pathops)
source=(https://files.pythonhosted.org/packages/51/e0/46dfde716674e4442245c1150668b5fce2a5addb09595c06ed7ea1860620/picosvg-0.20.6-py3-none-any.whl)
md5sums=(1917a547a95ea283784439eab36e86df)
noextract=(picosvg-0.20.6-py3-none-any.whl)

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
