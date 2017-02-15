# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bob Fanger < bfanger(at)gmail >
# Contributor: Filip <fila pruda com>, Det < nimetonmaili(at)gmail >
# PF ver   : wangjiezhe <wangjiezhe AT yandex DOT com>

_pkgname=r8168
_kernver=$(pacman -Q linux-pf | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
pkgname=r8168-pf
pkgver=8.044.02
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards(pf kernel)"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' "linux-pf>=$_kernver" "linux-pf<${_kernver/.*}.$(expr ${_kernver/*.} + 1)")
makedepends=('linux-pf-headers')
install=$_pkgname.install
source=("$_pkgname-$pkgver.tar.gz"::"https://github.com/mtorromeo/r8168/archive/$pkgver.tar.gz")
sha256sums=('aad7bccc4f625c35abe0455b2a6271e9938b76b46e11b24b4f138eb5c95db6d3')

KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-pf/version)

build() {
        cd "$_pkgname-$pkgver"

        # avoid using the Makefile directly -- it doesn't understand
        # any kernel but the current.
        make -C /usr/lib/modules/$KERNEL_VERSION/build \
                        SUBDIRS="$srcdir/$_pkgname-$pkgver/src" \
                        EXTRA_CFLAGS="-DCONFIG_R8168_NAPI -DCONFIG_R8168_VLAN" \
                        modules
}

package() {
        msg "Kernel = $KERNEL_VERSION"

        cd "$_pkgname-$pkgver"
        install -Dm644 src/$_pkgname.ko "$pkgdir/usr/lib/modules/extramodules-$_kernver-pf/$_pkgname.ko"
        find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

        sed -i "s|extramodules-.*-pf|extramodules-$_kernver-pf|" "$startdir/$_pkgname.install"
}
