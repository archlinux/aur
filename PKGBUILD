# Maintainer: Michael Schantl <floss at schantl dash lx dot at>
# Upstream authors: Tom Keffer, Matthew Wall and contributors

# Supports automatic update checking

pkgbase=weewx
pkgname=("weewx" "weewx-docs")
_MAJOR=5
_MINOR=0
_PATCH=1
pkgver=$_MAJOR.$_MINOR.$_PATCH

function _dl_url {
  echo "https://github.com/weewx/weewx/archive/refs/tags/v$1.$2.$3.tar.gz"
}

pkgrel=2
pkgdesc="Software for logging data from weather stations"
arch=("any")
url="http://www.weewx.com/"
license=("GPL-3.0-or-later")
makedepends=("mkdocs"
             "mkdocs-material"
             "mkdocs-material-extensions"
             "python"
             "python-cheetah3"
             "python-configobj")
source=("$pkgbase-$pkgver.tar.xz::$(_dl_url $_MAJOR $_MINOR $_PATCH)"
        "weewx.sysusers"
        "weewx.tmpfiles"
        "weewx.service")
sha512sums=('cffe79cabb0c3e6af1cfc980c09e2d37bbb250635f5ae067e5967c6f3e2bd5abf431deee47492b24993f8eac5151ae5cad227bbbb9a9d595658ed4e01c0b9cc5'
            '6015b870143f6b8ae094b3f94ad53323be8a083f11c177dc508315fb3bbc20dd318124e6ccd41ba9d0388828e18c4b4ae6ce7c4a35ac0cab442eca9e8bbbca2d'
            'e97b287acf53c55d30f4e1a4d533fe5c649fac44080095fa1052f6f1cc9a55b6b0592d63c63a4a241e7007894e882648d5c4c4a221da69666e284637c5a3e15e'
            '4744fec4faf63b36f9c82a7404e4ecc749eb07e8d90640465ff7a2ae20cdb2560348b0a125467fad215d0e51d88d27a991dc0196899e53d19479dec942d6e52d')
_watch="http://www.weewx.com/downloads/"

build() {
  cd "$srcdir/${pkgbase}-${pkgver}"

  echo "Compiling Python bytecode"
  python -m compileall -q "src"

  echo "Compiling documentation"
  make --quiet build-docs
}

_install() {
  local dest="$1"
  local mode="$2"
  shift 2
  local sources=("$@")

  mkdir -p "$dest"
  cp -RL ${sources[@]} "$dest"

  chmod -R $mode "$dest"
  find "$dest" -type d -exec chmod a+x {} +
}

package_weewx() {
  depends=("python"
           "python-cheetah3"
           "python-configobj"
           "python-pillow")
  optdepends=("python-pyserial: serial port support"
              "python-pyusb: USB port support"
              "python-pyephem: extended celestial information"
              "python-pymysql: MySQL or MariaDB support")
  backup=("etc/weewx/weewx.conf")

  cd "$srcdir/${pkgbase}-${pkgver}"

  local PYTHON='python'
  local weewx_bindir='/usr/lib/weewx'
  local weewx_sharedir="/usr/share/weewx"
  local weewx_etcdir="/etc/weewx"
  local weewx_vardir="/var/lib/weewx"
  local entrypoints=('weewxd' 'weectl')

  local bindir="$pkgdir/usr/bin"
  local libdir="${pkgdir}${weewx_bindir}"
  local sharedir="${pkgdir}${weewx_sharedir}"
  local licensedir="$pkgdir/usr/share/licenses/weewx"
  local etcdir="${pkgdir}${weewx_etcdir}"
  local unitdir="$pkgdir/usr/lib/systemd/system"
  local sysusersdir="$pkgdir/usr/lib/sysusers.d"
  local tmpfilesdir="$pkgdir/usr/lib/tmpfiles.d"
  local udevdir="$pkgdir/usr/lib/udev/rules.d"

  echo "Copying source files"
  [[ -d "$libdir" ]] || mkdir -p "$libdir"
  _install "$libdir" 644 "src"/*
  _install "$libdir" 755 "src/weewx_data/bin"

  echo "Creating entrypoints"
  [[ -d "$bindir" ]] || mkdir -p "$bindir"
  for f in ${entrypoints[@]}; do
    echo "Creating entrypoint $f"
    sed \
      -e "s%WEEWX_BINDIR=.*%WEEWX_BINDIR=\"${weewx_bindir}\"%" \
      -e "s%WEEWX_PYTHON=.*%WEEWX_PYTHON=\"${PYTHON}\"%" \
      "bin/$f" > "$bindir/$f"
    chmod 755 "$bindir/$f"
  done

  echo "Copying license and copyright"
  install -Dm644 "docs_src/copyright.md" "$licensedir/copyright.md"
  install -Dm644 "LICENSE.txt" "$licensedir/LICENSE.txt"

  echo "Copying skins"
  [[ -d "$sharedir" ]] || mkdir -p "$sharedir"
  _install "$sharedir" 644 "src/weewx_data/skins"

  echo "Copying ancillary files"
  _install "$sharedir" 644 "src/weewx_data/examples"
  _install "$sharedir" 644 "src/weewx_data/util/import"
  _install "$sharedir" 644 "src/weewx_data/util/logwatch"
  _install "$sharedir" 644 "src/weewx_data/util/systemd"
  _install "$sharedir" 644 "src/weewx_data/util/udev"

  echo "Creating configuration file"
  [[ -d "$etcdir" ]] || mkdir -p "$etcdir"
  sed \
    -e "/log_failure =.*/aWEEWX_ROOT = $weewx_bindir" \
    -e "s%SKIN_ROOT =.*%SKIN_ROOT = $weewx_sharedir/skins%" \
    -e "s%HTML_ROOT = public_html%HTML_ROOT = $weewx_vardir/www%" \
    -e "s%SQLITE_ROOT = .*%SQLITE_ROOT = $weewx_vardir%" \
    "src/weewx_data/weewx.conf" > "$etcdir/weewx.conf"
  chmod 644 "$etcdir/weewx.conf"

  echo "Creating systemd unit"
  install -Dm644 "$srcdir/weewx.service" "$unitdir/weewx.service"

  echo "Creating system user definition"
  install -Dm644 "$srcdir/weewx.sysusers" "$sysusersdir/weewx.conf"

  echo "Creating tmpfiles definition"
  install -Dm644 "$srcdir/weewx.tmpfiles" "$tmpfilesdir/weewx.conf"

  echo "Creating udev ruleset"
  install -Dm644 "src/weewx_data/util/udev/rules.d/weewx.rules" "$udevdir/weewx.rules"
}

package_weewx-docs() {
  pkgdesc="Documentation for WeeWX"

  cd "$srcdir/${pkgbase}-${pkgver}"

  local docdir="$pkgdir/usr/share/doc/weewx"

  echo "Copying documentation"
  [[ -d "$docdir" ]] || mkdir -p "$docdir"
  _install "$docdir" 644 "build/docs"/*
}
