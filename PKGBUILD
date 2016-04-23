# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=filebeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=1.2.1
pkgrel=1
pkgdesc='Collects, pre-processes, and forwards log files from remote sources (precompiled)'
arch=('i686' 'x86_64')
url="https://www.elastic.co/products/beats"
license=('APACHE')
backup=("etc/$_pkgbase/$_pkgbase.yml")
optdepends=('elasticsearch: for running standalone installation')
install="$_pkgbase.install"
options=('!strip')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase.install"
        "$_pkgbase.service"
        "$_pkgbase.sysusers")
sha256sums=('337d78d9cb21745098c4cc75578f026e5a5819cd4d0575e3f4241f13370c0863'
            '1b668b67134dcbca41193f7987371c6e9ead9853f3ebcb54d5c80a9d0b9decf0'
            '33feb3690f8b31563cc1e2da557c2aa326501ce9ccd7e0a142036902bfdb05ff')

source_i686=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$pkgver-i686.tar.gz")
source_x86_64=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums_i686=('9b69919fbad36e70451ecf37d7e9e2437770ed7e9b602717880a6b8813f53d33')
sha256sums_x86_64=('82a891b060651e85107bc70b923f84891f8b94f7a84f3d482d6d45219f1b6bbf')

prepare() {
    cd "$_pkgbase-$pkgver-$CARCH"

    sed -i 's@#registry_file: .filebeat@registry_file: /var/lib/filebeat/registry@' \
        filebeat.yml
}

package() {
    cd "$srcdir/$_pkgbase-$pkgver-$CARCH"

    mkdir -p "$pkgdir/var/lib/$_pkgbase"

    install -D -m755 $_pkgbase     "$pkgdir/usr/bin/$_pkgbase"
    install -D -m644 $_pkgbase.yml "$pkgdir/etc/$_pkgbase/$_pkgbase.yml"
    install -D -m644 $_pkgbase.template.json \
                     "$pkgdir/etc/$_pkgbase/$_pkgbase.template.json"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"

    # See man page for sysusers.d(5)
    install -D -m644 "$srcdir/$_pkgbase.sysusers" \
                     "$pkgdir/usr/lib/sysusers.d/$_pkgbase.conf"
}
