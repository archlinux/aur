# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=junit-system-rules
pkgver=1.19.0
_commit=f4782ebfd72c08bd3f00aa04ad20fe499c5463b4 # signed commit corresponding to tag system-rules-1.19.0
pkgrel=2
pkgdesc='A collection of JUnit rules for testing code that uses java.lang.System'
arch=('any')
url='https://stefanbirkner.github.io/system-rules/'
license=('CPL')
depends=('junit')
makedepends=('git' 'jdk8-openjdk' 'maven')
source=("$pkgname::git+https://github.com/stefanbirkner/system-rules.git?signed#commit=$_commit"
        'https://github.com/stefanbirkner/system-rules/commit/f3bdb617cea7ab6663d9ec42d16d5f257b3a3f5c.patch')
sha512sums=('SKIP'
            'c9802bb0cfe5d3e6136f50b6ff43fdf962231571964cd1c69347f4ce025e7e60cfbc8a080f492fd17d29302463b5634fb8f1948a84cff7ed276294ce51be1ebc')
validpgpkeys=('F4AF40991AECE57728B0034F9ECE1F68817F4996') # Stefan Birkner <mail@stefan-birkner.de>

prepare() {
	cd "$pkgname"
	# Update lib-parent to latest version 16 to fix build failure (GitHub PR #76)
	patch --strip=1 --input="$srcdir/f3bdb617cea7ab6663d9ec42d16d5f257b3a3f5c.patch"
}

build() {
	cd "$pkgname"

	# The package cannot be compiled with newer Java versions (but works fine at runtime)
	# (https://github.com/stefanbirkner/system-rules/issues/65#issuecomment-402837535)
	export PATH="/usr/lib/jvm/java-8-openjdk/bin:$PATH"

	mvn -DskipTests=true -Dfindbugs.skip=true -Dgpg.skip=true install
}

check() {
	cd "$pkgname"
	mvn test
}

package() {
	cd "$pkgname/target"
	install -Dm644 "system-rules-$pkgver.jar" -t "$pkgdir/usr/share/java/junit-system-rules"
	ln -s "system-rules-$pkgver.jar" "$pkgdir/usr/share/java/junit-system-rules/system-rules.jar"
}
