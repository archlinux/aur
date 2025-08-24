# Maintainer:

## links
# https://aresvalley.com/
# https://aresvalley.github.io/Artemis/
# https://github.com/AresValley/Artemis

_pkgname="artemis-manual"
pkgname="$_pkgname"
pkgver=4.1.0
pkgrel=2
pkgdesc="Radio Signals Recognition Manual"
url="https://github.com/AresValley/Artemis"
license=('GPL-3.0-only')
arch=('any')

makedepends=('python')

_pkgsrc="Artemis-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"https://github.com/AresValley/Artemis/archive/v$pkgver.$_pkgext")
sha256sums=('19e15685102387e451e4ef4634d181694ae1bb75e58d25c669bdab7a914a7d4d')

package() {
  depends=(
    'pyside6'
    'python-packaging'
    'python-requests'
    'qt6-multimedia'
  )

  local _files=(
    app.py
    artemis
    config
    images
    ui
  )

  mkdir -pm755 "$pkgdir/opt/$_pkgname"
  for i in ${_files[@]}; do
    cp -a "$_pkgsrc/$i" "$pkgdir/opt/$_pkgname/"
  done

  # specify python version to prevent untracked pyc files
  local _pyver_major _pyver_minor
  _pyver_major=$(python -c 'import sys; print(sys.version_info.major)')
  _pyver_minor=$(python -c 'import sys; print(sys.version_info.minor)')

  eval "depends+=(
    'python>=${_pyver_major}.${_pyver_minor}'
    'python<${_pyver_major}.$((_pyver_minor + 1))'
  )"

  # create pyc files
  python -m compileall -f -p / -s "$pkgdir" "$pkgdir/"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec python "/opt/$_pkgname/app.py" "\$@"
END

  # icon
  install -Dm644 "$_pkgsrc/images/artemis_icon.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

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
Categories=Network;HamRadio;
END

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
