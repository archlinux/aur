# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=filebeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=1.0.0_rc2
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc='Collects, pre-processes, and forwards log files from remote sources (precompiled)'
arch=('i686' 'x86_64')
url="https://www.elastic.co/products/beats"
license=('APACHE')
backup=("etc/$_pkgbase/$_pkgbase.yml")
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase.service")
sha256sums=('9985f8e0441efde0e60c5efe97890e46d4f1cbd118d8722eb478be876197326a')

source_i686=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$_pkgver-i686.tar.gz")
source_x86_64=("https://download.elastic.co/beats/$_pkgbase/$_pkgbase-$_pkgver-x86_64.tar.gz")
sha256sums_i686=('68bd5b2463398492f81d8d1e0aa204e691da426f97d67d715ae9523c83bbcc34')
sha256sums_x86_64=('62f6d276231efa9f0ce67398772068b8eec6f74e7d89aa14ef3dfc594b7c9ece')

prepare() {
    cd "$_pkgbase-$_pkgver-$CARCH"

    sed -i 's@#registry_file: .filebeat@registry_file: /var/lib/filebeat/registry@' \
        filebeat.yml
}

package() {
    cd "$srcdir/$_pkgbase-$_pkgver-$CARCH"

    install -D -m755 $_pkgbase     "$pkgdir/usr/bin/$_pkgbase"
    install -D -m644 $_pkgbase.yml "$pkgdir/etc/$_pkgbase/$_pkgbase.yml"
    install -D -m644 $_pkgbase.template.json \
                     "$pkgdir/etc/$_pkgbase/$_pkgbase.template.json"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
}
