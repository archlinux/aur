# Maintainer: YuutaW <i@yuuta.moe>
pkgname='hydrolog-git'
pkgver=1
pkgrel=1
pkgdesc="A simple Java blogging program"
arch=("x86_64")
url="https://github.com/Segfault-Org/Hydrolog"
license=('GPL')
groups=()
depends=("java-runtime=8")
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=('etc/hydrolog/')
options=()
install=
source=("$pkgname::git+https://github.com/Segfault-Org/Hydrolog.git"
"hydrolog.conf"
"hydrolog.service")
noextract=()
md5sums=('SKIP'
         'c237ae4f0ad23fe37a5d7a41b7885eb6'
         'd0f7e82bb475bab616988b94a327fdd0')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}"
}

build() {
	cd "$srcdir/${pkgname}"
    ./build.sh
    ./gradlew :jar
}

check() {
	cd "$srcdir/${pkgname}"
}

package() {
	cd "$srcdir/${pkgname}"
    mkdir -p "$pkgdir/usr/share/java/hydrolog/"
    mkdir -p "$pkgdir/etc/hydrolog/"
    mkdir "$pkgdir/etc/hydrolog/root"
    mkdir "$pkgdir/etc/hydrolog/templates"
    install -Dm644 ./build/libs/Hydrolog-0.1.jar $pkgdir/usr/share/java/hydrolog/hydrolog.jar
    install -Dm644 ./src/uptime/libuptime.so $pkgdir/usr/share/java/hydrolog/libuptime.so
    install -Dm644 $srcdir/hydrolog.conf $pkgdir/etc/hydrolog/hydrolog.conf

    mkdir -p $pkgdir/usr/lib/systemd/system
	install -Dm644 $srcdir/hydrolog.service $pkgdir/usr/lib/systemd/system/hydrolog.service
}
