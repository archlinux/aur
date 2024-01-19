# Maintainer: Michael Schantl <floss at schantl dash lx dot at>
# Upstream authors: Tom Keffer, Matthew Wall and contributors

# Supports automatic update checking

pkgname=weewx
_MAJOR=5
_MINOR=0
_PATCH=0
pkgver=$_MAJOR.$_MINOR.$_PATCH

function _dl_url {
  echo "https://github.com/weewx/weewx/archive/refs/tags/v$1.$2.$3.tar.gz"
}

pkgrel=1
pkgdesc="Software for logging data from weather stations"
arch=("any")
url="http://www.weewx.com/"
license=("GPL-3.0-or-later")
depends=("python"
         "python-cheetah3"
         "python-configobj"
         "python-pillow")
optdepends=("python-pyserial: serial port support"
            "python-pyusb: USB port support"
            "python-pyephem: extended celestial information"
            "python-pymysql: MySQL or MariaDB support")
makedepends=("mkdocs"
             "mkdocs-material"
             "mkdocs-material-extensions")
backup=("etc/weewx/weewx.conf")
source=("$pkgname-$pkgver.tar.xz::$(_dl_url $_MAJOR $_MINOR $_PATCH)"
        "weewx.sysusers"
        "weewx.tmpfiles"
        "weewx.service")
sha512sums=('c3eb23048012f2bab7eac0a25f6dfad4da4ff1591601f7242cf7fec91343e88f3014b7281c021c75cfdbb5b4e73285ab8605325a3c7771e90a5016e3d574dc3b'
            '6015b870143f6b8ae094b3f94ad53323be8a083f11c177dc508315fb3bbc20dd318124e6ccd41ba9d0388828e18c4b4ae6ce7c4a35ac0cab442eca9e8bbbca2d'
            '9875bf209439f62fc2e6773b1283a6ed0a2adbe33e7b6461678a5f036679570a98393814eeadcb20b9d9160b79aca0b1a1769eab39be2d1913b64439abd76f62'
            '4744fec4faf63b36f9c82a7404e4ecc749eb07e8d90640465ff7a2ae20cdb2560348b0a125467fad215d0e51d88d27a991dc0196899e53d19479dec942d6e52d')
_watch="http://www.weewx.com/downloads/"

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  echo "Compiling Python bytecode"
  python -m compileall -q "src"

  echo "Building documentation"
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

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

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
  local docdir="$pkgdir/usr/share/doc/weewx"
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

  echo "Copying documentation"
  [[ -d "$docdir" ]] || mkdir -p "$docdir"
  _install "$docdir" 644 "build/docs"/*

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
  chmod 640 "$etcdir/weewx.conf"

 echo "Creating systemd unit"
 install -Dm640 "$srcdir/weewx.service" "$unitdir/weewx.service"

 echo "Creating system user definition"
 install -Dm640 "$srcdir/weewx.sysusers" "$sysusersdir/weewx.conf"

 echo "Creating tmpfiles definition"
 install -Dm640 "$srcdir/weewx.tmpfiles" "$tmpfilesdir/weewx.conf"

 echo "Creating udev ruleset"
 install -Dm640 "src/weewx_data/util/udev/rules.d/weewx.rules" "$udevdir/weewx.rules"
}
