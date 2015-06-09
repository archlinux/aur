# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: AndyRTR <andyrtr@archlinux.org>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>

# Based on Arch Linux commit cb7a719a37be491d9129ce852b94b6d99d783be9

_use_ubuntu_source=true

pkgname=xf86-video-intel-mir
_ubuntu_ver='2.99.916+git20141119'
_ubuntu_rel='1~exp1ubuntu1'
pkgver=2.99.917
pkgrel=1
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=(custom)
groups=(xorg-drivers xorg)
depends=(`# mesa-dri` mesa-mir libxvmc pixman 'xcb-util>=0.3.9')
makedepends=(xorg-server-devel-mir 'X-ABI-VIDEODRV_VERSION=18' libx11
             libxrender
             # additional deps for intel-virtual-output
             libxrandr libxinerama libxcursor libxtst)
makedepends+=('xorg-server-mir')
optdepends=('libxrandr: for intel-virtual-output'
            'libxinerama: for intel-virtual-output'
            'libxcursor: for intel-virtual-output'
            'libxtst: for intel-virtual-output')
replaces=(xf86-video-intel-uxa xf86-video-intel-sna)
provides=(xf86-video-intel-uxa xf86-video-intel-sna)
conflicts=('xorg-server<1.16' 'X-ABI-VIDEODRV_VERSION<18'
           'X-ABI-VIDEODRV_VERSION>=19' xf86-video-intel-sna
           xf86-video-intel-uxa xf86-video-i810 xf86-video-intel-legacy)
provides+=("xf86-video-intel=${pkgver}")
conflicts+=(xf86-video-intel)
install=xf86-video-intel.install

if [[ "${_use_ubuntu_source}" == "true" ]]; then
    source=("https://launchpad.net/ubuntu/+archive/primary/+files/xserver-xorg-video-intel_${_ubuntu_ver:-${pkgver}}.orig.tar.gz")
else
    source=(${url}/archive/individual/driver/xf86-video-intel-${pkgver}.tar.bz2)
fi

source+=("https://launchpad.net/ubuntu/+archive/primary/+files/xserver-xorg-video-intel_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.diff.gz")
sha512sums=('3a9f91e93df6f4b4635cae39ac840c8e56c44c0e00d61b92ffdf11feffa639cd83f5128c122ae532db44f4beced9d25ea77f5826aa4951a367a5996b844e6755'
            'e55fad54307e00664e52eab74ada833a82f744309c87228842cee5eeaea77161ffcda3d6ef9c3e75b4bf13e9f7bb09daaa9be1bba1f1b3d6b8c7b5c477603557')

cd_src() {
    if [[ "${_use_ubuntu_source}" == "true" ]]; then
        cd "xserver-xorg-video-intel-${_ubuntu_ver:-${pkgver}}"
    else
        cd "xf86-video-intel-${pkgver}"
    fi
}

prepare() {
    cd_src

    # Apply Ubuntu's patches
    patch -p1 -i "../xserver-xorg-video-intel_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.diff"

    for i in $(grep -v '#' debian/patches/series); do
        msg "Applying ${i} ..."
        patch -p1 -i "debian/patches/${i}"
    done
}

build() {
    cd_src
    autoreconf -vfi
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make
}

check() {
    cd_src
    make check
}

package() {
    cd_src

    make DESTDIR="${pkgdir}" install

    install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}/
    install -m644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/
}
