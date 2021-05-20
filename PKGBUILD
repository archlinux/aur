# Maintainer: Denis Vadimov <me@bloody.pw> (aka BloodyAltair)

pkgname=remmina-plugin-kwallet
pkgver=1.4.16
pkgrel=1
pkgdesc='A remote desktop client written in GTK+ - built-in kwallet plugin'
arch=(i686 x86_64)
url='http://www.remmina.org/'
license=('GPL')
depends=('remmina' 'kwallet')
makedepends=('pkg-config' 'cmake' 'git')
source=("builder::git+https://github.com/muflone/remmina-plugin-builder.git"
        "remmina::git+https://github.com/FreeRDP/Remmina.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/remmina"
  ver=$(git describe --tags --abbrev=0)
  echo "${ver/v/}"
}

build() {
  cd "${srcdir}/builder"
  builder_ver=$(git describe --tags --abbrev=0)
  git checkout tags/$builder_ver

  cd "${srcdir}/remmina"
  remmina_ver=$(git describe --tags --abbrev=0)
  git checkout tags/$remmina_ver

  # IMPORTANT: Patch remmina plugin to replace VERSION constant
  sed -i "s/VERSION/\"${remmina_ver/v/}\"/g" "${srcdir}/remmina/plugins/kwallet/src/kwallet_plugin_main.c"

  cp -r "${srcdir}/remmina/plugins/kwallet/." "${srcdir}/builder/remmina-plugin-to-build"
  cd "${srcdir}/builder"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_TRACE_CALLS=OFF .
  make
}

package() {
  cd "${srcdir}/builder/"
  make DESTDIR="${pkgdir}" install
}
