# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: xiliuya <xiliuya@aliyun.com>
# Contributor: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>

pkgname=ffdec
pkgver=26.3.0
pkgrel=1
pkgdesc="Open Source Flash SWF decompiler and editor"
arch=('any')
url="https://github.com/jindrapetrik/jpexs-decompiler"
license=('GPL-3.0-or-later')
depends=('java-runtime>=8')
makedepends=('ant' 'java-environment>=8')
source=("ffdec-$pkgver.tar.gz::https://github.com/jindrapetrik/jpexs-decompiler/archive/refs/tags/version$pkgver.tar.gz"
        'ffdec-script-regex-fix.patch'
        'ffdec.desktop')
b2sums=('f9a0b100a53efd087d708841a3f8e0fbe43dbbef2fea3419e8054a6cd685e20a96964dc9da91ac6b5189689304b02ea63d708f16d4b7d0e17bcd0302d5b65313'
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
