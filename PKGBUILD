# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=filebeat-bin
_pkgbase=${pkgname%%-bin}
pkgver=5.2.0
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
            '6657b201197a682b955c0bcab132372f0be4009d54b9586014323e9860ea6838'
            '33feb3690f8b31563cc1e2da557c2aa326501ce9ccd7e0a142036902bfdb05ff')

source_i686=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-$pkgver-linux-x86.tar.gz")
source_x86_64=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-$pkgver-linux-x86_64.tar.gz")
sha256sums_i686=('5af19ed6ba39e79d1fa82313527e71824e074809ef038c04968b9803be2863d6')
sha256sums_x86_64=('6361d1ad88bb0aa139b3441e914121ab12f129e3295fa3fef14af25fc0e54749')

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

    # See man page for sysusers.d(5)
    install -D -m644 "$srcdir/$_pkgbase.sysusers" \
                     "$pkgdir/usr/lib/sysusers.d/$_pkgbase.conf"
}
