# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# This package exists because the tp_smapi-dkms package does not override
# the kernel's default hdaps module, causing the accelerometer to not work.

pkgname=dkms-tp_smapi-debian
_debian_rel=1
pkgver=0.41
pkgrel=1
epoch=1
pkgdesc="ThinkPad Configuration Tools for Linux"
# Compiled modules are arch-dependant, but the package isn't
arch=(any)
url="http://tpctl.sourceforge.net/"
license=(GPL)
depends=(dkms)
provides=("tp_smapi-dkms=${pkgver}" "tp_smapi=${pkgver}")
conflicts=(tp_smapi-dkms tp_smapi)
install=tp_smapi.install
source=("http://cloud.github.com/downloads/evgeni/tp_smapi/tp_smapi-${pkgver}.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/t/tp-smapi/tp-smapi_${pkgver}-${_debian_rel}.diff.gz")
noextract=("tp_smapi-${pkgver}.tar.gz")
sha512sums=('924a11cdf64bc151d069d4f61ca476cf006773291f363b21a80ce091f560a78c4828d2e522e646a5b133c58149a37cb5c2432a165e92e6980eb510b9488c728e'
            '2008df7bbde0767090fe0436fee4d8f8a04c443eb8f5b5cb027a5eda80e2bd40f776f50b14ee8647dafc7c65b621864752801606bdf7e43c5bd4229608bfff5e')

prepare() {
  patch -p1 -i "tp-smapi_${pkgver}-${_debian_rel}.diff"
}

package() {
  # Extract sources to dkms directory
  install -dm755 "${pkgdir}/usr/src/"
  tar zxvf "${srcdir}/tp_smapi-${pkgver}.tar.gz" -C "${pkgdir}/usr/src/"

  # Apply Makefile patch for dkms
  pushd "${pkgdir}/usr/src/tp_smapi-${pkgver}/"
  patch -p1 -i "${srcdir}/debian/patches/99_Makefile-for-Debian.patch"
  popd

  # Insert version into dkms configuration file and install it
  sed \
    -e "s/^\(PACKAGE_VERSION=\).*$/\1\"${pkgver}\"/" \
    -e 's/^\(PACKAGE_NAME=\).*$/\1"tp_smapi"/' \
    < "${srcdir}/debian/dkms.conf.in" \
    > "${pkgdir}/usr/src/tp_smapi-${pkgver}/dkms.conf"
}

# vim:set ts=2 sw=2 et:
