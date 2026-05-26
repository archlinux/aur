# Maintainer: Your Name <you@example.com>
pkgname=bottles-bin
pkgver=63.2
pkgrel=1
pkgdesc="Run Windows applications with Wine – user‑friendly GUI"
arch=('any')
url="https://github.com/bottlesdevs/bottles"
license=('GPL-3.0')
depends=('python' 'python-pip' 'wine' 'glib2' 'gtk3' 'gobject-introspection')
makedepends=('git' 'python-setuptools')
conflicts=('bottles')
provides=('bottles')
source=("git+https://github.com/bottlesdevs/bottles.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/bottles"
    python -m pip install --no-deps --ignore-installed \
        --target="${srcdir}/staging" .
}

package() {
    cd "$srcdir/staging"
    PYDIR="/usr/lib/python$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')/site-packages"
    install -dm755 "${pkgdir}${PYDIR}"
    cp -a . "${pkgdir}${PYDIR}/"

    install -Dm644 "$srcdir/bottles/data/bottles.desktop" \
        "${pkgdir}/usr/share/applications/bottles.desktop"
    for sz in 16 32 48 64 128 256; do
        if [[ -f "$srcdir/bottles/data/icons/hicolor/${sz}x${sz}/apps/bottles.png" ]]; then
            install -Dm644 "$srcdir/bottles/data/icons/hicolor/${sz}x${sz}/apps/bottles.png" \
                "${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/bottles.png"
        fi
    done

    install -Dm755 "$srcdir/bottles/bottles.py" "${pkgdir}/usr/bin/bottles"
    sed -i '1 s|^|#!/usr/bin/env python\n|' "${pkgdir}/usr/bin/bottles"
}
