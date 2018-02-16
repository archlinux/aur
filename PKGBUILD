# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=filebeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=6.2.1
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
sha256sums=('ec5ea00ff6204467639b7d1484332e63d85be4e131f065885a225b6a56db4767'
            'c9d5fc8ff09cd636845ccfcef283a38574ab4f0a32e720c4c0717869f3dbebe0'
            '33feb3690f8b31563cc1e2da557c2aa326501ce9ccd7e0a142036902bfdb05ff')

source_i686=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-$pkgver-linux-x86.tar.gz")
source_x86_64=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-$pkgver-linux-x86_64.tar.gz")
sha256sums_i686=('2d962cf198a3dce2fc7ea3df6ce3b5b23d0989c453b8ef3c5897a816c4a1d518')
sha256sums_x86_64=('4490af2a51084ea1d9b516c32406dcf0c9b7c9213eeb0dc4bfa5d06db5cbee21')

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
    cp -r module "$pkgdir/usr/share/$_pkgbase"
    cp -r modules.d "$pkgdir/etc/$_pkgbase"

    install -D -m644 "$srcdir/$_pkgbase.service" \
                     "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"

    # See man page for sysusers.d(5)
    install -D -m644 "$srcdir/$_pkgbase.sysusers" \
                     "$pkgdir/usr/lib/sysusers.d/$_pkgbase.conf"
}
