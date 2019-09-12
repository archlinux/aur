# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Jan Houben <jan@nexttrex.de>
# Contributor: Jesus Alvarez <jeezusjr at gmail dot com>

pkgname="zfs-dkms-head-git"
pkgdesc="Kernel modules for the Zettabyte File System."
pkgver=0.8.0.r270.gd66620681
pkgrel=1
makedepends=("git")
arch=("x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/zfs.git")
sha256sums=("SKIP")
license=("CDDL")
depends=("zfs-utils-head-git" "lsb-release" "dkms")
provides=("zfs-git" "zfs" "zfs-headers" "spl" "spl-headers")
groups=("zfs-head-git")
conflicts=("zfs-git" "zfs" "zfs-headers" "spl" "spl-headers")
replaces=("spl-dkms-git")

pkgver() {
  cd "${srcdir}/zfs"
  git describe --long --tags | sed 's/^zfs.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/zfs"
    ./autogen.sh
}

package() {
    dkmsdir="${pkgdir}/usr/src/zfs-git"
    install -d "${dkmsdir}"
    cp -a ${srcdir}/zfs/. ${dkmsdir}
    cd "${dkmsdir}"
    find . -name ".git*" -print0 | xargs -0 rm -fr --
    scripts/dkms.mkconf -v git -f dkms.conf -n zfs
    chmod g-w,o-w -R .
}
