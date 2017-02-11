# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=packetbeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=5.2.0
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
sha256sums=('acc6d21a3fe1a2b5f721f0423b4752ffd2c69b37c1c8323edac0d583ae73daaa')

source_i686=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-$pkgver-linux-x86.tar.gz")
source_x86_64=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-$pkgver-linux-x86_64.tar.gz")
sha256sums_i686=('1edd5d93d30f9ad8169e3a1ca62b02d2f3575e809d4f619b6949eeb64cc35b3a')
sha256sums_x86_64=('51dc83da0d6904afbfb04c276c48f33e12fa4e7bdd31bc54d2b20b482447f54f')

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

    for f in $_pkgbase.{{,full.}yml,template{,-es2x}.json} ; do
      install -D -m644 $f "$pkgdir/etc/$_pkgbase/$f"
    done

    for f in NOTICE README.md scripts/* ; do
      install -D -m644 $f "$pkgdir/usr/share/$_pkgbase/$f"
    done

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
}
