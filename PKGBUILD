# Author: Benjamin Becker <benjamin |at| bckr |dot| me>
# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=metricbeat-oss-bin
_pkgbase=${pkgname%%-oss-bin}
pkgver=8.2.0
pkgrel=1
pkgdesc='Metrics collection and shipping beats component (precompiled)'
arch=('aarch64' 'x86_64')
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
sha256sums=('1399976457d5c848a5274fa739ade7bdd187b035b5885dc77691051c3b5da718'
            'f4c4c85169d27ceea967c046109baacf54aa99e6569cd8acbedcab530dba48e3'
            'dd96ec7ab1f0464f6aa193d710d482aff8784c489b0cf6c7dadd7e3aabdf499a')

source_aarch64=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-oss-$pkgver-linux-arm64.tar.gz")
source_x86_64=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-oss-$pkgver-linux-x86_64.tar.gz")
sha512sums_aarch64=('51004ff8aaf13f78c682c1e54412ffe4040c3b12047c910caf3a2d4568aea48c0334f63bafebc0f92a776e0a87945283bb1a0ab97c54fb2a62dfe84bd34ebf0c')
sha512sums_x86_64=('de7e0e2820d6491041ae829bf89b305902a2edf719a9e4ff8d2d870aa2bde5ebf258c60040796b57fbcf2ec62cc17546fbc41fbb78be4c0d03aff8fc7d86f1fe')

package() {
    if [[ $CARCH == 'aarch64' ]] ; then
      beats_arch=arm64
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
