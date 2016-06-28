# Maintainer:  Neng Xu <neng2.xu2@gmail.com>
# Contributor: Tobias Quinn <tobias@tobiasquinn.com>
# Contributor: John Radley <jradxl [at] gmail [dot] com>

##
## This is an install from Orient's tar.gz, and does not build Java sources
##

pkgname=orientdb-community

## PKGBUILD:pkgver is not allowed to contain colons, hyphens or whitespace
pkgversion=2.2.3
#pkgrc=rc2
pkgrc=
#pkgsuffix=-$pkgrc
pkgsuffix=
#pkgver=$pkgversion.$pkgrc
pkgver=$pkgversion

pkgtmp=
pkgrel=1
#epoch=1
pkgdesc="OrientDB Graph-Document NoSQL - Community Edition"
arch=('any')
license=('Apache')
url="http://www.orientdb.org"
depends=('sh' 'java-environment')
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
# Using Orient's explict tar.gz download for this version.
# server2.sh and shutdown2.sh are versions more suited to systemd usage.
#
source=(
  "orientdb-community-${pkgversion}${pkgsuffix}.tar.gz::http://orientdb.com/download.php?email=unknown@unknown.com&file=orientdb-community-${pkgversion}${pkgsuffix}.tar.gz&os=linux"
  'orientdb.service'
  'server2.sh'
  'shutdown2.sh'
)

md5sums=(
  'cb001911d3be9915bc64bcf4140535d1'
  '2845ee26c2b4a370fde6ada6815b5eeb'
  '4a5fe9143276adf167dbb7ae46a4f3f2'
  'e9482fd3b41fc56af333365c6287b5a6'
)

#prepare() {}

#No Build required
#build() {}

#check() {}

package()
{

  cd "${srcdir}"/${pkgname}-${pkgver}

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

  # Add the improved systemd server management scripts
  install -m700 "${srcdir}"/server2.sh "${pkgdir}"/opt/orientdb/bin
  install -m700 "${srcdir}"/shutdown2.sh "${pkgdir}"/opt/orientdb/bin

  # Set permissions on the executables
  # --no World permissions are intended, so namcap errors can be ignored.
  install -m700 bin/*.sh "${pkgdir}"/opt/orientdb/bin/
  install -m755 bin/console.sh "${pkgdir}"/opt/orientdb/bin/

  # Remove DOS bat files
  find "${pkgdir}"/opt/orientdb -type f -name "*.bat" -exec rm -f {} \;

  # Empty dirs for Install - namcap errors can be ignored.
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/var/log/orientdb
  install -d "${pkgdir}"/usr/lib/systemd/system

  # Instead of a patch
  sed -i 's/cd `dirname $0`/#cd `dirname $0`/' "${pkgdir}"/opt/orientdb/bin/console.sh

  sed -i 's|\.\./log|/opt/orientdb/log|' "${pkgdir}"/opt/orientdb/config/orientdb-server-log.properties
  sed -i 's|YOUR_ORIENTDB_INSTALLATION_PATH|/opt/orientdb|' "${pkgdir}"/opt/orientdb/bin/orientdb.sh
  sed -i 's|USER_YOU_WANT_ORIENTDB_RUN_WITH|orient|' "${pkgdir}"/opt/orientdb/bin/orientdb.sh

  #Prevent server.sh being run from root
  sed -i '/PRG="$0"/a if [[ $(id -u) -eq 0 ]] ; then echo "" ; echo "Please do not try to start Orientdb Server as root." ; exit 1 ; fi' "${pkgdir}"/opt/orientdb/bin/server.sh

  install -m644 "${srcdir}"/orientdb.service "${pkgdir}"/usr/lib/systemd/system/
}
