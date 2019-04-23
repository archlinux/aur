# Maintainer:  Bernhard Landauer <oberon@manjaro.org>
# Contributor: Morgan Cox <morgancoxuk@gmail.com>
# Contributor: AudioLinux <audiolinux AT fastmail DOT fm>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-rt
pkgver=418.56
_extramodules=extramodules-rt
pkgrel=2
pkgdesc="NVIDIA drivers for linux-rt"
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('linux-rt>=5.0' "nvidia-utils=$pkgver" 'libgl')
makedepends=('linux-rt-headers>=5.0' 'linux-rt-headers<5.1')
license=('custom')
options=(!strip)
install=$pkgname.install
source_x86_64=("http://download.nvidia.com/XFree86/Linux-x86_64/$pkgver/NVIDIA-Linux-x86_64-$pkgver.run")
md5sums_x86_64=('d1cf6dc33af48b53edbae5d6f31a6f89')

_pkg="NVIDIA-Linux-x86_64-$pkgver"

prepare() {
    sh "$_pkg.run" --extract-only
    cd "$_pkg"
    sed -i -e 's|PREEMPT_RT_PRESENT=1|PREEMPT_RT_PRESENT=0|g' kernel/conftest.sh
    export IGNORE_CC_MISMATCH=1
}

build() {
    _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
    cd "$_pkg"/kernel
    make SYSSRC=/usr/lib/modules/"$_kernver/build" module
}

package() {
    install -D -m644 "$srcdir/$_pkg/kernel/nvidia.ko" \
        "$pkgdir/usr/lib/modules/$_extramodules/nvidia.ko"
    install -D -m644 "$srcdir/$_pkg/kernel/nvidia-modeset.ko" \
         "$pkgdir/usr/lib/modules/$_extramodules/nvidia-modeset.ko"
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-drm.ko" \
         "$pkgdir/usr/lib/modules/$_extramodules/nvidia-drm.ko"
    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "$srcdir/$_pkg/kernel/nvidia-uvm.ko" \
            "$pkgdir/usr/lib/modules/$_extramodules/nvidia-uvm.ko"
    fi
    gzip "$pkgdir/usr/lib/modules/$_extramodules/"*.ko
    
    install -d -m755 "$pkgdir/usr/lib/modprobe.d"
    echo "blacklist nouveau" >> "$pkgdir/usr/lib/modprobe.d/_pkgname.conf"
}
