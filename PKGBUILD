# Maintainer: dreamscache.d <dreamscache.d@gmail.com>
# shellcheck shell=bash
# shellcheck disable=SC2164,SC2154,SC2034
_pkgname=recaf
_jdkver=25
pkgname=${_pkgname}-git
pkgver=r5296.ee4707a49
pkgrel=2
pkgdesc="The modern Java bytecode editor"
arch=("any")
url="https://github.com/Col-E/Recaf"
license=("MIT")
depends=("java-environment>=$_jdkver" "ttf-font")
makedepends=("git" "java-environment>=$_jdkver")
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
replaces=("recaf")
source=(
    "recaf::git+https://github.com/Col-E/Recaf#branch=master"
    "remove_jetbrains_annotations.patch"
)
sha256sums=(
    "SKIP"
    "ac6c4a2128628aa398898fcdc1b68020c2d6b719a0695fee436b60dd313738e8"
)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	patch "$srcdir/$_pkgname/build.gradle" "../remove_jetbrains_annotations.patch"
}

get_java_home() {
    local jvm
    jvm="$(archlinux-java get)"
    ver=$("/usr/lib/jvm/$jvm/bin/java" -version 2>&1 | awk -F'"' '/version/{print $2}' | cut -d. -f1)
    if [[ "$ver" -ge "$_jdkver" ]]; then
        echo "  ==> NOTE: using currently selected jvm $jvm" >&2
        echo "$jvm"
        return
    else
        echo "  ==> NOTE: current jvm $jvm is not version $_jdkver or later, will scan for available jvm" >&2
        echo "  ==> NOTE: use \`archlinux-java set <JVM>' to select a specific jvm for this build" >&2
    fi

    for jvm in /usr/lib/jvm/java-*; do
        [[ -x "$jvm/bin/javac" ]] || continue
        local ver
        ver=$("$jvm/bin/java" -version 2>&1 | awk -F'"' '/version/{print $2}' | cut -d. -f1)
        if [[ "$ver" -ge "$_jdkver" ]]; then
            echo "  ==> NOTE: using found matching jvm at $jvm" >&2
            echo "$jvm"
            return
        fi
    done

    echo "  ==> ERROR: no matching jvm version $_jdkver or later found in /usr/lib/jvm" >&2
    return 1
}

build() {
    cd "$srcdir/$_pkgname"
    export JAVA_HOME="$(get_java_home)"
    export TARGET_VERSION="$_jdkver"
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
