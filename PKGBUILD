# Maintainer: Lin Evelynn <lin@sz.cn.eu.org>
pkgname=incy-bin
_pkgname=incy
pkgver=3.7.2
pkgrel=1
pkgdesc="Cross-platform proxy client built on Xray-core"
arch=('x86_64')
url="https://incy.cc/"
license=('LicenseRef-proprietary')
depends=('glibc' 'hicolor-icon-theme' 'fontconfig' 'libx11'
         'libxext' 'libxrender' 'libxtst' 'libxi' 'alsa-lib'
         'gcc-libs' 'libglvnd' 'polkit')
makedepends=('gcc' 'patchelf')
optdepends=('iptables: kill switch support'
            'libnotify: desktop notifications'
            'python-gobject: Wayland tray support'
            'libayatana-appindicator: Wayland tray support')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
install=incy-bin.install

source=("${_pkgname}-${pkgver}-linux-x64.pkg.tar.zst::https://github.com/INCY-DEV/incy-platforms/releases/download/desktop-v${pkgver}/incy-linux-x64.pkg.tar.zst"
        "fix-xatom.c")
sha256sums=('584e9036987e417a10faa2e2c7e34fc4dbe68cc98afbb33f7eb212b1757d0820'
            'd821ef0eb09c7868faae25390dad7d847cc1d94fbb6d5432b09ae965068466cc')


build() {
    gcc -shared \
        -fPIC \
        "$srcdir/fix-xatom.c" \
        -o libfix-xatom.so \
        -lX11 \
        -ldl
}

package() {
    # Extract upstream tarball
    install -dm755 "$pkgdir/opt"
    cp -a --no-preserve=ownership "$srcdir/opt/incy" "$pkgdir/opt/"
    install -dm755 "$pkgdir/usr"
    cp -a --no-preserve=ownership "$srcdir/usr/bin" "$pkgdir/usr/"
    cp -a --no-preserve=ownership "$srcdir/usr/share" "$pkgdir/usr/"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    echo "Proprietary. See: https://incy.cc/licenses" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install X11 clipboard atom-0 workaround directly into Java runtime
    # Prevents JDK NullPointerException in XAtom.getName() when atom=0
    # Patches libawt_xawt.so with DT_NEEDED so it loads without LD_PRELOAD
    install -Dm755 "$srcdir/libfix-xatom.so" "$pkgdir/opt/incy/lib/runtime/lib/libfix-xatom.so"
    patchelf --add-needed libfix-xatom.so "$pkgdir/opt/incy/lib/runtime/lib/libawt_xawt.so"

    # PolKit action policy — authorises /usr/lib/incy/incy-helper-linux.sh
    install -Dm644 "$srcdir/opt/incy/lib/app/resources/cc.incy.vpn.policy" \
        "$pkgdir/usr/share/polkit-1/actions/cc.incy.vpn.policy"

    # Symlink helper to the path the policy's exec.path expects
    install -dm755 "$pkgdir/usr/lib/incy"
    ln -sf /opt/incy/lib/app/resources/bin/incy-helper-linux.sh \
        "$pkgdir/usr/lib/incy/incy-helper-linux.sh"
}
