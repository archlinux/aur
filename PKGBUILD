# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor : Anthony Wang <ta180m@pm.me>
# Contributor : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=26.7.1.1
_pkgver=${pkgver%.*}-${pkgver##*.}
_pyversion=py313
pkgrel=1
pkgdesc="Mini version of Anaconda Python distribution"
arch=(x86_64 aarch64)
url="https://conda.io/en/latest/miniconda"
license=(BSD-3-Clause)
provides=('conda')
source_x86_64=(https://repo.anaconda.com/miniconda/Miniconda3-${_pyversion}_${_pkgver}-Linux-x86_64.sh)
source_aarch64=(https://repo.anaconda.com/miniconda/Miniconda3-${_pyversion}_${_pkgver}-Linux-aarch64.sh)
options=(!strip libtool staticlibs)
sha512sums_x86_64=('9b59b0ec4225ad166faa008e16311078378d86f3d0868c06293ad2d1516e571db9f03e57674f1f231b32b43c7027b2ce60c76f524f045e57fbbe17e4d280a98b')
sha512sums_aarch64=('256fcc3654c76038d913aa8e441305cd446046e4d93f753b16b7a0d34e0d15f4fcc5a6c22b68feb02a612e3080d8095f15993d08a33f98dcdfa6edff35216bc7')
install="${pkgname}.install"

package() {
  prefix="${pkgdir}"/opt/"${pkgname}"
  LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

  # Packaging miniconda3 for installation to /opt/miniconda3
  bash "${srcdir}/Miniconda3-${_pyversion}_${_pkgver}-Linux-${CARCH}.sh" -b -p ${prefix} -f
  [ "$BREAK_EARLY" = 1 ] && exit 1
  cd "${prefix}"

  # Correcting permissions
  chmod a+r -R pkgs

  # Stripping $pkgdir
  sed -e "s|${pkgdir}||g" -i $(grep "${pkgdir}" . -rIl 2>/dev/null)

  # Installing license
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
