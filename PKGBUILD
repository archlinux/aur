# Author: Benjamin Becker <benjamin |at| bckr |dot| me>
# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=metricbeat-oss-bin
_pkgbase=${pkgname%%-oss-bin}
pkgver=9.2.2
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
sha256sums_aarch64=('422ce8a6d1df3d7c806c33494812d980350843724f50eac799ac43b4883598a2')
sha256sums_x86_64=('13a81009491bc562107f216b2142fca26a6ad92f2f94eaec02b8a95591827618')
sha512sums=('4fe502701ff903520bad50374e26cbdf8c763e1742ef50df7c7e36df9023dcd93d7862a43be775dc258e5fa8b17ccad4b141f32e00d2a984def6d99509412fb4'
            'af3e56baecb8175bc6797559fa6b608deb07944dfce444bb227a5879e12044d49ff97c70f1ef9833010dc1d0a1aa20d76c28ab30688743ca74f4e9180c13973c'
            '200d37a8d39023c17784bc987553d48fd154d92ed24df6dcd6ff507a8d1af5f4c126c8d65c2dbe474357133908b71c757a12e464d1074da47eec29c4080968e7')
sha512sums_aarch64=('10c7461f68dcfbb26a8bfb5e5855f5b9cdb302ed705571cdd731342acef64d6bef20595b877b42960984cd20fb889b45c5bb24ccda0d15f7f473cd29ac514ebd')
sha512sums_x86_64=('735de6b64e2450f2b46d6e1dec5123fc3011d7757b88f1d4393a221a7c07d73eddbad70f4931fd92105e7c8542db160f0e22e9b14c764d5df08ae9edcc882ad1')

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
