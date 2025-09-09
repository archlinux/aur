# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: keutain
# Contributor: Funami
# Contributor: Lorenzo Fontana <lo@linux.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Tristan Hill


_pkgauthor=coredns
_pkgname=coredns
pkgname=${_pkgname}-bin
pkgver=1.12.4
pkgrel=1
pkgdesc="A DNS server that chains plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('Apache-2.0')
provides=($pkgname)
conflicts=($pkgname)
backup=('etc/coredns/Corefile')
source=('Corefile'
        'coredns.service'
        'coredns-sysusers.conf'
        "${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=(coredns_${pkgver}_x86_64.tar.gz::https://github.com/coredns/coredns/releases/download/v${pkgver}/coredns_${pkgver}_linux_amd64.tgz)
source_aarch64=(coredns_${pkgver}_aarch64.tar.gz::https://github.com/coredns/coredns/releases/download/v${pkgver}/coredns_${pkgver}_linux_arm64.tgz)
sha256sums=('a1cf457df75c9cadc5653cea2471281dc087d727ed784d3558ef76a4a2c31eff'
            '030cd8e938c293c11a9acdb09b138f98b37874772072336792ec4bf0d9eff9b1'
            'e3cc35967f12c8bca2961f4d98413958649072492fe37052249a8cbcd2313ed1'
            '39713a5bfd6fd1a2df1caa7a8296c4327e48c51e964c83d5fea4ed3a5ba4df9f')
sha256sums_x86_64=('46dcee6d9b406310a2dbf793e414c4a999317ddacbdfc307215a006144592f8f')
sha256sums_aarch64=('67fdaa45b622eed5d969aad300ce28d37b42da60010672b90fde41e1dceefcaa')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "$srcdir/$_pkgname-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "$srcdir/Corefile" "$pkgdir/etc/$_pkgname/Corefile"

    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/$_pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    for file in "$srcdir/$_pkgname-$pkgver/man/"*; do
        man=`basename $file`
        section=${file##*.}

        install -Dm644 "$file" "$pkgdir/usr/share/man/man$section/$man"
        gzip "$file"
    done
}
