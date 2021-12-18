# Maintainer: dreamscache.d <dreamscache.d@gmail.com>
_pkgname=recaf
pkgname=${_pkgname}-git
pkgver=r2223.333a70d1
pkgrel=1
pkgdesc="A modern Java bytecode editor"
arch=("any")
url="https://github.com/Col-E/Recaf"
license=("MIT")
depends=("java-runtime" "java-openjfx" "ttf-font")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
replaces=("recaf")
source=("recaf::git+https://github.com/Col-E/Recaf#branch=master")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	sed -i '12s/read mode/mode=2/' build
}

build() {
	cd "$srcdir/$_pkgname"
	./build
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm755 "target/$_pkgname-$(git describe --tags --abbrev=0)-J8-jar-with-dependencies.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
    install -Dm644 "src/main/resources/icons/logo.png" "$pkgdir/usr/share/pixmaps/recaf.png"
    printf '#!/usr/bin/env bash\nexec java -cp "/usr/lib/jvm/default-runtime/lib/*:/usr/share/java/%s/%s.jar" "me.coley.recaf.Recaf" "$@"' "$_pkgname" "$_pkgname" > "recaf"
    printf "[Desktop Entry]\nType=Application\nVersion=1.0\nName=Recaf\nComment=%s\nPath=/usr/bin\nExec=recaf %%u\nIcon=recaf\nTerminal=false\nCategories=Development;Java" "$pkgdesc" > "recaf.desktop"
    install -Dm755 "recaf" "$pkgdir/usr/bin/recaf"
    install -Dm644 "recaf.desktop" "$pkgdir/usr/share/applications/recaf.desktop"
    chmod 775 "$pkgdir/usr/bin/$_pkgname"
}
