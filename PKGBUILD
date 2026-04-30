# Maintainer: Joschka Thurner <git@joschkathurner.de>
pkgname=docker-sbx
pkgver=0.28.3
pkgrel=1
pkgdesc="Docker sandboxes - isolated VM-based container execution using nerdbox/krun"
arch=('x86_64')
url="https://docs.docker.com/sandbox/"
license=('LicenseRef-Docker-Proprietary' 'GPL-2.0-only' 'Apache-2.0')
depends=()
optdepends=(
    'apparmor: AppArmor profile for nerdbox shim confinement (recommended)'
)
provides=('sbx')
conflicts=('sbx')
options=('!debug')
source=("https://download.docker.com/linux/ubuntu/dists/noble/pool/stable/amd64/${pkgname}_${pkgver}-1~ubuntu.24.04~noble_amd64.deb")
sha256sums=('167b4c25222b3e7491be8ac345503778cfd7f0267dab67ba2d6b245131705d68')

prepare() {
    tar -xf data.tar.xz
    gunzip -f usr/share/doc/docker-sbx/THIRD-PARTY-NOTICES.gz
}

package() {

    install -Dm755 $srcdir/usr/bin/sbx \
        "$pkgdir/usr/bin/sbx"

    install -Dm755 $srcdir/usr/libexec/containerd-shim-nerdbox-v1 \
        "$pkgdir/usr/libexec/containerd-shim-nerdbox-v1"
    install -Dm755 $srcdir/usr/libexec/mkfs.erofs \
        "$pkgdir/usr/libexec/mkfs.erofs"
    install -Dm644 $srcdir/usr/libexec/nerdbox-kernel-x86_64 \
        "$pkgdir/usr/libexec/nerdbox-kernel-x86_64"
    install -Dm644 $srcdir/usr/libexec/nerdbox-initrd-x86_64 \
        "$pkgdir/usr/libexec/nerdbox-initrd-x86_64"
    install -Dm755 $srcdir/usr/libexec/lib/libkrun.so \
        "$pkgdir/usr/libexec/lib/libkrun.so"

    install -Dm644 $srcdir/etc/apparmor.d/docker-sbx-nerdbox-shim \
        "$pkgdir/etc/apparmor.d/docker-sbx-nerdbox-shim"

    install -Dm644 $srcdir/usr/share/doc/docker-sbx/copyright \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 $srcdir/usr/share/doc/docker-sbx/THIRD-PARTY-NOTICES \
        "$pkgdir/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES"
}
