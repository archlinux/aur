# Maintainer: bobi

pkgname=vma-git
pkgver=9.2.0
pkgrel=1
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
    'dtc'
    'git'
    'libcacard'
    'libepoxy'
    'libproxmox-backup-qemu0-dev'
    'meson'
    'ninja'
    'numactl'
    'opengl-driver'
    'openssl-1.1'
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
    'numactl'
    'openssl-1.1' 
)

arch=('x86_64')
sha256sums=('SKIP'
            'c4246790d1795e73c9d35fc257e9bba356d71c3fb8e68fac7a18a0357716b965'
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
