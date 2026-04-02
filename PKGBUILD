# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="raidrive"
pkgver=2025.12.0
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
  'glibc'
  'libgcc'
  'libstdc++'
  'zlib'
)
conflicts=(
  "${pkgname}cli<=2025.9.29-1"
)
replaces=(
  "${pkgname}cli<=2025.9.29-1"
)
options=(
  '!debug'
  '!strip'
)
install="${pkgname}.install"
source_aarch64=(
  "https://app.raidrive.com/deb/pool/main/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}-linux_arm64.deb"
)
source_x86_64=(
  "https://app.raidrive.com/deb/pool/main/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}-linux_amd64.deb"
)
noextract=(
  "${source_aarch64[@]##*/}"
  "${source_x86_64[@]##*/}"
)
sha256sums_aarch64=('2146867f78f7f552c960c2da09236a401af8ab409d07f3fd540b0857b78cbcf2')
sha256sums_x86_64=('35d49dc8e96e67acd252b9f32e92f78471f54f62063cbd9a71174df9afc5bf00')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  mkdir -p "${source_artifact%.deb}"
  bsdtar -xf "${source_artifact}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${source_artifact%.deb}"
  rm -f data.tar.*

  cd "${source_artifact%.deb}"
  rm -rf "etc"

  cd "usr"
  cp -aT "sbin" "bin"
  rm -rf "sbin"

  find . -type f -readable -exec \
    sed -i 's|usr/sbin|usr/bin|g' "{}" +
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  cp -vaT --no-preserve=ownership "${source_artifact%.deb}" "${pkgdir}"
}
