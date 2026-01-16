# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: keutain
# Contributor: Funami
# Contributor: Lorenzo Fontana <lo@linux.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Tristan Hill


_pkgauthor=coredns
_pkgname=coredns
pkgname=${_pkgname}-bin
pkgver=1.14.1
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
            'ec814e2de304caaaabdbdc0c174e8f5e1668274d8c3da387d76cbb9b91faad66')
sha256sums_x86_64=('186ebc9a8025ad6661e566ae7beadba9a81063d5c30c39961d8dee16446417d5')
sha256sums_aarch64=('2784b6bde0f9caf17b462aefdc6d321d76fec7129bed1a2fce2c79c370b34878')

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
