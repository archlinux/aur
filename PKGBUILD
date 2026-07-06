# Maintainer: dreamscached <dreamscache.d@gmail.com>
# shellcheck disable=SC2148
_pkgname=recaf
pkgname="${_pkgname}-bin"
_pkgver=4.0.0-alpha
_ghassetver=4x-alpha
pkgver="$(printf '%s' "$_pkgver" | sed 's/-//')"
pkgrel=3
pkgdesc="The modern Java bytecode editor"
arch=(x86_64 aarch64)
url="https://github.com/Col-E/Recaf"
license=("MIT")
_jdkver=25
depends=("java-environment-openjdk=$_jdkver" "ttf-font")
conflicts=("$_pkgname" "$_pkgname-git")
replaces=("$_pkgname")
provides=("$_pkgname")

source_x86_64=(
    "https://github.com/Col-E/Recaf/releases/download/$_pkgver/$_pkgname-$_ghassetver-linux-86-x64.jar"
    "https://raw.githubusercontent.com/Col-E/Recaf/$_pkgver/recaf-ui/src/main/resources/icons/logo-full.png"
    "https://raw.githubusercontent.com/Col-E/Recaf/$_pkgver/LICENSE"
)
sha256sums_x86_64=(
    "3c81b47087a235270718ba3ca1ce7050983468cb83cbcaeb5d7c23cc028b8c39"
    "901fbcfa7944e89f5c34e73a3637fd21dc7c8e34b5612a7e0a0a707a4b45be1d"
    "a98659971ead7e75b30f8d4ef8c27d13338c6187a49fee181379e74b89d4a16f"
)

source_aarch64=(
    "https://github.com/Col-E/Recaf/releases/download/$_pkgver/$_pkgname-$_ghassetver-linux-aarch64.jar"
    "https://raw.githubusercontent.com/Col-E/Recaf/$_pkgver/recaf-ui/src/main/resources/icons/logo-full.png"
    "https://raw.githubusercontent.com/Col-E/Recaf/$_pkgver/LICENSE"
)
sha256sums_aarch64=(
    "5455efdd7d49af405bb0f81caab7424637b363281422402559ba492a5427d33d"
    "901fbcfa7944e89f5c34e73a3637fd21dc7c8e34b5612a7e0a0a707a4b45be1d"
    "a98659971ead7e75b30f8d4ef8c27d13338c6187a49fee181379e74b89d4a16f"
)

noextract=(
    "$_pkgname-$_ghassetver-linux-86-x64.jar"
    "$_pkgname-$_ghassetver-linux-aarch64.jar"
)

package() {
    cd "$srcdir"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm755 "$_pkgname-$_ghassetver-linux-"*".jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
    install -Dm644 "logo-full.png" "$pkgdir/usr/share/pixmaps/recaf.png"

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
