# Maintainer: John Regan <john@jrjrtech.com>

pkgname=dvbinspector
pkgver=1.19.2
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="DVB analyzer, written in java"
url="https://github.com/EricBerendsen/dvbinspector"
license=("GPL-3.0-or-later")
arch=('any')
depends=('java-runtime>=17')
makedepends=('maven' 'jdk17-openjdk')

source=("$url/archive/refs/tags/release_${_pkgver}.tar.gz"
        "dvbinspector.sh"
        "version-1.19.2.patch"
        )
sha256sums=('40e8c85549362ded8e7661c2ca0c9e5284ae2a4d2b63b5e1ef95e25df1ae8b3e'
            'af320db41a920b3838a7598c8d0712352a59081112015f893f7b713d407773e4'
            '2cd4b535278a29cb78ce4cbffc6ea7ca8244ecda98f23c03092fe5fc66826a2f')

prepare() {
    cd "${pkgname}-release_${_pkgver}"
    patch -p1 -i "${srcdir}/version-1.19.2.patch"
}

build() {
    cd "${pkgname}-release_${_pkgver}"
    export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"
    export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"

    mvn package
}

package() {
    cd "${pkgname}-release_${_pkgver}"

    install -vDm755 "$srcdir/dvbinspector.sh" "$pkgdir/usr/bin/$pkgname"
    install -vDm644 "target/DVBinspector-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
