# Maintainer: rutra
pkgname=forge-gui-desktop-snapshot-bin
_pkgname=forge-gui-desktop
pkgver=2.0.05.snapshot.07.16
pkgrel=1
pkgdesc="Implementation of Magic the Gathering that lets you play against a computer AI (daily snapshot)"
arch=('any')
url="https://github.com/Card-Forge/forge"
license=('GPL3')
depends=('jre17-openjdk')
provides=('forge-gui-desktop')
conflicts=('forge-gui-desktop')
replaces=('forge-gui-desktop-git')
source=("AppIcon.png::https://github.com/Card-Forge/forge/raw/master/AppIcon.png")
sha256sums=('SKIP')

pkgver() {
    local api_response version_url version_content
    api_response=$(curl -sLf "https://api.github.com/repos/Card-Forge/forge/releases/tags/daily-snapshots") || return 1
    version_url=$(echo "$api_response" | jq -r '.assets[] | select(.name == "version.txt") | .browser_download_url')
    [[ -z "$version_url" || "$version_url" == "null" ]] && return 1
    version_content=$(curl -sLf "$version_url") || return 1
    echo "$version_content" | sed -E 's/-SNAPSHOT-/.snapshot./; s/-//g'
}

prepare() {
    cd "$srcdir"
    api_response=$(curl -s "https://api.github.com/repos/Card-Forge/forge/releases/tags/daily-snapshots")
    tarball_url=$(echo "$api_response" | jq -r '.assets[] | select(.name | startswith("forge-installer") and endswith(".tar.bz2")) | .browser_download_url' | head -n 1)
    [[ -z "$tarball_url" || "$tarball_url" == "null" ]] && exit 1
    tarball_name=$(basename "$tarball_url")
    curl -Lf -o "$tarball_name" "$tarball_url"
    tar -xjf "$tarball_name"
}

package() {
    cd "$srcdir"
    jar_file=$(find . -name 'forge-gui-desktop-*-jar-with-dependencies.jar' | head -n 1)
    [[ -z "$jar_file" ]] && exit 1

    install -d -m0755 "$pkgdir/usr/share/$_pkgname/res"
    cp -r res/* "$pkgdir/usr/share/$_pkgname/res"
    install -Dm0664 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE.txt"
    install -Dm0644 AppIcon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm0644 "$jar_file" "$pkgdir/usr/share/java/$_pkgname.jar"

    _startfile="$pkgdir/usr/bin/$_pkgname.sh"
    _deskfile="$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm0644 /dev/stdin "$_deskfile" <<END
[Desktop Entry]
Name=MTG Forge (Snapshot)
Comment=$pkgdesc
Exec=/usr/bin/$_pkgname.sh
Terminal=false
Type=Application
Categories=Game;
Keywords=mtg magic gathering
Icon=$_pkgname
END

    install -Dm0644 /dev/stdin "$_startfile" <<END
#!/bin/sh
cd "/usr/share/$_pkgname"
exec /usr/bin/java -Xmx1024m -jar '/usr/share/java/$_pkgname.jar'
END
    chmod +x "$_startfile"
}
