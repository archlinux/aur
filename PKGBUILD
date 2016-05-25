pkgname='holo'
pkgver=1.2.1
pkgrel=2
pkgdesc='Minimalistic configuration management'
arch=('i686' 'x86_64' 'armv7h')
url='http://holocm.org'
license=('GPL3')
depends=(
    'git' # holo uses git-diff for file diffs
)
makedepends=('go' 'perl')
provides=(
    "holo-files=${pkgver}" # required for holo-build packages that have a holo-files dependency when there are files below /usr/share/holo/files
    'HOLO_API_VERSION=3'
)
backup=(
    'etc/holorc'
)
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3022807aa09f1686fe2cdf9ae4f1897b43a90f5abc67bc0be720867facbf8fe9')

options=('!strip') # binaries are already stripped inside the Makefile

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's+xargs+xargs -r+' src/distribution-integration/alpm-hook.sh
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
