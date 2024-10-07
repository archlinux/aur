# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="raidrive"
pkgname="${_name}cli"
pkgver=2024.9.27
pkgrel=1
pkgdesc="Use cloud storage services as if they were USB drives on your computer"
arch=('x86_64' 'aarch64')
url="https://www.raidrive.com"
license=('custom:Freemium')
depends=('gcc-libs' 'glibc' 'sh' 'zlib')
options=('!debug' '!strip')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://app.raidrive.com/deb/pool/main/${_name::1}/${_name}/${_name}_${pkgver}-linux_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::https://app.raidrive.com/deb/pool/main/${_name::1}/${_name}/${_name}_${pkgver}-linux_arm64.deb")
sha256sums_x86_64=('f8b75021f961d8e8b1c51d86d938e4f98c8a6f8ae26f013b6281ee81db7e302e')
sha256sums_aarch64=('1d0af5dc0b6b21026055981b2f3012fb22d379c212b8fcf8d5af3800f9abd46a')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find . -type f -readable -exec sed -i 's|usr/sbin|usr/bin|g' {} +
  
  cd "usr"
  mv -f "sbin"/* "bin"
  rm -rf "sbin"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "usr/bin" -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/lib" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
  find "etc"     -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
}
