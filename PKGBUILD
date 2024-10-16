# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="raidrive"
pkgname="${_name}cli"
pkgver=2024.9.27.4
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
sha256sums_x86_64=('0a414f457ac1d259638aa6c67ef829f1d92cdaf6b5caf98acc64a0011617b0ad')
sha256sums_aarch64=('ca60bda12ace57b699ccb91753a302db3a23502398d04b248c59f861c6d976f1')

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
