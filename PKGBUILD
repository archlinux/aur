# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='wdckit'
_path="opt/wdc/${pkgname}"
pkgver='3.1.1.0'
pkgrel='1'
pkgdesc="Western Digital ATA/SCSI command line utility"
url='https://westerndigital.com/'
license=('custom')
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
# Source file is covered with Cloudflare challenge
# https://files.hddguru.com/index.php?action=downloadfile&filename=wdckit-3.1.1.0.zip&directory=Software/Western%20Digital&
source=("https://s3.e2e4.ru/k0ste/pkgbuild/${pkgname}-${pkgver}.zip")
sha256sums=('b19272b9227da9839e7265ce16409209a7245a54459c3e7357f5a6ce9e355380')

_file_arch=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${pkgname}-${pkgver}-${CARCH}-rpm" || echo -n "${pkgname}-${pkgver}-${CARCH}_deb")
_pkg_arch=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${pkgname}-${pkgver}.${CARCH}.rpm" || echo -n "${pkgname}_${pkgver}_${CARCH}.deb")

prepare() {
  mkdir "${_file_arch}" "${pkgname}-pkgsource"
  # Unpack zip with packages
  bsdtar -xf "${_file_arch}.zip" --directory "${_file_arch}"
  # Unpack package
  bsdtar -xf "${_file_arch}/${_pkg_arch}" --directory "${pkgname}-pkgsource"
}

build() {
  cd "${pkgname}-pkgsource"
  # ported from original package
  echo "1" > "${_path}/.${pkgname}_lic"
  touch "${_path}/.exit_codes.txt"
}

package() {
  cd "${pkgname}-pkgsource"
  install -Dm0755 "${_path}/man/${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1"
  rm --force --recursive "${_path}/man"
  cp --recursive "usr" "${pkgdir}"
  cp --recursive "opt" "${pkgdir}"
}
