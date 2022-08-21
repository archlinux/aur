# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

pkgname='dokka'
pkgver=1.7.10
pkgrel=1
pkgdesc='Documentation Engine for Kotlin'
url="https://kotlin.github.io/dokka/$pkgver/"
license=('Apache')
arch=('any')

depends=('freemarker' 'java-environment')
makedepends=('gradle>=7.3' 'gradle<8' 'npm')

source=("https://github.com/Kotlin/dokka/archive/refs/tags/v$pkgver.tar.gz"
		'0001-enable-application-plugin.patch'
		'0002-embed-plugin-dependencies.patch'
		'dokka')
sha256sums=('873e26b3c046e9217f70a126736308bc0c11e45b8a7a9b0991c15b71b0f1876f'
            '78d2f4fd30508c9b634e22655da275b0db4c5317d71bb3cd746f851702a31d93'
            'b5f139af1e11ba823865f01383eb5eae873af86fcd86107e6e179076ce1145f4'
            '9c7aa9721fe0b2c3cf3831a4d0b1720f13b070734d7be2702f820267ca11e277')

prepare() {
	cd "$srcdir/dokka-$pkgver"
	patch -N -p0 -i ../0001-enable-application-plugin.patch
	patch -N -p0 -i ../0002-embed-plugin-dependencies.patch
}

build() {
	cd "$srcdir/dokka-$pkgver"
	gradle :runners:cli:distTar
	gradle :plugins:base:jar
}

package() {
	cd "$srcdir/dokka-$pkgver"
	mkdir -p "$pkgdir/usr/lib/dokka"
	tar xf "runners/cli/build/distributions/cli-$pkgver.tar" --strip-components=1 -C "$pkgdir/usr/lib/dokka/"
	rm "$pkgdir/usr/lib/dokka/bin/cli.bat"
	install -Dm644 "plugins/base/build/libs/base-$pkgver.jar" "$pkgdir/usr/lib/dokka/plugins/base.jar"
	install -Dm755 ../dokka -t "$pkgdir/usr/bin/"
}
