# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="raidrive"
pkgname="${_name}cli"
pkgver=2025.7.0
pkgrel=1
pkgdesc="Use cloud storage services as if they were USB drives on your computer"
arch=('aarch64' 'x86_64')
url="https://www.raidrive.com"
license=('custom:Freemium')
depends=('gcc-libs' 'glibc' 'zlib') # 'fuse3'
options=('!debug' '!strip')
install="${pkgname}.install"
_pkgsrc="${_name}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.deb::https://app.raidrive.com/deb/pool/main/${_name::1}/${_name}/${_pkgsrc//-/_}-linux_arm64.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://app.raidrive.com/deb/pool/main/${_name::1}/${_name}/${_pkgsrc//-/_}-linux_amd64.deb")
noextract=("${source_aarch64[@]%%::*}"
           "${source_x86_64[@]%%::*}")
sha256sums_aarch64=('b0c473d439b2ce21e71403b15052dd2010dbef3908515729e1384d11e126236c')
sha256sums_x86_64=('55d3c10a0600dac70076d3364d622bab786a75935bb5ec9e33954435d3cb06ca')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  find "${_pkgsrc}-${CARCH}" -type f -readable -exec \
    sed -i 's|usr/sbin|usr/bin|g' {} +
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr"
  find "bin" "sbin" -type f -execdir \
    install -vDm755 "{}" "${pkgdir}/usr/bin/{}" \;
  find "lib" -type f -name '*.service' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
