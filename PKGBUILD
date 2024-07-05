# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=theia-bin
_pkgname=theia
pkgver=1.51.0
pkgrel=1
pkgdesc="Cloud and Desktop IDE Platform"
arch=('x86_64')
url='https://www.theia-ide.org/'
license=('EPL2')
provides=('theia')
conflicts=('theia')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=('libappindicator-gtk3: Systray indicator')
source=("TheiaIDE_x64_${pkgver}.deb::https://download.eclipse.org/theia/ide/${pkgver}/linux/TheiaIDE.deb"
        "${pkgname}-${pkgver}-${pkgrel}.yml::https://download.eclipse.org/theia/ide/1.51.0/linux/latest-linux.yml")
sha256sums=('SKIP' # use the upstream checksums instead
            'SKIP')
options=('!strip')

prepare() {
  sha512_base64=$(grep -A 2 'url: TheiaIDE.deb' "${pkgname}-${pkgver}-${pkgrel}.yml" | grep 'sha512' | awk '{print $2}')
  sha512_hex=$(echo "${sha512_base64}" | base64 -d | xxd -p -c 256)
  echo "${sha512_hex}  TheiaIDE_x64_${pkgver}.deb" > "TheiaIDE_x64_${pkgver}.deb.sha512"
  sha512sum -c "TheiaIDE_x64_${pkgver}.deb.sha512"
}

package() {
  tar -xJf data.tar.xz --no-same-owner -C "${pkgdir}"

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
  mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/theia-ide-electron-app.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/theia-ide-electron-app.png"

  rm -f "${pkgdir}/usr/share/doc/theia-ide-electron-appchangelog.gz"
}

