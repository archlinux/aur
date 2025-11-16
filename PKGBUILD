# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="raidrive"
pkgname="${_name}cli"
pkgver=2025.9.29
pkgrel=1
pkgdesc="Use cloud storage services as if they were USB drives on your computer"
arch=(
  'aarch64'
  'x86_64'
)
url="https://www.raidrive.com"
license=(
  'custom:Freemium'
)
depends=(
  # 'fuse3'
  'gcc-libs'
  'glibc'
  'zlib'
)
options=(
  '!debug'
  '!strip'
)
install="${pkgname}.install"
_pkgsrc="${_name}-${pkgver}"
source_aarch64=(
  "${_pkgsrc}-aarch64.deb::https://app.raidrive.com/deb/pool/main/${_name::1}/${_name}/${_pkgsrc//-/_}-linux_arm64.deb"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.deb::https://app.raidrive.com/deb/pool/main/${_name::1}/${_name}/${_pkgsrc//-/_}-linux_amd64.deb"
)
noextract=(
  "${source_aarch64[@]%%::*}"
  "${source_x86_64[@]%%::*}"
)
sha256sums_aarch64=('3b65f60cbd999a23812a296fabfb406f60a31d0a6b9ff8ad0aa991e3460e78e9')
sha256sums_x86_64=('a8bf3d7ff67fa8d90c3dcb51d36ad1ffc98cd3a2003f070f06085d79189a08ee')

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
