# Maintainer: 企鹅2035 <qie2035@qq.com>
# Contributor: nightcodex7 (upstream author)

pkgname=lenovo-vantage-unofficial-linux
_commit=9a1513e67779a6d9ab72a96502d989cf4367d7b4
pkgver=20260502
pkgrel=1
pkgdesc="Unofficial Lenovo Vantage / Legion Toolkit alternative: PyQt6 GUI, CLI and privileged D-Bus daemon for Lenovo laptops"
arch=('any')
url="https://github.com/nightcodex7/lenovo-vantage-unofficial-linux"
license=('GPL-3.0-only')
depends=('python' 'python-dbus' 'python-gobject' 'python-pyqt6' 'dbus' 'systemd')
optdepends=('supergfxctl: GPU switching (hybrid/iGPU/dGPU) support'
            'ryzenadj: custom TDP tuning on AMD CPUs'
            'zenity: dialog menus for the vantage launcher script'
            'xorg-xinput: input controls used by the vantage launcher script'
            'networkmanager: network status in the vantage launcher script')
install="$pkgname.install"
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('4b9840249d2f7aa8710078ef44a1ddce6bc9b52ebf52d10c2ed8d6e474a1bf66')

package() {
  cd "$pkgname-$_commit"

  # Root daemon + feature modules
  install -dm755 "$pkgdir/usr/lib/vantage/daemon"
  cp -r --no-preserve=ownership daemon/features daemon/ipc \
    "$pkgdir/usr/lib/vantage/daemon/"
  install -Dm755 daemon/vantaged.py daemon/automation.py \
    -t "$pkgdir/usr/lib/vantage/daemon/"
  find "$pkgdir/usr/lib/vantage" -type d -name '__pycache__' -prune -exec rm -rf {} +

  # CLI and GUI entry points
  install -Dm755 cli/vantage-cli.py "$pkgdir/usr/bin/vantage-cli"
  install -Dm755 cli/vantage-gui.py "$pkgdir/usr/bin/vantage-gui"
  install -Dm755 vantage.sh "$pkgdir/usr/bin/vantage"

  # D-Bus system policy (modern /usr path; never ship policy in /etc)
  install -Dm644 dbus/org.lenovo.Vantage.conf \
    "$pkgdir/usr/share/dbus-1/system.d/org.lenovo.Vantage.conf"

  # systemd unit (enablement is left to the user, not the package)
  install -Dm644 systemd/vantaged.service \
    "$pkgdir/usr/lib/systemd/system/vantaged.service"

  # Icon (270x270 PNG ships fine from the 256x256 hicolor slot)
  install -Dm644 icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/vantage.png"

  # Desktop entry: reference the icon by theme name, lowercase Terminal key
  install -Dm644 vantage.desktop \
    "$pkgdir/usr/share/applications/vantage.desktop"
  sed -i -e 's|^Icon=.*|Icon=vantage|' \
    -e 's|^Terminal=False|Terminal=false|' \
    "$pkgdir/usr/share/applications/vantage.desktop"
}
