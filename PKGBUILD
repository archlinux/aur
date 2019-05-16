# Maintainer: Microoo <hu _AT_ m i c r o o o _DOT_ net>
pkgname=substratumnode-git
pkgver=0.4.6.r0.g811054ed
pkgrel=1
pkgdesc="SubstratumNode is the foundation of the decentralized SubstratumNetwork. SubstratumNodes work together to relay CORES packages and content on the network."
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/SubstratumNetwork/SubstratumNode"
license=('GPLv3')
depends=('rust' 'openssl' 'yarn')
provides=('substratumnode')
conflicts=('substratumnode')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}::git://github.com/SubstratumNetwork/SubstratumNode")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname}"
    sed -i 's/"${GPG_EXECUTABLE}" --/# "${GPG_EXECUTABLE}" --/' ci/release.sh
    sed -i 's/zip -j/# zip -j/' ci/release.sh
    ci/release.sh
}

package() {

    # Get the latest version tag
    _version=$(git -C "$srcdir/${pkgname}" describe --abbrev=0 --tags | sed 's/^v//')

    # Extract deb file
    bsdtar -xf "$srcdir/${pkgname}/node-ui/electron-builder-out/SubstratumNode_${_version}_amd64.deb"

    # Extract package data
    tar xf "data.tar.xz" -C "${pkgdir}"

}
