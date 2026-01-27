# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=booklore
pkgver=1.18.5
pkgrel=1
pkgdesc="Self hosted ebook reader"
arch=('x86_64')
url="https://booklore.org/"
license=('AGPL-3.0')
backup=("etc/booklore/booklore.conf")
depends=('jdk21-openjdk' 'mariadb')
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
booklore_caddy.txt
booklore_nginx.txt
booklore_apache.txt
)
sha512sums_x86_64=(
cb5ae6a4509bbaba0c79aa7c9412427b2fcb1a8cf5fd070404d0cdc10fdee8a467097ad191573e3a69a243dcc35c313c46b7e2dd49f14b47ef215a5292e8513c
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)

_PORT=8095
build() {
    cd "${srcdir}"

    # build server
    cd booklore-$pkgver/booklore-api
    sed -i 's|/app/data|/var/lib/booklore/app/data|' src/main/resources/application.yaml
    sed -i 's|/bookdrop|/var/lib/booklore/bookdrop|' src/main/resources/application.yaml
    sed -i 's|8080|'$_PORT'|' src/main/resources/application.yaml
    ./gradlew build || {
    error "\e[1;31mIf build fails, run sudo archlinux-java set java-21-openjdk\e[0m"
    return 1
  }
    
    # build web-UI
    cd ../booklore-ui
    yarn install
    yarn add uuid@8.3.2
    yarn build
}

package() {

mkdir -p $pkgdir/usr/share/webapps/booklore/booklore-ui
mkdir -p $pkgdir/etc/booklore
install -Dm 644 $srcdir/booklore.conf $pkgdir/etc/booklore/
install -Dm 644 $srcdir/booklore-$pkgver/booklore-api/build/libs/booklore-api-0.0.1-SNAPSHOT.jar  $pkgdir/usr/share/webapps/booklore/booklore.jar
cp -Ra $srcdir/booklore-$pkgver/booklore-ui/dist/booklore/browser/*  $pkgdir/usr/share/webapps/booklore/booklore-ui
install -Dm 644 ${srcdir}/booklore.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
install -Dm 644 ${srcdir}/booklore.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
install=booklore.install
install -Dm 644 ${srcdir}/booklore.service -t "$pkgdir"/usr/lib/systemd/system/
install -Dm 644 ${srcdir}/booklore_apache.txt "${pkgdir}"/usr/share/webapps/booklore
install -Dm 644 ${srcdir}/booklore_caddy.txt "${pkgdir}"/usr/share/webapps/booklore
install -Dm 644 ${srcdir}/booklore_nginx.txt "${pkgdir}"/usr/share/webapps/booklore

}
