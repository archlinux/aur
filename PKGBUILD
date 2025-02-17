# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=nfs-ganesha
pkgver=6.5
pkgrel=1
pkgdesc="NFS and 9P protocols in user mode."
arch=(x86_64 i686 armv7h aarch64)
url="http://nfs-ganesha.github.io/"
license=(LGPL-3.0-only)
depends=(glibc gcc-libs nfsidmap libcap krb5 util-linux-libs e2fsprogs xfsprogs dbus libwbclient jemalloc liburcu acl btrfs-progs)
makedepends=(cmake git lsb-release doxygen python-sphinx graphviz)
options=(!emptydirs)
source=("git+https://github.com/nfs-ganesha/nfs-ganesha.git#tag=V${pkgver}"
        "git+https://github.com/nfs-ganesha/ntirpc.git"
        )
sha256sums=('d94d61103376a9dd84b75a5058f09c6062fed570d43a11a34c71efd358f13a1a'
            'SKIP')
backup=(etc/ganesha/ganesha.conf) #etc/sysconfig/ganesha

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.src/libntirpc.url "${srcdir}/ntirpc"
  git -c protocol.file.allow=always  submodule update
}

build() {
  cmake -B build -S "nfs-ganesha/src" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_MAN_PAGE=ON \
    -DUSE_RADOS_RECOV=OFF \
    -DRADOS_URLS=OFF \
    -DUSE_FSAL_LUSTRE=OFF \
    -DUSE_FSAL_LIZARDFS=OFF \
    -DUSE_FSAL_CEPH=OFF \
    -DUSE_FSAL_GLUSTER=OFF \
    -DUSE_FSAL_RGW=OFF

  cmake --build build

# v5.9   Cannot find XFS runtime.  Disabling XFS build
# yet xfsprogs is installed
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
