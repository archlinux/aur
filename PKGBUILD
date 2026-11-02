# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sourcemod-advertisements
_name=sm-advertisements
pkgver=2.1.2
pkgrel=1
pkgdesc="Advertisements, a SourceMod plugin displaying messages on game servers (in the addons folder of sourcemod)"
arch=(any)
url="https://github.com/ErikMinekus/sm-advertisements"
# Upstream states no license; a SourceMod plugin is a derivative work of SourceMod's include files,
# which SourceMod's license puts under GPL 3.0 with its exceptions
license=(GPL-3.0-only LicenseRef-SourceMod-exception)
depends=(sourcemod)
makedepends=(git sourcemod-scripting)
source=("git+https://github.com/ErikMinekus/sm-advertisements.git#tag=$pkgver")
sha512sums=('0fa6625cf470f8510385707a28d6a162b497c3faf7d51ce4679ac728f827a073905742d58f7bf596603eb16385b6feb6f78ab1d74afc43ad10d29d804696cb05')
b2sums=('a305b4cf5b745c5ac65bfec891e94694fc5e5c7e4e3dc7b074ee37eddc0065e4e1a3e1d7c9cfd01b61c3d7a70b9269d0282a71b0b9b2f3982c399fa3569f4a66')

prepare() {
  cd "$_name/addons/sourcemod/scripting" || exit
  # Without the Updater plugin's updates, which would replace the package's files: a newer version
  # comes with the package
  sed -i -e '/^#include <updater>$/d' -e '/^#define UPDATE_URL\t/d' \
    -e '/^    if (LibraryExists("updater")) {$/,/^    }$/d' \
    -e '/^    if (StrEqual(name, "updater")) {$/,/^    }$/d' advertisements.sp
  ! grep -qi updater advertisements.sp || exit
  rm include/updater.inc
}

build() {
  cd "$_name/addons/sourcemod/scripting" || exit
  spcomp64 -iinclude -o../plugins/advertisements.smx advertisements.sp
}

package() {
  # In the addons folder of sourcemod: the plugin and its configuration, as in upstream's package
  local _src="$srcdir/$_name/addons/sourcemod" _sm="$pkgdir/usr/lib/sourcemod/addons/sourcemod"
  install -Dm644 "$_src/plugins/advertisements.smx" -t "$_sm/plugins"
  install -Dm644 "$_src/configs/advertisements.txt" -t "$_sm/configs"

  install -Dm644 /usr/share/licenses/sourcemod-scripting/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
