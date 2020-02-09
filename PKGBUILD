# Maintainer:F43nd1r <support@faendir.com>

pkgname=forge-autoreglib-git
pkgver=1.5_36
pkgrel=1
epoch=
pkgdesc="Minecraft mod library by Vazkii"
arch=('any')
url="https://github.com/Vazkii/AutoRegLib"
license=('custom')
depends=('forge-server')
makedepends=("git" "java-environment=8")
optdepends=()
conflicts=("forge-autoreglib-1.4-bin")
source=("$pkgname::git+https://github.com/Vazkii/AutoRegLib#branch=master" "LICENSE")
sha1sums=('SKIP'
          '6280575615d8e517935d30317cfdec7c5a4b6aff')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s_%s" "$(grep ^version= build.properties | sed -n -e s/^version=//p)" "$(grep ^build_number= build.properties | sed -n -e s/^build_number=//p)"
}

build() {
	cd "$srcdir/${pkgname}"
	java=$(find /usr/lib/jvm/ -maxdepth 1 -name \*-8-\* | sed -n '1p')
	./gradlew build "-Dorg.gradle.java.home=$java"
}

package() {
    cd "$srcdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$pkgname"
    install -D -m644 -g forge -o forge "./build/libs/AutoRegLib-$(echo $pkgver | sed -n -e  s/_/-/p).jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
}
