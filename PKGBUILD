# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="raidrive"
pkgname="${_name}cli"
pkgver=2024.9.27.6
pkgrel=2
pkgdesc="Use cloud storage services as if they were USB drives on your computer"
arch=('x86_64' 'aarch64')
url="https://www.raidrive.com"
license=('custom:Freemium')
depends=('gcc-libs' 'glibc' 'zlib') # 'fuse3'
options=('!debug' '!strip')
_pkgsrc="${_name}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://app.raidrive.com/deb/pool/main/${_name::1}/${_name}/${_pkgsrc//-/_}-linux_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::https://app.raidrive.com/deb/pool/main/${_name::1}/${_name}/${_pkgsrc//-/_}-linux_arm64.deb")
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

  rm -rf "etc"
  
  cd "usr"
  mv -f "sbin"/* "bin"
  rm -rf "sbin"  
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -vrL --no-preserve=ownership * "${pkgdir}"
}
