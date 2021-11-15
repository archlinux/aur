# Maintainer: Benjamin Becker <benjamin |at| bckr |dot| me>

pkgname=metricbeat-oss-bin
_pkgbase=${pkgname%%-oss-bin}
pkgver=7.15.2
pkgrel=1
pkgdesc='Metrics collection and shipping beats component (precompiled)'
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
sha256sums=('1399976457d5c848a5274fa739ade7bdd187b035b5885dc77691051c3b5da718'
            'f4c4c85169d27ceea967c046109baacf54aa99e6569cd8acbedcab530dba48e3'
            'dd96ec7ab1f0464f6aa193d710d482aff8784c489b0cf6c7dadd7e3aabdf499a')

source_i686=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-oss-$pkgver-linux-x86.tar.gz")
source_x86_64=("https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-oss-$pkgver-linux-x86_64.tar.gz")
sha512sums_i686=('085898645b9fcf1691cc36e5bae63b2c79c39758c837e006d0edc8e591e90120ac50ff4d3819a6f155e59eb1e95e0a373465885e1420e3776bd12511be827818')
sha512sums_x86_64=('203dfc3004280b05df0e6acb4a72d6f2bc6315088c6404106a15ca50390ad500d994254d76ba36e8382ce710c98cb23bf0681848268e26c716ff4aee1dd580a0')

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
