# Maintainer: robertfoster
# Contributor: said
# Contributor: Ner0
# Contributor: farnsworth517

pkgname=soulseekqt
pkgver=20221224
_pkgver=2022-12-24
_appimage="SoulseekQt-${_pkgver}-64bit.AppImage"
pkgrel=1
pkgdesc="A desktop client for the Soulseek peer-to-peer file sharing network"
arch=('x86_64')
url="http://www.soulseekqt.net/news/"
license=('CUSTOM')
depends=('freetype2')

source=(
  "https://github.com/M0Rf30/soulseekqt-binaries/releases/download/${pkgver}/${_appimage}.tgz"
  "https://github.com/M0Rf30/soulseekqt-binaries/raw/main/hacks/selinux-mock.c"
  "https://github.com/M0Rf30/soulseekqt-binaries/raw/main/desktop/${pkgname}.desktop"
  "https://github.com/M0Rf30/soulseekqt-binaries/raw/main/desktop/${pkgname}.png"
  "https://github.com/M0Rf30/soulseekqt-binaries/raw/main/desktop/${pkgname}.sh"
)
options=("!strip")

prepare() {
  cd "$srcdir"
  msg2 "Extraction..."
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract

  msg2 "Compiling libselinux.so.1 fakelib"
  gcc -s -shared -o libselinux.so.1 -Wl,-soname,libselinux.so.1 selinux-mock.c
}

package() {
  cd "$srcdir"

  mkdir -p "${pkgdir}/opt/"
  cp -r squashfs-root "${pkgdir}/opt/$pkgname"

  # workaround for selinux
  install -Dm755 libselinux.so.1 \
    "${pkgdir}/opt/soulseekqt/lib/libselinux.so.1"

  # Desktop resources
  install -Dm755 "${pkgname}.sh" \
    "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 "${pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/soulseek.png"
  install -Dm644 "$pkgname.desktop" \
    "${pkgdir}/usr/share/applications/$pkgname.desktop"

  msg2 "Cleanup"

  chmod 755 -R "${pkgdir}/opt/$pkgname"

  # This fix context menu on right click in search results
  rm -rf "${pkgdir}"/opt/soulseekqt/{AppRun,default.desktop,soulseek.png,*.AppImage}
}

sha256sums=('86e1f5501e614cb12ee32242daff5338d1d45e3a0fd9a882d32d517b68eb1849'
            'dabd228cf296dc4dd9462a21d16cc6cbfc77ee2abfcae3297ec783e6184dc9f4'
            'ecb2e829138c9d8373b5ba4e042e01ef34b3701ddc306f753acf894fff4047bf'
            '5097f36ea49f1a61cbb975507de99dc7e768d0377e3736b431fee47f13a45e1c'
            '8d74a05712838f5250496d7538e8354a716e2ec4138a8bc9948886a85ef1c9cb')
