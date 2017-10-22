# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=hyperd
pkgver=0.8.1
pkgrel=1
pkgdesc="Hypervisor-agnostic Docker Runtime"
arch=('i686' 'x86_64')
url="https://www.hypercontainer.io/"
license=('Apache')
depends=('libvirt')
makedepends=('device-mapper' 'sqlite3' 'libvirt' 'go')
optdepends=('hyperstart: boot files for hyperd instances')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hyperhq/${pkgname}/archive/v${pkgver}.tar.gz"
        'btrfs-progs-4.5.diff')
sha256sums=('4b82884cbc75115006000f755e1ad5833309911c6d020977d874dffb0882628f'
            '12fe84f2711fdcb35811765d5efb117e947a893c11fdc2e6f1e060e63917ee9d')

prepare() {
    cd "${pkgname}-${pkgver}"
    # https://github.com/hyperhq/hyperd/issues/643
    # https://github.com/moby/moby/commit/a038cccf88998814249a7a40b71a33a680e3f02f
    patch -Np0 -i "${srcdir}/btrfs-progs-4.5.diff"
}

build() {
    cd "${pkgname}-${pkgver}"
    local _srcpath="src/github.com/hyperhq/"
    export GOPATH="${srcdir}"
    install -d "$GOPATH/$_srcpath"
    ln -sf "$(pwd)" "$GOPATH/$_srcpath/hyperd"
    cd "$GOPATH/$_srcpath/hyperd"

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"

    install -D hyperctl "${pkgdir}/usr/bin/hyperctl"
    install    hyperd   "${pkgdir}/usr/bin/hyperd"
    install    vmlogd   "${pkgdir}/usr/bin/vmlogd"
    install -D -m644 package/dist/etc/hyper/config "${pkgdir}/etc/hyper/config"
    install -D -m644 package/dist/lib/systemd/system/hyperd.service "${pkgdir}/usr/lib/systemd/system/hyperd.service"
    install    -m644 package/dist/lib/systemd/system/hyper-vmlogd.service "${pkgdir}/usr/lib/systemd/system/hyper-vmlogd.service"
}
