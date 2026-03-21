# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor : Anthony Wang <ta180m@pm.me>
# Contributor : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=26.1.1.1
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
sha512sums_x86_64=('f2a7b34f449964114635e770bdcc17066642a5a36a06383868317e84ee8e8a3433dfbeab0ea704c7d26ab6f8a3be2e4c748fc217106f0bde1d3609f8e17822c8')
sha512sums_aarch64=('2a6ab34d3541c48857759d7d8469c916691daac04d6850a38828288d6f63d4e4ac8403c37ba35558d5a498b0babdb5222b1fed8a708440f3d14130649a86f290')
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
