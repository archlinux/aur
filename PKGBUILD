# Maintainer: Michael Schantl <floss at schantl dash lx dot at>
# Upstream authors: Tom Keffer, Matthew Wall and contributors

# Supports automatic update checking

pkgname=weewx
_MAJOR=4
_MINOR=10
_PATCH=1
pkgver=$_MAJOR.$_MINOR.$_PATCH

function _dl_url {
  echo "https://github.com/weewx/weewx/archive/refs/tags/v$1.$2.$3.tar.gz"
}

pkgrel=1
pkgdesc="Software for logging data from weather stations"
arch=("any")
url="http://www.weewx.com/"
license=("GPL3")
depends=("python"
         "python-daemon"
         "python-six"
         "python-configobj"
         "python-pillow"
         "python-pyserial"
         "python-pyusb"
         "python-cheetah3")
optdepends=("python-pyephem: extended almanac information"
            "mariadb-clients: MariaDB support"
            "python-mysqlclient: MariaDB support")
backup=("etc/weewx/weewx.conf")
source=("$(_dl_url $_MAJOR $_MINOR $_PATCH)"
        "wee_config"
        "wee_database"
        "wee_debug"
        "wee_device"
        "wee_extension"
        "wee_import"
        "wee_reports"
        "weewxd"
        "wunderfixer"
        "weewx.service")
sha512sums=('14faab47b453db05a753026731d226647e8c5dd72d85b72cd41e1e6230e47ad342b9cc71efc529375be33f151275afd06c3bf4587526682b4a677612145ca5f2'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
_watch="http://www.weewx.com/downloads/"

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
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

  echo "Renning install using setup.py script"
  local setup_base="$pkgdir/${pkgname}"
  python setup.py install --root="$setup_base" --optimize=1 --skip-build --no-prompt

  local target_bin_dir="$pkgdir/usr/bin"
  local target_doc_dir="$pkgdir/usr/share/doc/$pkgname"
  local target_etc_dir="$pkgdir/etc/$pkgname"
  local target_lib_dir="$pkgdir/usr/lib/$pkgname"
  local target_share_dir="$pkgdir/usr/share/$pkgname"

  local target_license_file="$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  local target_unit="${pkgname}.service"
  local target_unit_file="$pkgdir/usr/lib/systemd/system/${target_unit}"
  local target_conf_file="$target_etc_dir/weewx.conf"

  local source_bin=("${srcdir}/wee_config"
                    "${srcdir}/wee_database"
                    "${srcdir}/wee_debug"
                    "${srcdir}/wee_device"
                    "${srcdir}/wee_extension"
                    "${srcdir}/wee_import"
                    "${srcdir}/wee_reports"
                    "${srcdir}/weewxd"
                    "${srcdir}/wunderfixer")
  local source_unit_file=("${srcdir}/${target_unit}")
  local source_doc=("${setup_base}/home/weewx/docs"/*)
  local source_conf_file="${setup_base}/home/weewx/weewx.conf"
  local source_etc=("${setup_base}/home/weewx/skins" "$source_conf_file")
  local source_lib=("${setup_base}/home/weewx/bin"/*)
  local source_license_file=("${setup_base}/home/weewx/LICENSE.txt")
  local source_share=("${setup_base}/home/weewx/examples"
                      "${setup_base}/home/weewx/util/apache"
                      "${setup_base}/home/weewx/util/import"
                      "${setup_base}/home/weewx/util/logrotate.d"
                      "${setup_base}/home/weewx/util/logwatch"
                      "${setup_base}/home/weewx/util/newsyslog.d"
                      "${setup_base}/home/weewx/util/rsyslog.d"
                      "${setup_base}/home/weewx/util/udev")

  echo "Installing binaries"
  _install "$target_bin_dir" 755 "${source_bin[@]}"

  echo "Installing library files"
  _install "$target_lib_dir" 644 "${source_lib[@]}"

  echo "Installing configuration"
  _install "$target_etc_dir" 644 "${source_etc[@]}"

  echo "Installing documentation"
  _install "$target_doc_dir" 644 "${source_doc[@]}"

  echo "Installing shared files"
  _install "$target_share_dir" 644 "${source_share[@]}"

  echo "Installing license"
  install -Dm644 "$source_license_file" "$target_license_file"

  echo "Installing unit file"
  install -Dm644 "$source_unit_file" "$target_unit_file"

  echo "Removing temp setup"
  rm -r "$setup_base"

  echo "Removing unnecessary files"
  find "$pkgdir" -name "*.egg-info" -type f -delete

  echo "Fixing ownership"
  chown -R root:root "$pkgdir"

  echo "Adapting configuration file"
  sed -i "$target_conf_file" \
   -r -e "s@(.*WEEWX_ROOT).*@\1 = /@g" \
   -r -e "s@(.*SKIN_ROOT).*@\1 = /etc/$pkgname/skins@g" \
   -r -e "s@(.*HTML_ROOT).*@\1 = /srv/http/html/$pkgname@g" \
   -r -e "s@(.*SQLITE_ROOT).*@\1 = /var/lib/$pkgname@g"
}
