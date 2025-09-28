# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=pakku-mc
pkgname="$_pkgbase-git"
pkgver=1.2.1.r37.gb8554ce
pkgrel=2
pkgdesc="Modpack manager for Minecraft: Java Edition"
arch=('any')
url="https://juraj-hrivnak.github.io/Pakku/"
license=('EUPL-1.2')
depends=('java-runtime-headless=21')
makedepends=('git' 'java-environment=21')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/juraj-hrivnak/Pakku.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"
	rm -rf gradle-home
}

build() {
	cd "$_pkgbase"
	export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
	./gradlew jvmJar --gradle-user-home gradle-home
	java -jar build/libs/pakku.jar --generate-completion=bash | sed 's/complete -F _pakku pakku/complete -F _pakku pakku-mc/g' > pakku-mc.bash
	java -jar build/libs/pakku.jar --generate-completion=zsh | sed 's/complete -F _pakku pakku/complete -F _pakku pakku-mc/g' > pakku-mc.zsh
	java -jar build/libs/pakku.jar --generate-completion=fish | sed 's/-c pakku /-c pakku-mc /g' > pakku-mc.fish
}

### Skip for git package
# check() {
# 	cd "$_pkgbase"
# 	export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
# 	./gradlew jvmTest --gradle-user-home gradle-home
# }

package() {
	cd "$_pkgbase"
	install -Dm755 build/libs/pakku.jar "$pkgdir"/usr/lib/pakku-mc/pakku.jar
	install -Dm755 pakku-mc.bash "$pkgdir"/usr/share/bash-completion/completions/pakku-mc
	install -Dm755 pakku-mc.zsh "$pkgdir"/usr/share/zsh/site-functions/_pakku-mc
	install -Dm755 pakku-mc.fish "$pkgdir"/usr/share/fish/vendor_completions.d/pakku-mc.fish
	install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$_pkgbase/LICENSE
	install -Dm755 /dev/stdin "$pkgdir"/usr/bin/pakku-mc <<EOF
#!/bin/sh
exec /usr/lib/jvm/java-21-openjdk/bin/java -jar /usr/lib/pakku-mc/pakku.jar "\$@"
EOF
}
