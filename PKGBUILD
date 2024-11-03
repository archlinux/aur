# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="raidrive"
pkgname="${_name}cli"
pkgver=2024.9.27.6
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
sha256sums_x86_64=('a0aa845fa4ab77c5066d989d402b03ffa32ecfcad2dec42bb102f8deb1af5e37')
sha256sums_aarch64=('76c65b2bf421641c9f273b5fe7d742818e0769c4767a97e86b7e834b47faea8e')

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
