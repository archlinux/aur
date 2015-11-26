# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=filebeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=1.0.0
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
            'd6db8138b0cb70925a529609b612ad0caf0c72bd8cf2e6b85de64eb2c42bced7'
            '33feb3690f8b31563cc1e2da557c2aa326501ce9ccd7e0a142036902bfdb05ff')

source_i686=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$pkgver-i686.tar.gz")
source_x86_64=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums_i686=('f184fe7d5cd566bdf1a48f79cd52c0d3ef960782b2076e8df67836e0ed36dc37')
sha256sums_x86_64=('f0bcc2dc9ae720a672fe5f4b22c0d132f7131d4d07484f4100453c7122f0561a')

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
