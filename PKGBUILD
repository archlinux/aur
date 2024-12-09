# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

pkgname='dokka'
pkgver=1.9.10
pkgrel=1
pkgdesc='Documentation Engine for Kotlin'
url="https://kotlin.github.io/dokka/$pkgver/"
license=('Apache')
arch=('any')

depends=('freemarker' 'java-environment')
makedepends=('gradle' 'jdk8-openjdk' 'npm')

source=("https://github.com/Kotlin/dokka/archive/refs/tags/v$pkgver.tar.gz"
		'0001-enable-application-plugin.patch'
		'0002-embed-plugin-dependencies.patch'
		'0003-disable-gradle-enterprise.patch'
		'0004-fix-unresolved-reference-appendReproducibleNewLine.patch'
		'dokka')
sha256sums=('6ff50037806e140cff4a12b98c8e6631c2aedbd867b04dcc40ade9880c75d0fc'
            '78d2f4fd30508c9b634e22655da275b0db4c5317d71bb3cd746f851702a31d93'
            'bef57356bd152795195100874c918fa27c35407507aa13f08267dce0b0dcc1de'
            '2bac7e5f944f4f2342eaabff4b60666f3681dd945ff96e8bb56491c6dda4deb8'
            '53723fe300fad66e174f582e08040406978c064beb1e3925be04deea7bbff206'
            '9c7aa9721fe0b2c3cf3831a4d0b1720f13b070734d7be2702f820267ca11e277')

prepare() {
	cd "$srcdir/dokka-$pkgver"
	for patch in \
		'0001-enable-application-plugin.patch' \
		'0002-embed-plugin-dependencies.patch' \
		'0003-disable-gradle-enterprise.patch' \
		'0004-fix-unresolved-reference-appendReproducibleNewLine.patch'
	do
		patch -N -p0 -i "../$patch"
	done
}

build() {
	cd "$srcdir/dokka-$pkgver"
	JAVA_HOME=/usr/lib/jvm/java-8-openjdk gradle :runners:cli:distTar
	JAVA_HOME=/usr/lib/jvm/java-8-openjdk gradle :plugins:base:jar
}

package() {
	cd "$srcdir/dokka-$pkgver"
	mkdir -p "$pkgdir/usr/lib/dokka"
	tar xf "runners/cli/build/distributions/cli-$pkgver.tar" --strip-components=1 -C "$pkgdir/usr/lib/dokka/"
	rm "$pkgdir/usr/lib/dokka/bin/cli.bat"
	install -Dm644 "plugins/base/build/libs/base-$pkgver.jar" "$pkgdir/usr/lib/dokka/plugins/base.jar"
	install -Dm755 ../dokka -t "$pkgdir/usr/bin/"
}
