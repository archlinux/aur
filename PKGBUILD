# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=nfs-ganesha
pkgver=5.7
pkgrel=1
pkgdesc="NFS and 9P protocols in user mode."
arch=(x86_64 i686 armv7h aarch64)
url="http://nfs-ganesha.github.io/"
license=(GPL3)
depends=(glibc nfsidmap libcap krb5 util-linux-libs e2fsprogs xfsprogs dbus libwbclient jemalloc liburcu acl btrfs-progs)
makedepends=(cmake git lsb-release) # doxygen python-sphinx graphviz
options=(!emptydirs)
source=("git+https://github.com/nfs-ganesha/nfs-ganesha.git#tag=V${pkgver}"
        "git+https://github.com/nfs-ganesha/ntirpc.git"
        "nfs-ganesha-libntirpc-assert.h-fix.patch::https://github.com/nfs-ganesha/ntirpc/pull/279/commits/1f9bb775d02b8b894f12d8408e35275e329b2da6.patch")
sha256sums=('SKIP'
            'SKIP'
            '309bd1726a8e9545896d8bc766311fa87e6348d369b1a9fb75fd014e344166e5')
backup=(etc/ganesha/ganesha.conf) #etc/sysconfig/ganesha

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.src/libntirpc.url "${srcdir}/ntirpc"
  git -c protocol.file.allow=always  submodule update

  cd src/libntirpc
  patch -Np1 -i ${srcdir}/nfs-ganesha-libntirpc-assert.h-fix.patch
}

build() {
  cmake -B build -S "nfs-ganesha/src" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_MAN_PAGE=OFF \
    -DUSE_RADOS_RECOV=OFF \
    -DRADOS_URLS=OFF \
    -DUSE_FSAL_LUSTRE=OFF \
    -DUSE_FSAL_LIZARDFS=OFF \
    -DUSE_FSAL_CEPH=OFF \
    -DUSE_FSAL_GLUSTER=OFF \
    -DUSE_FSAL_RGW=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
