# Maintainer: Jadren <jadren@jadren.dev>

pkgname=pi-desktop-bin
_pkgname=pi-desktop
pkgver=0.20.1
pkgrel=1
pkgdesc="Local-first AI coding agent desktop: Electron + Rust host core + pi Agent Harness + user-installable plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/vastsa/PI-Desktop"
license=('LGPL-3.0-only')
depends=('alsa-lib' 'at-spi2-core' 'gcc-libs' 'glibc' 'gtk3' 'libcups' 'libnotify' 'libsecret'
         'libxss' 'libxtst' 'mesa' 'nss' 'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/vastsa/PI-Desktop/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
noextract=("${_pkgname}-${pkgver}-x86_64.deb" "${_pkgname}-${pkgver}-aarch64.deb")
sha256sums=('e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118')
sha256sums_x86_64=('ba5349c28e7a1222f39f6201cb7541cae5163f55d758fbf8b54fecbb58e1544b')
sha256sums_aarch64=('cf1d13d18da72e7fb30d45e6f5588278a11dd266d7eea9e20f6ae4fda582442c')

prepare() {
  mkdir -p deb
  bsdtar -xOf "${_pkgname}-${pkgver}-${CARCH}.deb" 'data.tar.*' | bsdtar -xf - -C deb
}

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a deb/opt/PI-Desktop "${pkgdir}/opt/${_pkgname}"

  # Arch kernels support unprivileged user namespaces; no SUID sandbox needed
  chmod 0755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 deb/usr/share/applications/${_pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i "s|^Exec=.*|Exec=${_pkgname} %U|" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 deb/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
