# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='wdckit'
_path="opt/wdc/${pkgname}"
pkgver='3.2.0.0'
pkgrel='1'
pkgdesc="Western Digital ATA/SCSI command line utility"
url='https://westerndigital.com/'
license=('custom')
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
# Source file is covered with Cloudflare challenge
# https://files.hddguru.com/index.php?action=downloadfile&filename=wdckit-3.2.0.0.zip&directory=Software/Western%20Digital&
source=("https://s3.e2e4.ru/k0ste/pkgbuild/${pkgname}-${pkgver}.zip")
sha256sums=('3ae213e574e5a79397f2928195e84f7915569b30b5131d0e14c670d7cb699f58')

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
