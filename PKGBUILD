pkgname=foremkacad-bin
pkgver=0.3.67
pkgrel=1
pkgdesc='Foremka CAD - 3D parametric CAD/CAM application'
arch=('x86_64')
url='https://foremkacad.pl'
license=('custom')
depends=('glibc')
makedepends=('libarchive')
provides=('foremkacad')
conflicts=('foremkacad')
options=('!strip')

source=("Foremka-${pkgver}-linux-amd64.deb::https://foremkacad.pl/desktop/Foremka-${pkgver}-linux-amd64.deb")
sha256sums=('16289579d0285d9aa0f85c431a77d23edd56c794a7275384dc8844563c975db0')

package() {
    local data_tar

    # Extract Debian archive
    mkdir -p "${srcdir}/deb"
    bsdtar -xf "${srcdir}/Foremka-${pkgver}-linux-amd64.deb" \
        -C "${srcdir}/deb"

    # Locate payload
    data_tar=$(find "${srcdir}/deb" -maxdepth 1 \
        -type f -name 'data.tar.*' -print -quit)

    if [[ -z "$data_tar" ]]; then
        error 'Could not find data.tar.* in Debian package'
        return 1
    fi

    # Install package contents
    bsdtar -xf "$data_tar" -C "$pkgdir"

    # Normalize ownership
    chown -R 0:0 "$pkgdir"
}
