# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="labymodlauncher"
pkgver=2.1.7
pkgrel=1
pkgdesc="A launcher for LabyMod, a Minecraft client that adds a bunch of useful features"
arch=('x86_64')
url="https://www.labymod.net"
license=('custom:Proprietary')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libsecret' 'libx11'
         'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
         'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
makedepends=('dpkg')
noextract=("${pkgname}-x86_64.deb")
source_x86_64=("${pkgname}-x86_64.deb::https://releases.r2.labymod.net/launcher/linux/x64/${pkgname}_latest_amd64.deb")
sha256sums_x86_64=('SKIP')

pkgver() {
  # shellcheck disable=SC2016
  dpkg-deb --show --showformat='${Version}' "${pkgname}-${CARCH}.deb" | tr - .
}

build() {
  cd "${srcdir}"
  mkdir -p "${pkgname}-${pkgver}-${CARCH}"
  bsdtar -xf "${pkgname}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${pkgname}-${pkgver}-${CARCH}"
  rm -f data.tar.*

  cd "${pkgname}-${pkgver}-${CARCH}"
  rm -rf "usr/share/"{doc,lintian}
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${pkgname}-${pkgver}-${CARCH}"/* "${pkgdir}"
}
