# Maintainer: dreamscache.d <dreamscache.d@gmail.com>
# shellcheck shell=bash
# shellcheck disable=SC2164,SC2154,SC2034
_pkgname=recaf
_jdkver=25
pkgname=${_pkgname}-git
pkgver=r5004.dfd7f368e
pkgrel=1
pkgdesc="A modern Java bytecode editor"
arch=("any")
url="https://github.com/Col-E/Recaf"
license=("MIT")
depends=("java-environment-openjdk=$_jdkver" "ttf-font")
makedepends=("git" "jdk$_jdkver-openjdk")
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
	patch "$srcdir/$_pkgname/build.gradle" "../remove_jetbrains_annotations.patch"
}

build() {
	cd "$srcdir/$_pkgname"
	export TARGET_VERSION="$_jdkver"
	export JAVA_HOME="/usr/lib/jvm/java-$_jdkver-openjdk"
	export GRADLE_USER_HOME="$srcdir/$_pkgname/.gradle"
	./gradlew --no-daemon build
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm755 "recaf-ui/build/libs/recaf-ui-"*"-all.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
    install -Dm644 "recaf-ui/src/main/resources/icons/logo-full.png" "$pkgdir/usr/share/pixmaps/recaf.png"

	# Raw 'recaf' executable wrapper for use in scripts etc.
    cat > "recaf" <<EOF
#!/usr/bin/env bash
exec /usr/lib/jvm/java-${_jdkver}-openjdk/bin/java -jar "/usr/share/java/${_pkgname}/${_pkgname}.jar" "\$@"
EOF

	# Wrapper for .desktop to allow 'open with' in context menu
	cat > "recaf-desktop" <<'EOF'
#!/usr/bin/env bash
if [[ -n "$1" ]]; then
    exec recaf --input="$1"
else
    exec recaf
fi
EOF

    cat > "recaf.desktop" <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Recaf
Comment=${pkgdesc}
Path=/usr/bin
Exec=recaf-desktop %u
Icon=recaf
Terminal=false
MimeType=application/java-archive
Categories=Development;Java
EOF

    install -Dm755 "recaf" "$pkgdir/usr/bin/recaf"
    install -Dm755 "recaf-desktop" "$pkgdir/usr/bin/recaf-desktop"
    install -Dm644 "recaf.desktop" "$pkgdir/usr/share/applications/recaf.desktop"
}
