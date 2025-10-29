# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="labymodlauncher"
pkgver=2.1.13
pkgrel=2
pkgdesc="A launcher for LabyMod, a Minecraft client that adds a bunch of useful features"
arch=('x86_64')
url="https://www.labymod.net"
license=('custom:Proprietary')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libsecret' 'libx11'
         'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
         'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://releases.r2.labymod.net/launcher/linux/x64/${_pkgsrc//-/_}_amd64.deb")
sha256sums_x86_64=('63e551a75451b315777933dc14891f91360cad3d6d7a7cb3ac7fa906598b0dab')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -rf "opt"
  mv -f "usr/lib" "opt"

  cp -f "opt/${pkgname}/resources/icons/icon.png" "usr/share/pixmaps/${pkgname}.png"

  cd "usr"
  ln -vsf "/opt/${pkgname}/${pkgname}" "bin/${pkgname}"

  cd "share"
  rm -rf "doc" "lintian"
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"
}
