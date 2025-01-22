# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Guarda"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.0.20
pkgrel=1
pkgdesc="A custody-free cryptocurrency wallet which supports over 40 most popular blockchains"
arch=('x86_64')
url="https://guarda.com"
_url="https://github.com/guardaco/guarda-desktop-releases"
license=('custom:Unknown') # ISC? https://aur.archlinux.org/packages/guarda-appimage#comment-834284
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups'
         'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext'
         'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr'
         'nss' 'pango')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_Name}_${pkgver}_amd64.deb")
sha256sums_x86_64=('72d1d6f1a5462b0c9649133a1836a2ce6e6d6a855957942cf0cfa53ab2093513')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -rf "usr/share/doc"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${_Name}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
