# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=nfs-ganesha
pkgver=9.14
pkgrel=1
pkgdesc="NFS and 9P protocols in user mode."
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/nfs-ganesha/nfs-ganesha"
license=(LGPL-3.0-only)
depends=(
    acl
    btrfs-progs
    dbus
    e2fsprogs
    gcc-libs
    glibc
    jemalloc
    krb5
    libcap
    libprocps
    libunwind
    liburcu
    libwbclient
    nfsidmap
    rdma-core
    util-linux-libs
    xfsprogs
    )
makedepends=(
    cmake
    doxygen
    git
    graphviz
    lsb-release
    python-sphinx
    )
options=(!emptydirs)
source=("git+https://github.com/nfs-ganesha/nfs-ganesha.git#tag=V${pkgver}"
        "git+https://github.com/nfs-ganesha/ntirpc.git"
        "git+https://github.com/biaks/prometheus-cpp-lite.git"
        )
sha256sums=('5e7596e6b6007807881ecb13321825d5eef5ae02820c7ca272dab425ad4a3d51'
            'SKIP'
            'SKIP')
backup=(etc/ganesha/ganesha.conf) #etc/sysconfig/ganesha

prepare() {
  cd nfs-ganesha
  git submodule init
  git config submodule.src/libntirpc.url "${srcdir}/ntirpc"
  git -c protocol.file.allow=always submodule update

  cd src/libntirpc/src/monitoring
  git config submodule.src/monitoring/prometheus-cpp-lite.url "${srcdir}/prometheus-cpp-lite"
  git -c protocol.file.allow=always submodule update
}

build() {
  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

  local _flags=(
    -DUSE_MAN_PAGE=ON
    -DUSE_RADOS_RECOV=OFF
    -DRADOS_URLS=OFF
    -DUSE_FSAL_LUSTRE=OFF
    -DUSE_FSAL_LIZARDFS=OFF
    -DUSE_FSAL_CEPH=OFF
    -DUSE_FSAL_GLUSTER=OFF
    -DUSE_FSAL_KVSFS=OFF
    -DUSE_FSAL_RGW=OFF
  )

  cmake -B build -S "nfs-ganesha/src" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
