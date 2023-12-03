# Maintainer: Ivan Gabaldon <aur[at]inetol.net>

pkgname=termius-deb
pkgver=8.7.2
pkgrel=2
pkgdesc='SSH, SFTP, MOSH, telnet and serial in one beautiful app (deb release)'
arch=('x86_64')
url='https://termius.com'
license=('custom:proprietary')
makedepends=('links')
provides=("${pkgname//-deb}")
conflicts=("${pkgname//-deb}" "${pkgname//-deb/'-beta'}")
source=("${pkgname//-deb}-$pkgver.deb::https://web.archive.org/web/20231202224832/https://autoupdate.${pkgname//-deb}.com/linux/${pkgname//-deb}.deb"
        "${pkgname//-deb}.desktop")
b2sums=('50190e87de8f7875a2895b5a46525ba9b1100e69c199d4e529ed5cdf6fffa1a4e4e4fff1ef14daef6612da7a063148b46e69bc2d0474c69139d7d60ad32b9d0c'
        '788a7e6ff5957c98115e44725d1af7fb3f66b2168225464551390c15bbc7b259bf443545c919a7037cc36bad3a033916b33f538f73c012dcf27fc5c4c2b2a285')

prepare() {
    ## EULA
    links -width 80 -dump https://termius.com/terms-of-use | \
        sed -n '/Terms and Conditions/,/Last updated:/p' > "$srcdir/EULA.txt"

    ## Extract
    mkdir -p "${pkgname//-deb}-$pkgver/"
    bsdtar -xpf 'data.tar.xz' -C "${pkgname//-deb}-$pkgver/"

    mv "${pkgname//-deb}-$pkgver/opt/Termius/${pkgname//-deb}-app" "${pkgname//-deb}-$pkgver/opt/Termius/${pkgname//-deb}"
    mv "${pkgname//-deb}-$pkgver/usr/share/icons/hicolor/256x256/apps/${pkgname//-deb}-app.png" "$srcdir/${pkgname//-deb}.png"
}

package() {
    depends=('alsa-lib'
             'at-spi2-core'
             'cairo'
             'dbus'
             'expat'
             'gcc-libs'
             'glib2'
             'glibc'
             'gtk3'
             'hicolor-icon-theme'
             'libcups'
             'libdrm'
             'libsecret'
             'libx11'
             'libxcb'
             'libxcomposite'
             'libxdamage'
             'libxext'
             'libxfixes'
             'libxkbcommon'
             'libxrandr'
             'mesa'
             'nspr'
             'nss'
             'pango'
             'systemd-libs'
             'wayland'
             'zlib')

    install -d "$pkgdir/opt/${pkgname//-deb}/"
    cp -r "$srcdir/${pkgname//-deb}-$pkgver/opt/Termius/"* "$pkgdir/opt/${pkgname//-deb}/"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/${pkgname//-deb}/${pkgname//-deb}" "$pkgdir/usr/bin/${pkgname//-deb}"

    install -Dm644 "$srcdir/${pkgname//-deb}.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
    install -Dm644 "$srcdir/${pkgname//-deb}.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/EULA.txt" -t "$pkgdir/usr/share/licenses/${pkgname//-deb}/"
}
