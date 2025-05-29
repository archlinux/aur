# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=nvidia-mft
pkgver=4.32.0
pkgverrel=120
pkgversarch="${pkgver}-${pkgverrel}-$(uname -m)"
pkgrel=1
epoch=
pkgdesc="NVIDIA Mellanox firmware tools (MFT)"
arch=(x86_64)
url="https://network.nvidia.com/products/adapter-software/firmware-tools/"
license=('custom')
groups=()
depends=(dkms usbutils python)
makedepends=()
checkdepends=()
optdepends=(linux-firmware-mellanox rdma-core linux-headers linux-lts-headers)
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://www.mellanox.com/downloads/MFT/mft-${pkgversarch}-rpm.tgz")
noextract=()
sha256sums=('3036a8b560f8726d5171d753b5afa9bed5088cb3982134a47388f85eb3d69894')
validpgpkeys=()

package() {
    (cd mft-${pkgversarch}-rpm/SDEBS && \
	 bsdtar -xf kernel-mft-dkms_*.deb)
    for rpm in "mft-${pkgversarch}-rpm/RPMS"/*.rpm \
            mft-${pkgversarch}-rpm/SDEBS/data.tar.xz; do
	bsdtar -C "$pkgdir" -xpf "$rpm"
    done

    cd "$pkgdir"
    sed -ie 's/(arch)/(uname -m)/' usr/src/kernel-mft-dkms-*/dkms.conf
    rm -rf usr/lib
    mv usr/lib64 usr/lib
}
