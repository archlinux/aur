# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: buddabrod <buddabrod@gmail.com>

# Based on Arch Linux commit: 6f96a0802f2f372c97242e3a80c6cf5c61faaf36

pkgname=xf86-video-nouveau-mir
_ubuntu_rel=1ubuntu2
pkgver=1.0.11
pkgrel=1
pkgdesc="Open Source 2D acceleration driver for nVidia cards"
arch=(i686 x86_64)
url="http://nouveau.freedesktop.org/"
license=(GPL)
depends=(libdrm systemd `# mesa-dri` mesa-mir)
makedepends=(xorg-server-devel-mir 'X-ABI-VIDEODRV_VERSION=18')
makedepends+=(xorg-server-mir)
conflicts=('xorg-server<1.16' 'X-ABI-VIDEODRV_VERSION<18'
           'X-ABI-VIDEODRV_VERSION>=19')
provides+=("xf86-video-nouveau=${pkgver}")
conflicts+=(xf86-video-nouveau)
groups=(xorg-drivers xorg)
install=xf86-video-nouveau.install
source=("http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-${pkgver}.tar.bz2"
        "https://launchpad.net/ubuntu/+archive/primary/+files/xserver-xorg-video-nouveau_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.diff.gz")
sha512sums=('4ceffc711798b98a5ee67d9df33d1a4f1d2b7d100605ea04b2e689debf745bc5a4f8907b602d1689ec6ed6400b2fc0ffe0eb0f7e7787bd2dd3cd5db1d14e90ee'
            'e8fd38364a549ea794297e066e22566c759c4d3650744fb462c91f003ce7e6d4806790ba38ca334f320d9d992412e257235988bd83a05216af6b5c5c69cf3303')

prepare() {
    cd "xf86-video-nouveau-${pkgver}"

    # Apply Ubuntu's patches
    patch -p1 -i "../xserver-xorg-video-nouveau_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.diff"
    for i in $(grep -v '#' debian/patches/series); do
        patch -p1 -i "debian/patches/${i}"
    done
}

build() {
    cd "xf86-video-nouveau-${pkgver}"
    autoreconf -vfi
    ./configure --prefix=/usr
    make
}

package() {
    cd "xf86-video-nouveau-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
