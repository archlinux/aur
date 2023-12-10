_pkgname=joplin
pkgname=$_pkgname-electron
pkgver=2.13.9
pkgrel=1
_electronversion=25
pkgdesc="Joplin Desktop for Linux, using the system Electron package"
arch=('any')
url="https://github.com/laurent22/joplin"
license=('AGPL-3.0')
depends=(
  "electron${_electronversion}" 'gtk3' 'libexif' 'libgsf' 'libjpeg-turbo' 'libwebp' 'libxss'
  'nss' 'orc' 'rsync' 'libvips'
)
optdepends=('libappindicator-gtk3: for tray icon')
conflicts=("joplin-desktop")
source=(
  "https://github.com/ruslin-note/joplin-electron/releases/download/v${pkgver}-${pkgrel}/resources.tar.gz"
  "joplin.desktop"
  "joplin.sh"
)
sha256sums=(
  'a17c608cd4568733a409ec1107f519b8140c05301d7a4a45411588c804d75a99'
  '9e26cd5f41d08c3c2804cf4f34cb867090371423ccbe250a890fac006d405deb'
  'bd8324d35faaf6815217d1cf31a0b5e4df80692b0312ad17aea20d51f95efd56'
)

prepare() {
	sed -i "s|@electronversion@|${_electronversion}|" "$srcdir/joplin.sh"
}

package() {
  install -vDm644 ${srcdir}/app.asar -t "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr ${srcdir}/app.asar.unpacked -t "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr ${srcdir}/build -t "${pkgdir}/usr/lib/${_pkgname}"

  for i in 16 32 64 128 256 512 1024; do
    [[ -f "${srcdir}/build/icons/${i}x${i}.png" ]] && install -vDm644 ${srcdir}/build/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done

  install -vDm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/joplin-desktop"
  install -vDm644 "${srcdir}"/${_pkgname}.desktop -t "${pkgdir}"/usr/share/applications
}
