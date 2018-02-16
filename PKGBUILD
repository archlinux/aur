# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=packetbeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=6.2.1
pkgrel=1
pkgdesc='An open source network packet analyzer that ships data to Elasticsearch (precompiled)'
arch=('i686' 'x86_64')
url="https://www.elastic.co/products/beats/$_pkgbase"
license=('APACHE')
backup=("etc/$_pkgbase/$_pkgbase.yml")
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase.service")
sha256sums=('407fda47ace0e9de3dc27bf504693a3e432bf377c9a5e6772377b2ebb3a8f2e4')

source_i686=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-$pkgver-linux-x86.tar.gz")
source_x86_64=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-$pkgver-linux-x86_64.tar.gz")
sha256sums_i686=('fcf470ea40f1a64bdf6557124a1f332c0998cad52c0776cec6d09128715b317f')
sha256sums_x86_64=('59e4f955457b4b5bae578714d7c261538ccf798e10295acf1fbd33d07260a95f')

package() {
    if [[ $CARCH == 'i686' ]] ; then
      beats_arch=x86
    else
      beats_arch=$CARCH
    fi

    cd "$srcdir/$_pkgbase-$pkgver-linux-$beats_arch"

    for d in lib log ; do
        mkdir -p "$pkgdir/var/$d/$_pkgbase"
    done

    install -D -m755 $_pkgbase     "$pkgdir/usr/bin/$_pkgbase"

    for f in $_pkgbase.{,reference.}yml fields.yml ; do
      install -D -m644 $f "$pkgdir/etc/$_pkgbase/$f"
    done

    for f in NOTICE.txt README.md ; do
      install -D -m644 $f "$pkgdir/usr/share/$_pkgbase/$f"
    done

    cp -r kibana "$pkgdir/usr/share/$_pkgbase"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
}
