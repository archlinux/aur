# Maintainer: taotieren <admin@taotieren.com>

pkgbase=dsview-arinc429-decoder-git
pkgname=dsview-arinc429-decoder-git
pkgver=r28.d19f65c
pkgrel=1
pkgdesc="Decoder (ARINC 429) plugin for DSView"
arch=(any)
url="https://github.com/Aleksandr-Kai/DSView_ARINC429_Decoder"
license=(GPL-2.0-or-later)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    python
)
makedepends=(
    git
)
optdepends=(
    "dsview: GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc"
)
# backup=()
# options=('!lto' '!debug')
# install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -vDm0644 pd.py -t ${pkgdir}/usr/share/libsigrokdecode4DSL/decoders/arinc429
    install -vDm0644 /dev/stdin ${pkgdir}/usr/share/libsigrokdecode4DSL/decoders/arinc429/__init__.py <<EOF
from .pd import Decoder
EOF
    install -vDm0644 *.md -t ${pkgdir}/usr/share/doc/${pkgname}/
    cp -rv screenshots ${pkgdir}/usr/share/doc/${pkgname}/
    # install -vDm0644 LICENSE* -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
