# Maintainer: Jan Houben <jan@nexttrex.de>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgbase="zfs-dkms-git"
pkgname=("zfs-dkms-git")
pkgver=0.7.0_r1575_g93491c4bb
pkgrel=1
license=('CDDL')
makedepends=("git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/zfs.git"
        "zfs-utils.bash-completion-r1"
        "zfs-utils.initcpio.install"
        "zfs-utils.initcpio.hook")
sha256sums=('SKIP'
            'b60214f70ffffb62ffe489cbfabd2e069d14ed2a391fac0e36f914238394b540'
            '335e309ebf5b74fd8956f5e8805939c37d4008b0bcc3b00be6e7ef1d5b7c1669'
            '290b18f538badce2eedd4ac4926a579535ec6c887436569fa6ff3685b55776bf')

pkgver() {
    cd "${srcdir}/zfs"
    git describe --match "zfs-*" --long --tags | sed -e 's|zfs-||' -e 's|-\([0-9]*-g\)|-r\1|' -e 's|[-: ]|_|g'
}

build() {
    cd "${srcdir}/zfs"
    ./autogen.sh

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --sbindir=/usr/bin \
                --with-mounthelperdir=/usr/bin \
                --libdir=/usr/lib \
                --datadir=/usr/share \
                --includedir=/usr/include \
                --with-udevdir=/usr/lib/udev \
                --libexecdir=/usr/lib/zfs \
                --with-config=user \
                --enable-systemd
    make
}

package() {
    pkgdesc="Kernel modules for the Zettabyte File System. (Git version)"
    depends=("zfs-utils-git=${pkgver}-${pkgrel}" "dkms" "lsb-release")
    provides=("zfs" "spl")
    conflicts=("zfs-git" "zfs-lts" "zfs-dkms" "spl-dkms-git")
    replaces=("spl-dkms-git")

    dkmsdir="${pkgdir}/usr/src/zfs-${pkgver%%_*}"
    install -d "${dkmsdir}"
    cp -a ${srcdir}/zfs/. ${dkmsdir}

    cd "${dkmsdir}"
    make clean
    make distclean
    find . -name ".git*" -print0 | xargs -0 rm -fr --
    scripts/dkms.mkconf -v ${pkgver%%_*} -f dkms.conf -n zfs
    chmod g-w,o-w -R .
}
