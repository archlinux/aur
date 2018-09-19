# Maintainer: Karol Babioch <karol@babioch.de

pkgname=('tika' 'tika-server')
_name='tika'
pkgver=1.19
pkgrel=1
pkgdesc='Apache Tika - a content analysis toolkit'
arch=('any')
url='https://tika.apache.org'
license=('Apache')
depends=('java-runtime-headless')
optdepends=(
    'tesseract: OCR support'
)
makedepends=('git' 'maven')
source=(
    "git+https://github.com/apache/tika.git#tag=$pkgver"
    "tika-server.service"
    "tika-server.sysusers"
)
sha256sums=('SKIP'
            '6c11bffbb1a1fa7bda47a763981656bd3ab12ad203b379aa5eada817b81660a3'
            'fda25de00a6407318506142d9d24f896c970b8800c2731b09f9ca66e9ccce230')

build() {
    cd "$srcdir/$_name"
    mvn clean install -Dmaven.test.skip=true -Dmaven.repo.local=m2
}

check() {
    cd "$srcdir/$_name"
    # Disable testing for now since it will fail, see: https://issues.apache.org/jira/browse/TIKA-2487
    # mvn test -Dmaven.repo.local=m2
}

package_tika() {

    cd "$srcdir/$_name"

    install -Dm0644 "tika-core/target/tika-core-$pkgver.jar" "$pkgdir/usr/lib/$pkgname/tika-core.jar"
    install -Dm0644 "tika-parsers/target/tika-parsers-$pkgver.jar" "$pkgdir/usr/lib/$pkgname/tika-parsers.jar"
    install -Dm0644 "tika-app/target/tika-app-$pkgver.jar" "$pkgdir/usr/lib/$pkgname/tika-app.jar"

    install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

package_tika-server(){

    cd "$srcdir/$_name"

    install -Dm0644 "tika-server/target/tika-server-$pkgver.jar" "$pkgdir/usr/lib/$pkgname/tika-server.jar"

    install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm0644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

}

