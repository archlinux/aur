# Maintainer: bobi

pkgname=vma-git
pkgver=7.2.0
pkgrel=2
pkgdesc='Virtual Machine Archive format (VMA)'
provides=('vma')

license=('AGPL')

pveqemu='pve-qemu'

url="https://pve.proxmox.com/wiki/VMA"

dpkgdiff="dpkg.diff"

source=(
    "git://git.proxmox.com/git/${pveqemu}.git"
    "${dpkgdiff}"
    "git://git.proxmox.com/git/mirror_qemu.git"
)

makedepends=(
    'alsa-lib'
    'debhelper'
    'dpkg'
    'git'
    'libcacard'
    'libepoxy'
    'libproxmox-backup-qemu0-dev'
    'ninja'
    'numactl'
    'opengl-driver'
    'perl-json'
    'pixman'
    'python-sphinx_rtd_theme'
    'rustup'
    'spice'
    'spice-protocol'
    'usbredir'
    'virglrenderer'
    'xfsprogs'
)

depends=(
    'ceph-libs'
    'glusterfs'
    'libaio'
    'libiscsi'
    'libproxmox-backup-qemu0'
    'liburing'
)

arch=('x86_64')
sha256sums=('SKIP'
            'fc996fa25c79d307363986217de8d4f3a05f22eabbdd3a67ce09b732bd625a75'
            'SKIP')

pkgver () {
    cd "${srcdir}/${pveqemu}"
    printf "include /usr/share/dpkg/pkg-info.mk\ndvu:\n\techo \${DEB_VERSION_UPSTREAM}\n" > DVUMakefile
    make -sfDVUMakefile dvu
}
                
build () {
    cp "${dpkgdiff}" "${srcdir}/${pveqemu}"
    cd "${srcdir}/${pveqemu}"
    
    git apply "${dpkgdiff}"
    
    make submodule

    builddir="pve-qemu-kvm-${pkgver}"
    make "${builddir}"
    cd "${builddir}"

    dpkg-source --before-build .
    fakeroot debian/rules clean
    fakeroot debian/rules build/config.status

    cd build

    ninja vma
}

package () {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/${pveqemu}/pve-qemu-kvm-${pkgver}/build/vma" "${pkgdir}/usr/bin/"
}
