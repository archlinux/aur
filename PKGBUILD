# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor : Anthony Wang <ta180m@pm.me>
# Contributor : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=24.5.0.0
_pkgver=${pkgver%.*}-${pkgver##*.}
pkgrel=1
pkgdesc="Mini version of Anaconda Python distribution"
arch=(x86_64 aarch64)
url="https://conda.io/en/latest/miniconda"
license=(BSD-3-Clause)
provides=('conda')
source_x86_64=(https://repo.anaconda.com/miniconda/Miniconda3-py312_${_pkgver}-Linux-x86_64.sh)
source_aarch64=(https://repo.anaconda.com/miniconda/Miniconda3-py312_${_pkgver}-Linux-aarch64.sh)
options=(!strip libtool staticlibs)
sha512sums_x86_64=('a149f89ac51d027c914fa8b49adab805c60a9596c3ba6a68b7435a4b6c6330b7d405c7620171f135cf3efe1f03f138f73d1e0f1fe32413f9e1fa80bb340ee0a1')
sha512sums_aarch64=('6ff9c934fedf5a36a799b2a8a2c3c05ce4cfecf1bdc865152000f173376eabbefa8a912bd0165a6ac021b65ee5c3e7c3a2d4b2165b5337155a0b97145be567db')
install="${pkgname}.install"

package() {
  prefix="${pkgdir}"/opt/"${pkgname}"
  LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

  # Packaging miniconda3 for installation to /opt/miniconda3
  bash "${srcdir}/Miniconda3-py312_${_pkgver}-Linux-${CARCH}.sh" -b -p ${prefix} -f
  [ "$BREAK_EARLY" = 1 ] && exit 1
  cd "${prefix}"

  # Correcting permissions
  chmod a+r -R pkgs

  # Stripping $pkgdir
  sed -e "s|${pkgdir}||g" -i $(grep "${pkgdir}" . -rIl 2>/dev/null)

  # Installing license
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
