# Maintainer: Manuel Thalmann <m@nuth.ch>
_pkgname=godot-manager
_desktopEntry="godot-manager-bin.desktop"
_repo="eumario/$_pkgname"
_archive="$_pkgname.zip"
pkgname="$_pkgname-bin"
pkgver=0.2.9
pkgrel=2
pkgdesc="A Project, Version and Addons/Plugins manager for Godot Game Engine."
arch=(x86_64)
url="https://github.com/$_repo"
license=('MIT')
groups=()
depends=()
makedepends=('curl' 'git' 'jq' 'sed' 'unzip')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=(!strip) # prevent godot build from breaking
install=
source=(
    "$_archive::https://github.com/$_repo/releases/download/v$pkgver/godotmanager-linux-v$pkgver.zip"
    "LICENSE::https://raw.githubusercontent.com/$_repo/v$pkgver/LICENSE"
    "$_pkgname.png::https://raw.githubusercontent.com/$_repo/v$pkgver/$_pkgname.png"
    "$_desktopEntry"
)
noextract=("$_archive")
sha256sums=(
    '4dc938ca316685c21003ede22622bc6bc42e7a2baff62c80376234db7233474e'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    curl --silent -L "https://api.github.com/repos/$_repo/releases/latest" | # Get latest release from GitHub api
        jq -r .tag_name | # Get tag name
        sed 's/^v//' # Remove leading `v`
}

package() {
    _installDir="$pkgdir/opt/$_pkgname"
    _binDir="$pkgdir/usr/bin"
    _iconDir="$pkgdir/usr/share/pixmaps"
    _desktopDir="$pkgdir/usr/share/applications"
    install -dm755 "$_binDir" "$_installDir" "$_iconDir" "$_desktopDir"
    unzip "$_archive" -d "$_installDir"
    ln -s "/opt/$_pkgname/GodotManager.${arch[0]}" "$_binDir/$_pkgname"
    install -Dm644 "$srcdir/godot-manager.png" "$_iconDir"
    install -Dm644 "$_desktopEntry" "$_desktopDir"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"    
}
