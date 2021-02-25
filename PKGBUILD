# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=junit-system-rules
pkgver=1.19.0
_commit=f4782ebfd72c08bd3f00aa04ad20fe499c5463b4 # git rev-parse "system-rules-$pkgver^{}"
pkgrel=7
pkgdesc='A collection of JUnit rules for testing code that uses java.lang.System'
arch=('any')
url='https://stefanbirkner.github.io/system-rules/'
license=('CPL')
depends=('junit')
makedepends=('git' 'jdk8-openjdk' 'maven')
source=("$pkgname::git+https://github.com/stefanbirkner/system-rules.git?signed#commit=$_commit"
        'junit-system-rules-1.19.0_update-maven-jar-plugin.patch')
sha512sums=('SKIP'
            'ec9fb99770b406ac3e56c49820e33ff255958566724534f0d6afc340ebfb1fbbd7043fc188d39d553ca230058ff7d592ede8729feb8434c6090849bb26a7dea4')
validpgpkeys=('F4AF40991AECE57728B0034F9ECE1F68817F4996') # Stefan Birkner <mail@stefan-birkner.de>

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/^system-rules-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	# Update the plugin generating the JAR file to a version supporting reproducible builds
	patch --strip=1 --input="$srcdir/junit-system-rules-1.19.0_update-maven-jar-plugin.patch"
}

build() {
	cd "$pkgname"

	# The package cannot be compiled with newer Java versions (but works fine at runtime)
	# (https://github.com/stefanbirkner/system-rules/issues/65#issuecomment-402837535)
	export PATH="/usr/lib/jvm/java-8-openjdk/bin:$PATH"

	mvn -Dproject.build.outputTimestamp="$SOURCE_DATE_EPOCH" -DskipTests=true clean package
}

check() {
	cd "$pkgname"
	mvn test
}

package() {
	cd "$pkgname"
	install -Dm644 "target/system-rules-$pkgver.jar" -t "$pkgdir/usr/share/java/junit-system-rules"
	ln -s "system-rules-$pkgver.jar" "$pkgdir/usr/share/java/junit-system-rules/system-rules.jar"
}
