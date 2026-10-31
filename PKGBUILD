# Maintainer: Miguel Perez Andrade <miguel.perezandrade@gmail.com>

pkgname=xteink-unlocker-bin
_pkgname=xteink-unlocker
pkgver=0.2.42
pkgrel=1
pkgdesc="Install CrossPoint Reader on USB-locked Xteink devices via their own OTA update mechanism"
arch=('x86_64')
url='https://crosspointreader.com'
license=('LicenseRef-unknown')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'libayatana-appindicator'
  'polkit'
  'networkmanager'
  'dnsmasq'
  'procps-ng'
  'hicolor-icon-theme'
)
optdepends=('polkit-gnome: graphical polkit agent, needed if your session does not run one')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("https://unlocker-releases.crosspointreader.com/v${pkgver}/XteinkUnlocker_${pkgver}_linux-x86_64.deb")
sha256sums=('5afdc3bd426c9475248b31fc80e143875b7158da5aaa26a1260a5f68c2c4472b')
noextract=("XteinkUnlocker_${pkgver}_linux-x86_64.deb")

prepare() {
  mkdir -p deb
  bsdtar -xOf "XteinkUnlocker_${pkgver}_linux-x86_64.deb" data.tar.gz | bsdtar -xf - -C deb
}

package() {
  cd deb

  install -Dm755 usr/bin/unlocker-app "$pkgdir/usr/bin/unlocker-app"
  # The app looks for its privileged helper at this exact path (pkexec'd)
  install -Dm755 "usr/lib/Xteink Unlocker/unlocker-helper" \
    "$pkgdir/usr/lib/Xteink Unlocker/unlocker-helper"

  install -Dm644 "usr/share/applications/Xteink Unlocker.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  for size in 32x32 128x128 256x256@2; do
    install -Dm644 "usr/share/icons/hicolor/$size/apps/unlocker-app.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/unlocker-app.png"
  done
}
