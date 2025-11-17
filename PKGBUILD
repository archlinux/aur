# Maintainer: Ricardo Urrea <ricardo.urrea@gmail.com>

pkgname=open-vm-tools-git
pkgver=13.0.5
pkgrel=2
pkgdesc="Open VMware Tools for Linux guests (running Wayland only)"
arch=('x86_64' 'aarch64')
url="https://github.com/vmware/open-vm-tools"
license=('GPL-2.0-only' 'LGPL-2.1-only')
install=open-vm-tools-git.install
depends=(
    'fuse3'
    'glib2'
    'icu'
    'iproute2'
    'libdnet'
    'libmspack'
    'libsigc++'
    'libxcrypt'
    'libxml2'
    'lsb-release'
    'procps-ng'
    'uriparser'
    'xmlsec'
)
makedepends=(
    'glib2-devel'
    'pkg-config'
    'python'
    'rpcsvc-proto'
)
optdepends=(
    'netctl: for automated network configuration'
    'networkmanager: for automated network configuration'
)
backup=(
    'etc/pam.d/vmtoolsd'
)
source=(
    "https://github.com/vmware/open-vm-tools/archive/refs/tags/stable-${pkgver}.tar.gz"
    "vmtoolsd.service"
    "vmware-vmblock-fuse.service"
    "vmware-mnt-hgfs.mount"
)
sha256sums=('9d4aa767c2b2acec2d56bb50546ef1bb59283e608444d50ef55c97afcd445457'
            'd188f0355c2b8e8b87320d7f1d99465cc40daa569bbdf2b49c0033ed9a89b30f'
            'f4daa3a8cf3ed0218fd2bf16d5d60408227938a2bf3cd8762f9ba6e9251fafdb'
            '023469d60c873a76346ac9c2337cbc25f15c6bb6b2f0d7fc10c74d6faf8ecae1')

prepare() {
    cd "open-vm-tools-stable-${pkgver}/open-vm-tools"
    
    # Run autoreconf to generate configure script from git tags
    autoreconf -vif
}

build() {
    cd "open-vm-tools-stable-${pkgver}/open-vm-tools"
    
    # Export ICU flags explicitly for linking
    export ICU_CFLAGS="$(pkg-config --cflags icu-i18n icu-uc)"
    export ICU_LIBS="$(pkg-config --libs icu-i18n icu-uc)"
    export LDFLAGS="${LDFLAGS} $(pkg-config --libs icu-i18n icu-uc)"
    
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --with-dnet \
        --with-fuse=fuse3 \
        --with-icu \
        --with-procps \
        --with-udev-rules-dir=/usr/lib/udev/rules.d \
        --without-kernel-modules \
        --without-xmlsecurity \
        --without-x \
        --without-gtk2 \
        --without-gtk3 \
        --without-gtkmm
    
    make
}

check() {
    cd "open-vm-tools-stable-${pkgver}/open-vm-tools"
    make check || warning "Tests failed"
}

package() {
    cd "open-vm-tools-stable-${pkgver}/open-vm-tools"
    
    make DESTDIR="${pkgdir}" install
    
    # Install systemd service units
    install -Dm644 "${srcdir}/vmtoolsd.service" \
        "${pkgdir}/usr/lib/systemd/system/vmtoolsd.service"
    install -Dm644 "${srcdir}/vmware-vmblock-fuse.service" \
        "${pkgdir}/usr/lib/systemd/system/vmware-vmblock-fuse.service"
    install -Dm644 "${srcdir}/vmware-mnt-hgfs.mount" \
        "${pkgdir}/etc/systemd/system/vmware-mnt-hgfs.mount"
    
    # Install PAM configuration from upstream
    install -Dm644 pam/generic "${pkgdir}/etc/pam.d/vmtoolsd"

    # Create mount point for shared folders
    install -dm755 "${pkgdir}/mnt/hgfs"
    
    # Remove unnecessary documentation
    rm -rf "${pkgdir}/usr/share/doc"
}
