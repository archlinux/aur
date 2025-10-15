# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=pakku-mc
pkgname="$_pkgbase"
pkgver=1.3.0
pkgrel=1
pkgdesc="Modpack manager for Minecraft: Java Edition"
arch=('any')
url="https://juraj-hrivnak.github.io/Pakku/"
license=('EUPL-1.2')
depends=('java-runtime-headless=21')
makedepends=('git' 'java-environment=21')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/juraj-hrivnak/Pakku.git#tag=v$pkgver")
sha256sums=('7b320c407a2d93576344ceec9fe234340fbe795a542c5ed44a3b1a1c3d8ee682')

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

check() {
	cd "$_pkgbase"
	export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
	./gradlew jvmTest --gradle-user-home gradle-home
}

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
