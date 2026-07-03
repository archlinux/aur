# Maintainer:

_pkgname="artemis-manual"
pkgname="$_pkgname"
pkgver=4.1.5
pkgrel=1
pkgdesc="Radio Signals Recognition Manual"
url="https://github.com/AresValley/Artemis"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'hicolor-icon-theme'
  'pyside6'
  'python'
  'python-packaging'
  'python-requests'
  'qt6-multimedia'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="Artemis-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"https://github.com/AresValley/Artemis/archive/v$pkgver.$_pkgext")
sha256sums=('ef85a2b7e40449b6be83165c54e1434ed81f4e03340f46c9688b52002968f328')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env python
import runpy
runpy.run_module("artemis", run_name="__main__")
END

  # icon
  install -Dm644 "data/com.aresvalley.artemis.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Artemis
GenericName=Artemis
Comment="Radio Signals Recognition Manual"
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Categories=Education;Network;HamRadio;Science;
StartupWMClass=artemis
END
}
