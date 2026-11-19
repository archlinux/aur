# Maintainer: Alexander Minges <alexander dot minges at gmail dot com>
# SPDX-License-Identifier: 0BSD
pkgname=ferron-bin
pkgver=3.0.0rc11
pkgrel=1
pkgdesc='A fast, modern web server written in Rust (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/ferronweb/ferron'
license=('MIT')
depends=('glibc' 'libgcc' 'ca-certificates')
optdepends=('systemd: run ferron.service')
provides=("ferron=$pkgver")
conflicts=('ferron' 'ferronweb')
backup=('etc/ferron/ferron.conf')
options=('!strip' '!debug')
_tag=3.0.0-rc.11
_commit=63648d8c93d214f70686a0db72cfaec778f57156
_raw="https://raw.githubusercontent.com/ferronweb/ferron/$_commit"
_release="$url/releases/download/$_tag"
_config="ferron.pkgunix-$_tag.conf"
_license="ferron-$_tag.LICENSE"
source=("$_config::$_raw/configs/ferron.pkgunix.conf"
        "$_license::$_raw/LICENSE"
        'ferron.service'
        'ferron.sysusers')
source_x86_64=("$_release/ferron-$_tag-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_release/ferron-$_tag-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('85a40b712cadd966bece80eeeaff640d5eb705d4bd1531c021f98cdcfe9348ab'
            'c1db5c351e357ea68362c01faff8dc046c59e1d7466317f64482c2a6d3e6a695'
            'f60a80735bf97656a39413e16c7568832bd565716649b8fa9355e69421e92948'
            'ab52479e574200cfac7981e0e8f5cf31b5c8f6129685122d5f22f8c3184ee808')
sha256sums_x86_64=('8db96c57ae01e8e8a4a6fe36447953aedaedf8078753c46de6370fb228c5d90c')
sha256sums_aarch64=('85bd449d2fcf05dc91d2f46a4cbfc743b897597708b9791ebe8867f54fb27f84')

prepare() {
  sed 's|^    root /var/www/ferron$|    root /usr/share/ferron/wwwroot|' "$_config" > ferron-arch.conf
  grep -qxF '    root /usr/share/ferron/wwwroot' ferron-arch.conf
}

check() {
  local version
  version=$(./ferron version)
  printf '%s\n' "${version%%$'\n'*}" | grep -xF "Ferron $_tag"
  ./ferron validate -c ferron-arch.conf
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" ferron ferron-fmt ferron-kdl2ferron ferron-passwd ferron-precompress ferron-serve
  install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/share/ferron"
  cp -R wwwroot "$pkgdir/usr/share/ferron/"
  install -Dm644 ferron-arch.conf "$pkgdir/etc/ferron/ferron.conf"
  install -Dm644 ferron.service "$pkgdir/usr/lib/systemd/system/ferron.service"
  install -Dm644 ferron.sysusers "$pkgdir/usr/lib/sysusers.d/ferron.conf"
}
