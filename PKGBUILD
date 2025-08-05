# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=thinkfan-ui
pkgver=1.0.1
pkgrel=4
pkgdesc="A small gui app for Linux to control the fan speed and monitor temps on a ThinkPad"
arch=('x86_64')
url="https://github.com/zocker-160/thinkfan-ui"
license=('GPL-3.0-only')
depends=('python' 'python-pyqt6' 'qt6-svg' 'lm_sensors')
makedepends=('git')
#conflicts=('')
source=("git+https://github.com/zocker-160/thinkfan-ui.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  # nothing to see here
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r src/* "$pkgdir/opt/$pkgname"

  install -D -m755 linux_packaging/thinkfan-ui -t "$pkgdir/usr/bin"
  install -D -m644 linux_packaging/thinkfan-ui.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -D -m644 linux_packaging/thinkfan-ui.desktop -t "$pkgdir/usr/share/applications"

  install -D -m644 linux_packaging/modules-load.conf "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
  install -D -m644 linux_packaging/thinkpad_acpi.conf "$pkgdir/usr/lib/modprobe.d/thinkpad_acpi_thinkfan_ui.conf"

  # fix python version to prevent untracked pyc files
  # force users to rebuild when Python version updates
  local _pyver_major _pyver_minor
  _pyver_major=$(python -c 'import sys; print(sys.version_info.major)')
  _pyver_minor=$(python -c 'import sys; print(sys.version_info.minor)')

  eval "depends+=(
    'python>=${_pyver_major}.${_pyver_minor}'
    'python<${_pyver_major}.$((_pyver_minor + 1))'
  )"

  # generate pyc files
  python -m compileall -f -p / -s "$pkgdir" "$pkgdir/"
}
