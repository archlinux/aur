# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=tlg-pc-git
_pkgname="${pkgname%-git}"
pkgver=2026.10.27.4825a99
_pkgver="${pkgver%.*}-${pkgver##*.}"
pkgrel=1
pkgdesc='Native PC port of The Last Guardian PS4 game'
arch=('x86_64')
url='https://github.com/HayatoG/tlg_pc'
license=('GPL-2.0-or-later')
depends=('ffmpeg' 'fmt' 'libpng' 'sdl3' 'zydis')
makedepends=('git' 'bash' 'cmake' 'ninja' 'boost' 'glslang' 'robin-map'
             'vulkan-memory-allocator' 'vulkan-icd-loader')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"::"git+https://github.com/HayatoG/tlg_pc.git"
       "${_pkgname}"
       "${_pkgname}.desktop")
sha256sums=('SKIP'
            'e705cfd15d1f106c2c8313287004942e809693e8dd20184a9f26c10fc5e9827f'
            'b06b3ef4af13d05fd9e217f4fddb645a1756dcf99d0185645a73642230e376da')

pkgver() {
  cd "${pkgname}"
  git describe --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  # Fix libraries path
  sed -i 's|while read -r soname path; do|&\n    soname=${soname##*/}|' port/packaging/linux/package.sh
}

build() {
  cd "${pkgname}/port"
  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
  TLG_LTO=ON TLG_PGO=on bash build.sh
}

package() {
  cd "${pkgname}/port"
  # Build package
  bash packaging/linux/package.sh
  # Install package files
  install -m 755 -d "${pkgdir}/opt"
  cp -dr --no-preserve=ownership "out/stage/tlg-linux-x86_64" "${pkgdir}/opt/${pkgname}"
  # Install launchers and desktop file
  install -m 755 -D "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -m 755 -D "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Add version number
  echo "v${_pkgver}" > "${pkgdir}/opt/${pkgname}/VERSION"
  # Enable write-access to anyone to the 'out' directory
  chmod -R o+w "${pkgdir}/opt/${pkgname}/out"
}
