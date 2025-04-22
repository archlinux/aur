# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=nfs-ganesha-git
pkgver=7.dev.12.r0.gfc1daa6a6
pkgrel=2
pkgdesc="NFS and 9P protocols in user mode."
arch=(x86_64 i686 armv7h aarch64)
url="http://nfs-ganesha.github.io/"
license=(LGPL-3.0-only)
depends=(glibc gcc-libs nfsidmap libcap krb5 util-linux-libs e2fsprogs dbus libwbclient jemalloc liburcu acl btrfs-progs
         rdma-core xfsprogs libunwind)
makedepends=(cmake git lsb-release doxygen python-sphinx graphviz)
provides=(nfs-ganesha)
conflicts=(nfs-ganesha)
source=("git+https://github.com/nfs-ganesha/nfs-ganesha.git"
        "git+https://github.com/nfs-ganesha/ntirpc.git"
        )
sha256sums=('SKIP'
            'SKIP')
backup=(etc/ganesha/ganesha.conf) #etc/sysconfig/ganesha

pkgver() {
  cd nfs-ganesha
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd nfs-ganesha
  git submodule init
  git config submodule.src/libntirpc.url "${srcdir}/ntirpc"
  git -c protocol.file.allow=always  submodule update
}

build() {
  cmake -B build -S "nfs-ganesha/src" -Wno-dev \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_MAN_PAGE=ON \
    -DUSE_RADOS_RECOV=OFF \
    -DRADOS_URLS=OFF \
    -DUSE_FSAL_LUSTRE=OFF \
    -DUSE_FSAL_LIZARDFS=OFF \
    -DUSE_FSAL_CEPH=OFF \
    -DUSE_FSAL_GLUSTER=OFF \
    -DUSE_FSAL_KVSFS=OFF \
    -DUSE_FSAL_RGW=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
