# Maintainer: Alex Kashirin <kashirin.alex@gmail.com>

_group_name="swcdb"
_sub_name="env"

pkgname=${_group_name}-${_sub_name}
pkgver=0.5.0
pkgrel=1
pkgdesc="The SWC-DB Runtime Environment"
arch=("x86_64")

groups=($_group_name)
provides=(
  swcdb_cluster
)

url="https://www.swcdb.org"
license=('GPLv3')


depends=()
makedepends=()
optdepends=('openssl' 'fabric')

backup=(
  etc/${_group_name}/{gen_crt.sh,openssl.cnf}
  etc/${_group_name}/swc.{dyn.cfg,cfg,cluster.cfg}
  etc/${_group_name}/swc_{fs_local,fs_broker,fs_ceph,fs_hadoop,fs_hadoop_jvm,mngr,rgr,fsbroker,thriftbroker}.cfg
  etc/${_group_name}/swc_{mngr,rgr,fsbroker,fs_broker,thriftbroker}.dyn.cfg
)

conflicts=()
replaces=()
options=()
install=README.md
changelog=


source=(
  $pkgname-$pkgver-source::git+https://github.com/kashirin-alex/swc-db.git#tag=v$pkgver
)
sha256sums=('SKIP')


# build() {}


package() {

  mkdir -p $pkgdir/etc;
  cp -r $pkgname-$pkgver-source/src/etc/swcdb             $pkgdir/etc/;

  mkdir -p $pkgdir/usr/bin;
  cp $pkgname-$pkgver-source/src/py/sbin/swcdb_cluster    $pkgdir/usr/bin/;
  chmod 755 $pkgdir/usr/bin/swcdb_cluster;

  mkdir -p $pkgdir/var/lib/swcdb;
  # apply '/var/lib/swcdb/' as default swc.fs.local.path.root= cfg
  sed -i 's/\/var\/opt\/swcdb\//\/var\/lib\/swcdb\//g' \
    $pkgdir/etc/swcdb/swc_fs_local.cfg;

  # remove 'swcdb_install_path + '' fromn default cfg
  sed -i 's/\[swcdb_install_path + \"\/etc\/swcdb\/\"\]/\[\"\/etc\/swcdb\/\"\]/g' \
    $pkgdir/usr/bin/swcdb_cluster;

  mkdir -p $pkgdir/var/log/swcdb;
  sed -i 's/\[swcdb_install_path + \"\/var\/log\/swcdb\/\"\]/\[\"\/var\/log\/swcdb\/\"\]/g' \
    $pkgdir/usr/bin/swcdb_cluster;

  sed -i 's/\/opt\/swcdb\/bin\//\/usr\/bin\//g' \
    $pkgdir/usr/bin/swcdb_cluster;
}
