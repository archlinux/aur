# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=grimmory
pkgver=3.5.1
pkgrel=1
pkgdesc="Self hosted ebook reader and library"
arch=('x86_64')
url="https://grimmory.org/"
license=('AGPL-3.0')
backup=("etc/grimmory/grimmory.conf")
depends=('jdk25-openjdk' 'mariadb' 'fontconfig' 'ttf-dejavu' 'kepubify' 'corepack')
#makedepends=('pnpm')
conflicts=('booklore')
optdepends=('apache' 'nginx' 'caddy')
options=(!debug)
source_x86_64=(
https://github.com/grimmory-tools/grimmory/archive/refs/tags/v$pkgver.tar.gz
grimmory.conf
grimmory.service
grimmory.sysusers
grimmory.tmpfiles
grimmory.install
)
sha512sums_x86_64=(
2632c69ee3bee3f31d4a025d9696594c6b9fc822848ef5be4190c7a15e261806a15d1c5a8f11d382ec6cb403234a07d70882cae2637e346ed311f7a8937c4544
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
    cd grimmory-$pkgver/frontend
    mkdir -p bin
    corepack enable --install-directory bin
    corepack pnpm install
    corepack pnpm build

    # build server
    cd ../backend
    sed -i 's|/app/data|/var/lib/grimmory/app/data|' src/main/resources/application.yaml
    sed -i 's|/bookdrop|/var/lib/grimmory/bookdrop|' src/main/resources/application.yaml
    export APP_VERSION=$pkgver
    sed -i 's|6060|'$_PORT'|' src/main/resources/application.yaml
    ./gradlew build  || (echo -e "\033[31m Java build failed. Try: 'sudo archlinux-java set java-25-openjdk' and rebuild  \033[0m" && exit)
    
}

package() {

mkdir -p $pkgdir/usr/share/webapps/grimmory/grimmory-ui
mkdir -p $pkgdir/etc/grimmory
install -Dm 644 $srcdir/grimmory.conf $pkgdir/etc/grimmory/
install -Dm 644 $srcdir/grimmory-$pkgver/backend/build/libs/backend-$pkgver.jar  $pkgdir/usr/share/webapps/grimmory/grimmory.jar
install -Dm 644 ${srcdir}/grimmory.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
install -Dm 644 ${srcdir}/grimmory.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
install=grimmory.install
install -Dm 644 ${srcdir}/grimmory.service -t "$pkgdir"/usr/lib/systemd/system/
}
