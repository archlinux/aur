# Maintainer: Michael Schantl <floss at schantl dash lx dot at>
# Upstream authors: Tom Keffer, Matthew Wall and contributors

pkgname=weewx
pkgver=4.2.0
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
optdepends=("python-ephem: for extended almanac information"
            "mariadb-clients: for MariaDB support"
            "python-mysqlclient: for MySQL/MariaDB support")
backup=("etc/weewx/weewx.conf")
source=("http://www.weewx.com/downloads/released_versions/${pkgname}-${pkgver}.tar.gz"
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
sha512sums=('c823858fe616af5c41d532c820038c3fc6a00614c4183c9d87b7e4f8602d7f28f3c7a5e4828efbde2a87a29531edf5d6112ec464be570d34d7b74ee7d152d925'
            'fc47d8cd4972c7cfbaf89f7705242471e5333591cb6e9781f0352fba0aee542166c0be337492a2dbdaea48d6e2cb7035b921fa3b26142324373c14594171fec6'
            '5e1a64fed4b5c752b1bfa8381394517403aa8fc4bf7c2b1af025ff4fc872e733761e7fc25cd603d5c2b57e4a673164ff87cb640ce69c8b257213ca4f906fe8f9'
            'b01a9405e21c8d01bca6a7101f513abe22fd85e576dc46b974b1aea2f2bcbb6dadd6e5e0ac829b9067dc23e0e7ae5de9e8f50e9972b60507e7d910da6c25ea73'
            'f3a2b234fd2d22d1c2adefee6b24541f8ba0dacf272711ac257c9e1b29da94d793a5aa01871f084e361565655e446d721329007777628a886bf21a8545bd31be'
            '7b9314cc703a318e7ece59e8c5bf8d72bf8ac98b1630e1e912df8d637b6564488236e07768f34bc37337cf7892aad5f2b36f3984f0225f28c5c98a97eed0f0a4'
            'ae715665343c293aa79bdd086e5a67726636ee28223fe00d073616609f7f9a8632e9f5ae2215dd65199afee64424e86c2187b05a9d93d885542e206ccc93b383'
            'fdd820de4de0a0fe68c940adfdec405489295213c990e20ebf43c73416c9ffbe2e503894127dca37a5ad20772812647f40e50ce64b864ae87fd3858158806a12'
            '94cd797c5a0b252caefa7cb54817468871259c8ff5590124cfa3aad0f72630dbea68beb2f2d928a7530d9efbc2707e7f7f36502f21980ebef0a7b557a2b76299'
            '4ca8e074b4c9c6a2de62d2f9d0918b76b0f146bdae80bb01d6a1013ff00b8030accdcd1dc677deacc2c8fd96e5f57a623b18014f93d3aa9fc9f617866047c8d7'
            '9c78eb9a2b88cc80a2c86ff58257e9c231601494576f6af62cc68273ad072581ce247953baa16c5abcd9d888dad7a9616f892e78e539f222ec24870586774b0c')
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
