# Author: Benjamin Becker <benjamin |at| bckr |dot| me>
# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=metricbeat-oss-bin
_pkgbase=${pkgname%%-oss-bin}
pkgver=8.14.3
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
sha256sums_aarch64=('ccec37c788668f5bf9f0d3670491c3c3f08c8447ef3aa284172a5e7a813d8537')
sha256sums_x86_64=('d186ba0ca1b48e6ac3e0589030a721016e52def080caac2b9534e34872def9c3')
sha512sums=('4fe502701ff903520bad50374e26cbdf8c763e1742ef50df7c7e36df9023dcd93d7862a43be775dc258e5fa8b17ccad4b141f32e00d2a984def6d99509412fb4'
            'af3e56baecb8175bc6797559fa6b608deb07944dfce444bb227a5879e12044d49ff97c70f1ef9833010dc1d0a1aa20d76c28ab30688743ca74f4e9180c13973c'
            '200d37a8d39023c17784bc987553d48fd154d92ed24df6dcd6ff507a8d1af5f4c126c8d65c2dbe474357133908b71c757a12e464d1074da47eec29c4080968e7')
sha512sums_aarch64=('2a8e8e1886e3bb89b125dff91033a4e099055da571b45fb91e227436a872286fc2b349831497123978de72d8915164994243bb92e785b310f58bbf26df0c8ba5')
sha512sums_x86_64=('8bad7e087a1799743fd561ade8530f2626e9379eb7676fccaf5e103deddd4e697a14aa5ac364f379f8a25d50e158bed5c5a69c372ec9264462d75fde0cf03900')

source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-oss-$pkgver-linux-arm64.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://artifacts.elastic.co/downloads/beats/$_pkgbase/$_pkgbase-oss-$pkgver-linux-x86_64.tar.gz")

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
