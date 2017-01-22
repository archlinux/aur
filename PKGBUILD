_pkgname=bitbucket
pkgname=atlassian-${_pkgname}
pkgver=4.13.0
pkgrel=1
pkgdesc="Bitbucket Server"
url="https://www.atlassian.com/software/${_pkgname}/server"
license=("custom")
arch=("i686" "x86_64")
depends=("java-runtime=8"
        "git>=1.8.0"
        "perl>=5.8.8")
optdepends=("haveged: Entropy for the ssh plugin" )
backup=("etc/systemd/system/${_pkgname}.service.d/local.conf"
        "etc/${_pkgname}/server.xml")
install="$pkgname.install"
source=("https://atlassian.com/software/stash/downloads/binary/${pkgname}-${pkgver}.tar.gz"
        "${_pkgname}.service"
        "${_pkgname}.tmpfiles"
        "${_pkgname}.sysusers"
        "local.conf")

package() {
    install -dm750 "$pkgdir/var/lib/${_pkgname}"
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    cp -r "$srcdir/atlassian-${_pkgname}-$pkgver/licenses/"* "$pkgdir/usr/share/licenses/$pkgname"
    cp -r "$srcdir/atlassian-${_pkgname}-$pkgver/"* "$pkgdir/opt/$pkgname"
    install -Dm755 "$pkgdir/opt/$pkgname/conf/server.xml" "$pkgdir/etc/${_pkgname}/server.xml"
    rm "$pkgdir/opt/$pkgname/conf/server.xml"
    ln -s "/etc/${_pkgname}/server.xml" "$pkgdir/var/lib/${_pkgname}/server.xml"
    # remove unneeded Windows files
    find "$pkgdir/opt/$pkgname/bin" -name "*.bat" -type f -exec rm "{}" \;
    find "$pkgdir/opt/$pkgname/bin" -name "*.exe" -type f -exec rm "{}" \;


    # setup systemd service
    install -Dm644 "$srcdir/${_pkgname}.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "$srcdir/local.conf" "$pkgdir/etc/systemd/system/${_pkgname}.service.d/local.conf"
    install -Dm644 "$srcdir/${_pkgname}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
    install -Dm644 "$srcdir/${_pkgname}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
}

sha256sums=('c98f343f51f81db6ebb7cf3e84737b07cdc7e919aeb039fa1fe1fe638b69971a'
            'cdba0049a5ed6757aa469baa194383d51664f04f6a17e23e7f7e4935201ce629'
            'd7c7735e2b092b58c89c272ae1afe8122a51d2b8edc5c46ccdd470c29ef1cfc1'
            '4fd916cab8d0004678fca749d45858e265d0ab698b7d3a6de038a62b72a7c17f'
            '487d9067e07aa741b2ef2ce52e81d506c962ab59d3c31fd4876d7a4ee53573e2')
