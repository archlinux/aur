# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: xiliuya <xiliuya@aliyun.com>
# Contributor: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>

pkgname=ffdec
pkgver=26.0.0
pkgrel=1
pkgdesc="Open Source Flash SWF decompiler and editor"
arch=('any')
url="https://github.com/jindrapetrik/jpexs-decompiler"
license=('GPL-3.0-or-later')
depends=('java-runtime>=8')
makedepends=('ant' 'java-environment>=8')
source=("ffdec-$pkgver.tar.gz::https://github.com/jindrapetrik/jpexs-decompiler/archive/refs/tags/version$pkgver.tar.gz"
        'ffdec'
        'ffdec.desktop')
b2sums=('d0c1af14d24a908ba95d40c178e13055be380ac4e1bde55e3457b482986dfa876a8e0714aff2d547853a3110721e67737b71cf2d15e00a8c3da092668f74a04e'
        'b302dde7bb57a21e501ba1bedd104d0c32994019501e92792073459b2c11268e1dcfac4d22783793fbbc839c175151632f0a8889c3b2cc44b197d8924b7327f8'
        'fb07f5e2e0dab924b5e819f02ef374b827093978c698fdfaa301e4b520d0a06bfc172d5e32576846a113ed6ecc9198ee8cb2a0d58f932a01c188a72a86ac3692')

prepare() {
    cd "jpexs-decompiler-version$pkgver"

    IFS='.' read -r major minor release <<< "$pkgver"
    sed -E -ie 's/(name="version.major" value=")0(")/\1'"$major"'\2/g'       build.xml
    sed -E -ie 's/(name="version.minor" value=")0(")/\1'"$minor"'\2/g'       build.xml
    sed -E -ie 's/(name="version.release" value=")0(")/\1'"$release"'\2/g'   build.xml
    sed -E -ie 's/(name="version.debug" value=")true(")/\1false\2/g'         build.xml
}

build() {
    cd "jpexs-decompiler-version$pkgver"
    ant build
}

package() {
    cd "jpexs-decompiler-version$pkgver"

    install -Dm644 "dist/ffdec.jar" -t "$pkgdir/usr/share/java/$pkgname"
    for f in lib/*.jar; do
        install -Dm644 "$f" -t "$pkgdir/usr/share/java/$pkgname/lib"
    done

    install -Dm755 "../ffdec" -t "$pkgdir/usr/bin"

    install -Dm644 "../ffdec.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    for f in lib/*.license.txt; do
        install -Dm644 "$f" -t "$pkgdir/usr/share/licenses/$pkgname"
    done
    install -Dm644 "resources/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
