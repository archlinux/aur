# Maintainer:  Neng Xu <neng2.xu2@gmail.com>
# Contributor: Tobias Quinn <tobias@tobiasquinn.com>
# Contributor: John Radley <jradxl [at] gmail [dot] com>

##
## This is a build from source
##
pkgname=orientdb-community

## PKGBUILD:pkgver is not allowed to contain colons, hyphens or whitespace
pkgversion=2.1.3
#pkgrc=rc2
pkgrc=
#pkgsuffix=-$pkgrc
pkgsuffix=
#pkgver=$pkgversion.$pkgrc
pkgver=$pkgversion

pkgtmp=
pkgrel=1
#epoch=1
pkgdesc="The Graph-Document NoSQL - Community Edition"
arch=('any')
license=('Apache')
url="http://www.orientdb.org"
depends=('java-runtime-headless')
makedepends=('unzip')
depends=('java-runtime-headless' 'apache-ant')
makedepends=('unzip')
conflicts=('orientdb' 'orientdb-git' 'orientdb-graphed-git' 'orientdb-graphed')
install=$pkgname.install
groups=()
checkdepends=()
optdepends=()
provides=()
replaces=()
backup=()
options=()
noextract=()
changelog=""

#
# Using the github release of source, which has no package name.
#
source=("https://github.com/orientechnologies/orientdb/archive/${pkgversion}${pkgsuffix}.tar.gz"
  'orientdb.service')

md5sums=('8f5454b58dff94b15c380979e81e9387'
  '687903eba3737f9733bf1c45c4e68e6d')

#prepare() {}

build() {
    #
    #Parse '-community' from pkgname
    #
    cd "${srcdir}"/$(echo ${pkgname} | sed s/-community//)-${pkgversion}${pkgsuffix}
    ant
}

#check() {}

package() {
  # Build has created a 'releases' dir in the parent.
  cd ${srcdir}/releases/${pkgname}-${pkgversion}${pkgsuffix}

  # Create directories with permissions
  install -dm755 "${pkgdir}"/opt/orientdb
  install -dm700 "${pkgdir}"/opt/orientdb/benchmarks
  install -dm755 "${pkgdir}"/opt/orientdb/bin
  install -dm700 "${pkgdir}"/opt/orientdb/config
  install -dm700 "${pkgdir}"/opt/orientdb/databases
  install -dm755 "${pkgdir}"/opt/orientdb/lib
  install -dm755 "${pkgdir}"/opt/orientdb/log
  install -dm755 "${pkgdir}"/opt/orientdb/plugins
  install -dm700 "${pkgdir}"/opt/orientdb/www

  # Recursively copy files
  cp -r . "${pkgdir}"/opt/orientdb

  # Set permissions on the executables
  install -m700 bin/*.sh "${pkgdir}"/opt/orientdb/bin/
  install -m755 bin/console.sh "${pkgdir}"/opt/orientdb/bin/

  # Remove DOS bat files
  find "${pkgdir}"/opt/orientdb -type f -name "*.bat" -exec rm -f {} \;

  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/var/log/orientdb
  install -d "${pkgdir}"/usr/lib/systemd/system

  # Instead of a patch
  sed -i 's/cd `dirname $0`/#cd `dirname $0`/' "${pkgdir}"/opt/orientdb/bin/console.sh

  sed -i 's|\.\./log|/opt/orientdb/log|' "${pkgdir}"/opt/orientdb/config/orientdb-server-log.properties
  sed -i 's|YOUR_ORIENTDB_INSTALLATION_PATH|/opt/orientdb|' "${pkgdir}"/opt/orientdb/bin/orientdb.sh
  sed -i 's|USER_YOU_WANT_ORIENTDB_RUN_WITH|orient|' "${pkgdir}"/opt/orientdb/bin/orientdb.sh

  install -m644 "${srcdir}"/orientdb.service "${pkgdir}"/usr/lib/systemd/system/
}
