# Maintainer: Yuki Ibe <yibe\100yibe\056org>
pkgname=pyside6-tools-wrappers
pkgver=20230711
pkgrel=1
pkgdesc="Provides pyside6-* executables (such as pyside6-rcc and pyside6-uic)"
arch=('any')
url="https://code.qt.io/cgit/pyside/pyside-setup.git/tree/sources/pyside-tools/pyside_tool.py"
license=('LGPL3')
depends=('python' 'pyside6')
makedepends=('pyside6-tools')
optdepends=('qt6-tools: for pyside6-{assistant,linguist,lrelease,lupdate}'
            'pyside6-tools')
source=('pyside-tool-paths.patch')
sha512sums=('c437364061ef2f7ad93e9796513cae860d471f37d51af24f65ddf0ab4474b3db6c70b0b8efc9e6b3229b59ddce0fd096a71a40f74132a4364a884593aa2ccb75')
_origfile='/usr/bin/pyside_tool.py'

prepare() {
  pacman -Qo "$_origfile"
  printf 'copying '
  cp --verbose "$_origfile" .
  patch <./pyside-tool-paths.patch
}

package() {
  _funcnames=(
    $(grep -Po \
           "^\s+qt_tool_wrapper\((?:ui_tool_binary\()?([\"'])\K[\w-]+(?=\1)" \
           ./pyside_tool.py)
    $(grep -Po \
           "^\s+pyside_script_wrapper\(([\"'])\K[\w-]+(?=\.py\1)" \
           ./pyside_tool.py)
    genpyi)

  _exepaths=()

  for _i in "${!_funcnames[@]}"; do
    _exepath=/usr/bin/pyside6-${_funcnames[$_i]//_/-}

    # Prevent conflicts with other installed packages
    _owner="$(pacman -Qqo ${_exepath} 2>/dev/null || true)"
    if [[ -n $_owner ]] && [[ $_owner != $pkgname ]]; then
      printf '%s is owned by %s\n' "$_exepath" "$_owner"
      unset -v '_funcnames[$_i]'
    else
      _exepaths[$_i]=$_exepath
    fi
  done

  install -Dm755 ./pyside_tool.py "$pkgdir/usr/share/$pkgname/pyside_tool.py"
  install -dm755 "$pkgdir/usr/bin/"

  printf 'Generating %d files...' "${#_funcnames[@]}"
  for _i in "${!_funcnames[@]}"; do
    cat <<EOF >"$pkgdir${_exepaths[$_i]}"
#!/usr/bin/python
import importlib.util
import sys
module_name = 'PySide6.scripts.pyside_tool'
spec = importlib.util.spec_from_file_location(
    module_name, '/usr/share/${pkgname}/pyside_tool.py')
pyside_tool = importlib.util.module_from_spec(spec)
sys.modules[module_name] = pyside_tool
spec.loader.exec_module(pyside_tool)
sys.exit(pyside_tool.${_funcnames[$_i]}())
EOF
  done
  chmod +x "$pkgdir/usr/bin/pyside6-"*
  printf 'done:\n'
  ls "$pkgdir/usr/bin" | sed 's/^/  /'
}
