# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=momw-tools-pack-bin
pkgver=1.59
pkgrel=1
pkgdesc="All the tools needed to automatically install and configure Modding-OpenMW.com mod lists"
arch=('x86_64')
url="https://modding-openmw.gitlab.io/momw-tools-pack/"
license=('AGPL-3.0-only' 'GPL-3.0-or-later' 'GPL-2.0-only' 'MIT' 'LGPL-2.1-or-later' 'BSD-3-Clause' 'LicenseRef-unRAR')
depends=('glibc'
         'libgcc'
         'cairo'
         'dbus'
         'gdk-pixbuf2'
         'glib2'
         'gtk3'
         'libsoup3'
         'webkit2gtk-4.1')
provides=('momw-tools-pack'
          '7zmo'
          'delta-plugin'
          'gocoverify'
          'lumenaire'
          'merged-lands'
          'momw-configurator'
          'openmw-validator'
          'tes3cmd'
          'umo'
          'wraithguard-toolkit')
conflicts=("${provides[@]}")
# Stripping breaks the self-extracting umo and tes3cmd binaries
options=('!strip' '!debug')
source=("momw-tools-pack-$pkgver-linux.tar.gz::https://gitlab.com/api/v4/projects/modding-openmw%2Fmomw-tools-pack/packages/generic/momw-tools-pack/$pkgver/momw-tools-pack-linux.tar.gz"
        'momw-tools-pack.sh')
sha256sums=('63f9c4a7f86dec4149a048dc8170c311491e4d9903b916f364c2184de6f9851b'
            '4c9efca76d76130f3159d2ec5e3fc610d11c68ee3c6211a099b4f951f253bf37')

package() {
  local _dest="$pkgdir/opt/momw-tools-pack"

  # Configurator finds the tools beside itself, so keep them together
  install -Dm755 -t "$_dest" 7zmo delta_plugin tes3cmd umo wraithguard wraithguard-toolkit
  for _tool in gocoverify lumenaire merged_lands momw-configurator openmw-validator; do
    install -Dm755 "$_tool-linux-amd64" "$_dest/$_tool"
  done
  install -Dm644 -t "$_dest" version.txt
  cp -r --no-preserve=ownership tes3cmd-linux-amd64 "$_dest/"

  install -Dm644 -t "$pkgdir/etc/profile.d" momw-tools-pack.sh

  install -d "$pkgdir/usr/share/doc" "$pkgdir/usr/share/licenses"
  cp -r --no-preserve=mode,ownership Readmes "$pkgdir/usr/share/doc/$pkgname"
  ln -s "/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
