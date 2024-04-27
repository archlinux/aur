# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor : Anthony Wang <ta180m@pm.me>
# Contributor : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=24.3.0.0
_pkgver=${pkgver%.*}-${pkgver##*.}
pkgrel=3
pkgdesc="Mini version of Anaconda Python distribution"
arch=(x86_64 aarch64)
url="https://conda.io/en/latest/miniconda"
license=(BSD-3-Clause)
provides=('conda')
source_x86_64=(https://repo.anaconda.com/miniconda/Miniconda3-py312_${_pkgver}-Linux-x86_64.sh)
source_aarch64=(https://repo.anaconda.com/miniconda/Miniconda3-py312_${_pkgver}-Linux-aarch64.sh)
options=(!strip libtool staticlibs)
sha512sums_x86_64=('1d087d299562f7bb8a4e78ccf6399c59f5bbbde7e45a2f846e495d981ac7410ff58fc20dc7782f9555a7e9c80a1e6d19640ccf02c680c72c68bd790b56121b9d')
sha512sums_aarch64=('8c1f13b358b2c0e98b16d64c27b6b40b5e3c47a3094562f671ce17d0231c0072a2e1d1fbdfd96d2465299081d74f9fcc24b2b79a20f1e587d2344798b5281ef9')
install="${pkgname}.install"

package() {
  prefix="${pkgdir}"/opt/"${pkgname}"
  LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

  # Packaging miniconda3 for installation to /opt/miniconda3
  bash "${srcdir}/Miniconda3-py311_${_pkgver}-Linux-${CARCH}.sh" -b -p ${prefix} -f
  [ "$BREAK_EARLY" = 1 ] && exit 1
  cd "${prefix}"

  # Correcting permissions
  chmod a+r -R pkgs

  # Stripping $pkgdir
  sed -e "s|${pkgdir}||g" -i $(grep "${pkgdir}" . -rIl 2>/dev/null)

  # Installing license
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
