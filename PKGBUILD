# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: xiliuya <xiliuya@aliyun.com>
# Contributor: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>

pkgname=ffdec
pkgver=26.2.1
pkgrel=2
pkgdesc="Open Source Flash SWF decompiler and editor"
arch=('any')
url="https://github.com/jindrapetrik/jpexs-decompiler"
license=('GPL-3.0-or-later')
depends=('java-runtime>=8')
makedepends=('ant' 'java-environment>=8')
source=("ffdec-$pkgver.tar.gz::https://github.com/jindrapetrik/jpexs-decompiler/archive/refs/tags/version$pkgver.tar.gz"
        'ffdec-script-regex-fix.patch'
        'ffdec.desktop')
b2sums=('968faba3a9256ee9cdeeea2e02c7f55144be7fe9c6c1081fdc0736b33ee5f69d449588c57e16f1e84c136c76dc424991b5a95b138d7e63594f2d1ded2e88dea1'
        '4df2de2b0e9550205e97950bc39b4358332daa441b056752a02346974c3e36888f5af71bb5d5f8fd7a3d59e5cc140509698d48fec023067a9d21068edcc95a70'
        'fb07f5e2e0dab924b5e819f02ef374b827093978c698fdfaa301e4b520d0a06bfc172d5e32576846a113ed6ecc9198ee8cb2a0d58f932a01c188a72a86ac3692')

prepare() {
    cd "jpexs-decompiler-version$pkgver"

    patch --strip=1 --input=../ffdec-script-regex-fix.patch

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

    install -Dm755 "dist/ffdec.sh" "$pkgdir/usr/bin/ffdec"

    install -Dm644 "../ffdec.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    for f in lib/*.license.txt; do
        install -Dm644 "$f" -t "$pkgdir/usr/share/licenses/$pkgname"
    done
    install -Dm644 "resources/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
