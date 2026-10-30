# Maintainer: Mikko Tuomikoski <me@snoozyman.eu>
# Contributor: MoazSalem <https://github.com/MoazSalem>

pkgname=litefin-bin
pkgver=2.0.20
pkgrel=1
pkgdesc="Jellyfin & Emby Client for Smart TVs and Desktop (prebuilt binary)"
arch=('x86_64')
url="https://github.com/MoazSalem/litefin"
license=('MPL-2.0')
provides=('litefin')
conflicts=('litefin')
options=('!debug')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'glibc')
optdepends=('jellyfin-server: Media server to connect to')
makedepends=('libarchive')
source=("${pkgname}-${pkgver}-amd64.deb::https://github.com/MoazSalem/litefin/releases/download/v${pkgver}/Litefin_${pkgver}_amd64.deb")
sha256sums=('3c84995cc15919575b65190af85a8eb62f904db6fba497b4aa20c78539a1bbe3')
noextract=("${pkgname}-${pkgver}-amd64.deb")

prepare() {
  cd "${srcdir}"

  # Extract the .deb (ar archive containing data.tar.*)
  bsdtar -xf "${pkgname}-${pkgver}-amd64.deb" data.tar.xz 2>/dev/null \
    || bsdtar -xf "${pkgname}-${pkgver}-amd64.deb" data.tar.zst 2>/dev/null \
    || bsdtar -xf "${pkgname}-${pkgver}-amd64.deb" data.tar.gz

  mkdir -p "${srcdir}/extracted"
  bsdtar -xf data.tar.* -C "${srcdir}/extracted"
}

package() {
  cd "${srcdir}/extracted"

    # Install the main binary
  install -Dm755 "usr/bin/litefin" "${pkgdir}/usr/bin/litefin"

  # Install desktop entry
  if [ -f "usr/share/applications/Litefin.desktop" ]; then
    install -Dm644 "usr/share/applications/Litefin.desktop" \
      "${pkgdir}/usr/share/applications/Litefin.desktop"
  fi

  # Install icons
  if [ -d "usr/share/icons" ]; then
    cp -r "usr/share/icons" "${pkgdir}/usr/share/"
  fi

  # Install licenses if bundled
  if [ -f "usr/share/licenses/litefin/LICENSE" ]; then
    install -Dm644 "usr/share/licenses/litefin/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
