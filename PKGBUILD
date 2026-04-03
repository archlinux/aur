# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=pakku-mc
pkgname="$_pkgbase-bin"
pkgver=1.3.3
pkgrel=1
pkgdesc="Modpack manager for Minecraft: Java Edition"
arch=('any')
url="https://juraj-hrivnak.github.io/Pakku/"
license=('EUPL-1.2')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase.tar::https://github.com/juraj-hrivnak/Pakku/releases/download/v$pkgver/Pakku-$pkgver.tar")
sha256sums=('10a3a94c8fc8653c9851a0881ead8b2fc781e8701f25f27243ab53d2f60a942e')
depends=('java-runtime-headless=21')

build() {
	cd Pakku-$pkgver
	export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
	java -jar lib/pakku.jar --generate-completion=bash | sed 's/complete -F _pakku pakku/complete -F _pakku pakku-mc/g' > ../pakku-mc.bash
	java -jar lib/pakku.jar --generate-completion=zsh | sed 's/complete -F _pakku pakku/complete -F _pakku pakku-mc/g' > ../pakku-mc.zsh
	java -jar lib/pakku.jar --generate-completion=fish | sed 's/-c pakku /-c pakku-mc /g' > ../pakku-mc.fish
}

package() {
	install -Dm755 Pakku-$pkgver/lib/pakku.jar "$pkgdir"/usr/lib/pakku-mc/pakku.jar
	install -Dm755 pakku-mc.bash "$pkgdir"/usr/share/bash-completion/completions/pakku-mc
	install -Dm755 pakku-mc.zsh "$pkgdir"/usr/share/zsh/site-functions/_pakku-mc
	install -Dm755 pakku-mc.fish "$pkgdir"/usr/share/fish/vendor_completions.d/pakku-mc.fish
	install -Dm755 /dev/stdin "$pkgdir"/usr/bin/pakku-mc <<EOF
#!/bin/sh
exec /usr/lib/jvm/java-21-openjdk/bin/java -jar /usr/lib/pakku-mc/pakku.jar "\$@"
EOF
}
