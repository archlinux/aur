# Maintainer:F43nd1r <support@faendir.com>

pkgname=forge-quark-git
pkgver=r2.0_211
pkgrel=1
epoch=
pkgdesc="Minecraft mod quark by Vazkii"
arch=('any')
url="https://quark.vazkii.net/"
license=('custom:CC BY-NC-SA 3.0')
depends=('forge-server>=1.14.4_28.1.61' 'forge-autoreglib-git')
makedepends=("git")
optdepends=()
conflicts=("forge-quark-2.0-bin")
source=("$pkgname::git+https://github.com/Vazkii/Quark#branch=master")
sha1sums=('SKIP')

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
    cd $srcdir/$pkgname
    install -D -m644 -g forge -o forge "./build/libs/Quark-$(echo $pkgver | sed -n -e  s/_/-/p).jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
