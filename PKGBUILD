# Maintainer: Lin Evelynn <lin@sz.cn.eu.org>
pkgname=incy-bin
_pkgname=incy
pkgver=3.3.7
pkgrel=3
pkgdesc="Cross-platform proxy client built on Xray-core"
arch=('x86_64')
url="https://incy.cc/"
license=('LicenseRef-proprietary')
depends=('glibc' 'hicolor-icon-theme' 'fontconfig' 'libx11'
         'libxext' 'libxrender' 'libxtst' 'libxi' 'alsa-lib'
         'gcc-libs' 'libglvnd' 'polkit')
makedepends=('gcc')
optdepends=('iptables: kill switch support'
            'libnotify: desktop notifications'
            'python-gobject: Wayland tray support'
            'libayatana-appindicator: Wayland tray support')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')

source=("${_pkgname}-${pkgver}-linux-x64.pkg.tar.zst::https://github.com/INCY-DEV/incy-platforms/releases/download/desktop-v${pkgver}/incy-linux-x64.pkg.tar.zst"
        "fix-xatom.c")

sha256sums=('9f573e6fd57e609310137e10e6417a58f8f1cb0b54695a83e4b53bf20b05512d'
            'SKIP')


build() {
    gcc -shared \
        -fPIC \
        "$srcdir/fix-xatom.c" \
        -o fix-xatom.so \
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

    # Install X11 clipboard atom-0 workaround
    # Prevents JDK NullPointerException in XAtom.getName() when atom=0
    install -Dm755 "$srcdir/fix-xatom.so" "$pkgdir/opt/incy/lib/fix-xatom.so"
    # Create wrapper that injects LD_PRELOAD (don't rename original binary — it uses argv[0] for config)
    cat > "$pkgdir/opt/incy/bin/incy.wrapper" << WRAPPER
#!/usr/bin/env bash
export LD_PRELOAD="/opt/incy/lib/fix-xatom.so\${LD_PRELOAD:+:\$LD_PRELOAD}"
exec /opt/incy/bin/incy "\$@"
WRAPPER
    chmod +x "$pkgdir/opt/incy/bin/incy.wrapper"
    # Point desktop file at wrapper
    sed -i 's|Exec=/opt/incy/bin/incy\(.*\)|Exec=/opt/incy/bin/incy.wrapper\1|' "$pkgdir/usr/share/applications/incy.desktop"
}
