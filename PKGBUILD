# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=zfs-utils
pkgver=0.8.3
pkgrel=1
pkgdesc="Userspace utilities for the Zettabyte File System."
arch=("i686" "x86_64")
url="https://zfsonlinux.org/"
license=('CDDL')
optdepends=('python: for arcstat/arc_summary/dbufstat')
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-${pkgver}/zfs-${pkgver}.tar.gz"{,.asc}
        "zfs.initcpio.install"
        "zfs.initcpio.hook")
sha256sums=('545a4897ce30c2d2dd9010a0fdb600a0d3d45805e2387093c473efc03aa9d7fd'
            'SKIP'
            'da1cdc045d144d2109ec7b5d97c53a69823759d8ecff410e47c3a66b69e6518d'
            'f95ad1a5421ccbb8b01f448373f46cfd1f718361a82c2687a597325cf9827e3e')
b2sums=('8b51b9d5b61543566bc7839d8452fdf9358442155e95f93a011531338824bbd4fc8879500e276b02d5d49d504a046728ecc0c6154f69eb7b47180b9bb0e46958'
        'SKIP'
        '570e995bba07ea0fb424dff191180b8017b6469501964dc0b70fd51e338a4dad260f87cc313489866cbfd1583e4aac2522cf7309c067cc5314eb83c37fe14ff3'
        '491a7f20b0c6b4ce4fcedab617b2d7a4f2a01f1bc8f1ae57efde2fb22c2ab09a1107a8f4877b95c27576fe4216d01f181936787f51ce532bb13c5806badf7519')
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>

prepare() {
    cd "${srcdir}"/zfs-${pkgver}

    # pyzfs is not built, but build system tries to check for python anyway
    ln -sf /bin/true python3-fake
}

build() {
    cd "${srcdir}"/zfs-${pkgver}

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --sbindir=/usr/bin \
                --with-mounthelperdir=/usr/bin \
                --libdir=/usr/lib \
                --datadir=/usr/share \
                --includedir=/usr/include \
                --with-udevdir=/usr/lib/udev \
                --libexecdir=/usr/lib/zfs \
                --with-python="$PWD/python3-fake" \
                --enable-pyzfs=no \
                --with-config=user
    make
}

package() {
    cd "${srcdir}"/zfs-${pkgver}

    make DESTDIR="${pkgdir}" install
    install -D -m644 contrib/bash_completion.d/zfs "${pkgdir}"/usr/share/bash-completion/completions/zfs

    # Remove uneeded files
    rm -r "${pkgdir}"/etc/init.d
    rm -r "${pkgdir}"/etc/sudoers.d #???
    # We're experimenting with dracut in [extra], so start installing this.
    #rm -r "${pkgdir}"/usr/lib/dracut
    rm -r "${pkgdir}"/usr/lib/modules-load.d
    rm -r "${pkgdir}"/usr/share/initramfs-tools
    rm -r "${pkgdir}"/usr/share/zfs

    install -D -m644 "${srcdir}"/zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/zfs
    install -D -m644 "${srcdir}"/zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/zfs
}
