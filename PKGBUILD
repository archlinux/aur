# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="raidrive"
pkgname="${_name}cli"
pkgver=2025.5.7
pkgrel=1
pkgdesc="Use cloud storage services as if they were USB drives on your computer"
arch=('aarch64' 'x86_64')
url="https://www.raidrive.com"
license=('custom:Freemium')
depends=('gcc-libs' 'glibc' 'zlib') # 'fuse3'
options=('!debug' '!strip')
_pkgsrc="${_name}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.deb::https://app.raidrive.com/deb/pool/main/${_name::1}/${_name}/${_pkgsrc//-/_}-linux_arm64.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://app.raidrive.com/deb/pool/main/${_name::1}/${_name}/${_pkgsrc//-/_}-linux_amd64.deb")
noextract=("${source_aarch64[@]%%::*}"
           "${source_x86_64[@]%%::*}")
sha256sums_aarch64=('85db165b5a0d2e584674e107a9e2dd634dcdf7bca7404a92d9401fe5f63d3e7e')
sha256sums_x86_64=('bde064e452ac86c38c2f60a506e109cee2a4fa42f157a82d35b8e6016ac49272')

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
  find "bin" "sbin" -type f -exec \
    install -vDm755 "{}" "${pkgdir}/usr/bin/{}" \;
  find "lib" -type f -name '*.service' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
