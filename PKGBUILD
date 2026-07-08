# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=nfs-ganesha-git
pkgver=11.1.r0.gd337b14c4
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
    glibc
    jemalloc
    krb5
    libcap
    libgcc
    libprocps
    libstdc++
    libunwind
    liburcu
    libwbclient
    nfsidmap
    openssl
    #rdma-core
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
provides=(nfs-ganesha)
conflicts=(nfs-ganesha)
source=("git+https://github.com/nfs-ganesha/nfs-ganesha.git"
        "git+https://github.com/nfs-ganesha/ntirpc.git"
        "git+https://github.com/biaks/prometheus-cpp-lite.git"
        )
sha256sums=('SKIP'
            'SKIP'
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
