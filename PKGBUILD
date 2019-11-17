_pkgname=bitbucket
pkgname=atlassian-${_pkgname}
pkgver=6.8.0
pkgrel=1
pkgdesc="Bitbucket Server"
url="https://www.atlassian.com/software/${_pkgname}/server"
license=("custom")
arch=("i686" "x86_64")
depends=("java-runtime"
        "git>=1.8.0"
        "perl>=5.8.8")
optdepends=("haveged: Entropy for the ssh plugin" )
backup=("var/lib/${_pkgname}/shared/${_pkgname}.properties"
	"etc/systemd/system/${_pkgname}.service.d/local.conf"
	"var/lib/bitbucket/server.xml"
        "etc/${_pkgname}/server.xml")
install="$pkgname.install"
source=("https://atlassian.com/software/stash/downloads/binary/${pkgname}-${pkgver}.tar.gz"
        "${_pkgname}.service"
        "${_pkgname}.tmpfiles"
	"${_pkgname}.sysusers")

package() {
    install -dm750 "$pkgdir/var/lib/${_pkgname}"
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    cp -r "$srcdir/atlassian-${_pkgname}-$pkgver/licenses/"* "$pkgdir/usr/share/licenses/$pkgname"
    cp -r "$srcdir/atlassian-${_pkgname}-$pkgver/"* "$pkgdir/opt/$pkgname"
    install -dm750 "$pkgdir/etc/${_pkgname}"
    #install -Dm755 "$pkgdir/opt/$pkgname/conf/server.xml" "$pkgdir/etc/${_pkgname}/server.xml"
    #rm "$pkgdir/opt/$pkgname/conf/server.xml"
    ln -s "/etc/${_pkgname}/server.xml" "$pkgdir/var/lib/${_pkgname}/server.xml"
    # remove unneeded Windows files
    find "$pkgdir/opt/$pkgname/bin" -name "*.bat" -type f -exec rm "{}" \;
    find "$pkgdir/opt/$pkgname/bin" -name "*.exe" -type f -exec rm "{}" \;

    # setup systemd service
    install -Dm644 "$srcdir/${_pkgname}.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "$srcdir/${_pkgname}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
    install -Dm644 "$srcdir/${_pkgname}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
}

md5sums=('8b032214e26daae913be089c996436fe'
         '5ec83b341eb186731b0fce80b1ed3aa3'
         'ba53070cb05fe18c5c04a0860b139938'
         'ed617ba7cf3f829ef3bcbe9cc558c4d7')
