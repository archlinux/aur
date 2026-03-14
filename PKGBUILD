# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=booklore
pkgver=2.2.1
pkgrel=1
pkgdesc="Self hosted ebook reader"
arch=('x86_64')
url="https://booklore.org/"
license=('AGPL-3.0')
backup=("etc/booklore/booklore.conf")
depends=('jdk-openjdk' 'mariadb' 'fontconfig' 'ttf-dejavu')
makedepends=('yarn')
optdepends=('apache' 'nginx' 'caddy')
options=(!debug)
source_x86_64=(
https://github.com/booklore-app/booklore/archive/refs/tags/v$pkgver.tar.gz
booklore.conf
booklore.service
booklore.sysusers
booklore.tmpfiles
booklore.install
)
sha512sums_x86_64=(
9fcd920e2c48ce6dc744072a714b33c3da74dd6a49a10f0733cbffa8058393e482c31cab643ac5b37ef56b5aceb186e8bc3c2e66ec82d37e57710dd2b771b417
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)

_PORT=8095
build() {
    cd "${srcdir}"

    # build web-UI
    cd booklore-$pkgver/booklore-ui
    yarn install
    yarn build
    cp -R dist/booklore/browser/* ../booklore-api/src/main/resources/static/

    # build server
    cd ../booklore-api
    sed -i 's|/app/data|/var/lib/booklore/app/data|' src/main/resources/application.yaml
    sed -i 's|/bookdrop|/var/lib/booklore/bookdrop|' src/main/resources/application.yaml
    sed -i 's|development|'$pkgver'|' src/main/resources/application.yaml
    sed -i 's|6060|'$_PORT'|' src/main/resources/application.yaml
    ./gradlew build 
    
}

package() {

mkdir -p $pkgdir/usr/share/webapps/booklore/booklore-ui
mkdir -p $pkgdir/etc/booklore
install -Dm 644 $srcdir/booklore.conf $pkgdir/etc/booklore/
install -Dm 644 $srcdir/booklore-$pkgver/booklore-api/build/libs/booklore-api-0.0.1-SNAPSHOT.jar  $pkgdir/usr/share/webapps/booklore/booklore.jar
install -Dm 644 ${srcdir}/booklore.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
install -Dm 644 ${srcdir}/booklore.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
install=booklore.install
install -Dm 644 ${srcdir}/booklore.service -t "$pkgdir"/usr/lib/systemd/system/
}
