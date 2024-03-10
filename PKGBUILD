# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor : Anthony Wang <ta180m@pm.me>
# Contributor : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=24.1.2.0
_pkgver=${pkgver%.*}-${pkgver##*.}
pkgrel=1
pkgdesc="Mini version of Anaconda Python distribution"
arch=(x86_64 aarch64)
url="https://conda.io/en/latest/miniconda"
license=(BSD-3-Clause)
provides=('conda')
source_x86_64=(${pkgname}-${pkgver}-x86_64.sh::https://repo.anaconda.com/miniconda/Miniconda3-py311_${_pkgver}-Linux-x86_64.sh)
source_aarch64=(${pkgname}-${pkgver}-aarch64.sh::https://repo.anaconda.com/miniconda/Miniconda3-py311_${_pkgver}-Linux-aarch64.sh)
options=(!strip libtool staticlibs)
sha512sums_x86_64=('f6f4144aa819e4098c60a96a77976ed1f3ffb6db5251a7c7d5734e856e635e0913641d391e262bdf860524e31143a6f1727be9c93388528a0285d8cf190bdab6')
sha512sums_aarch64=('a9a3676f896d9d1310ee01395f4825748c54d274ce2f8e046a8ed05a12c1237193df7e8226b833c50a3e28d885b5e0b33afe1eaea6c279c28a74955a603a964e')
install="${pkgname}.install"

package() {
  prefix="${pkgdir}"/opt/"${pkgname}"
  LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

  # Packaging miniconda3 for installation to /opt/miniconda3
  bash "${srcdir}/${pkgname}-${_pkgver}-${CARCH}.sh" -b -p ${prefix} -f
  [ "$BREAK_EARLY" = 1 ] && exit 1
  cd "${prefix}"

  # Correcting permissions
  chmod a+r -R pkgs

  # Stripping $pkgdir
  sed -e "s|${pkgdir}||g" -i $(grep "${pkgdir}" . -rIl 2>/dev/null)

  # Installing license
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
