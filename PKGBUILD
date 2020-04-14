# Maintainer: Benjamin Becker <benjamin |at| bckr |dot| me>

pkgname=metricbeat-oss-bin
_pkgbase=${pkgname%%-oss-bin}
pkgver=7.6.2
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
sha256sums_i686=('286cd62684a4c24ae18ac37c0365874669494813d8ff09489e5a5210f66ff780')
sha256sums_x86_64=('cdf938cea6a058b4c5dd4129e185e21c77f35d5170e77ce6c0aa2d89c10856d6')

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
