# Maintainer: jopejoe1 <johannes@joens.email>

pkgname=python-font-v
pkgver=2.1.0
pkgrel=1
pkgdesc='Font version reporting and modification tool'
arch=(any)
url=https://github.com/source-foundry/font-v
license=(MIT)
depends=(python python-fonttools-git python-gitpython)
source=(https://files.pythonhosted.org/packages/12/17/798e9cdc4bc0e30bd98141f97a50a3f7ee6d6e99e95f14a0760f84cedc3b/font_v-2.1.0-py3-none-any.whl)
md5sums=(1f20c239cdfab1bb93344ce854f7acc7)
noextract=(font_v-2.1.0-py3-none-any.whl)

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
