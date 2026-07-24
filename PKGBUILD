# Maintainer: Rippa The Hutt <iacoporippagmail@duck.com>

pkgname=mcomix3
pkgver=3.6.1
pkgrel=1
pkgdesc="A user-friendly, customizable comic book image viewer (Python 3 / GTK3 port)"
arch=('any')
url="https://github.com/rippa-the-hutt/mcomix3"
license=('GPL2')
depends=(
    'python-setuptools'
    'python'
    'python-gobject'
    'gtk3'
    'python-pillow'
)
optdepends=(
    'unrar: for CBR/RAR archive support'
    'p7zip: for 7Zip archive support'
    'lha: for LHA/LZA archive support'
    'mupdf-tools: for PDF support'
)
makedepends=(
    'desktop-file-utils'
    'shared-mime-info'
)
source=("MComix3_v${pkgver}.tar.gz::https://github.com/rippa-the-hutt/mcomix3/releases/download/v${pkgver}/MComix3_v${pkgver}.tar.gz")
sha256sums=('ecfec97901746257213e723d214477295db351ad96120ac4a725fb664ee87cbc')

package() {
    cd "${srcdir}/MComix3_v${pkgver}"

    # Install the Python package
    python3 setup.py install \
        --single-version-externally-managed \
        --root="${pkgdir}" \
        --prefix=/usr \
        --record="${pkgdir}/mcomix3-files.txt" \
        --optimize=1

    # Create a wrapper script that works better with PATH
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mcomix3" << 'EOF'
#!/bin/sh
exec /usr/bin/python3 /usr/share/mcomix3/mcomixstarter.py "$@"
EOF

    # Install the mcomixstarter.py as an alternative entry point
    install -Dm755 "${srcdir}/MComix3_v${pkgver}/mcomixstarter.py" \
        "${pkgdir}/usr/share/${pkgname}/mcomixstarter.py"

    # Update desktop database (post-install)
    # Update MIME database (post-install)
}

post_install() {
    set -e
    # Update desktop file database
    if command -v update-desktop-database &>/dev/null; then
        update-desktop-database -q
    fi
    # Update MIME database
    if command -v update-mime-database &>/dev/null; then
        update-mime-database /usr/share/mime &>/dev/null || true
    fi
    # Update icon cache
    if command -v gtk-update-icon-cache &>/dev/null; then
        gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor &>/dev/null || true
    fi
}

post_upgrade() {
    post_install
}

# vim: ts=2 sw=2 et:
