# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor : Anthony Wang <ta180m@pm.me>
# Contributor : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=26.5.3.1
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
sha512sums_x86_64=('8c4ec22246908141b6ee637cf061475c9a84b43a4799918010765ce8b65eea2fd6fc4273998ee6e54d6bc766f2a3b411a280ea2f38b01ea98ba253a6ac98bee3')
sha512sums_aarch64=('9986d62fb83e15e3187c90e6c0a5a20e7fd4dfa179e1bda8f463fbd28badb01e21a8094c814bf4b5ae291748bdf3a521d31f19172481e964956ae6e731346325')
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
