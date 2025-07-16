# Maintainer: rutra
pkgname=forge-gui-desktop-git
_pkgname=forge-gui-desktop
pkgver=2.0.05.snapshot.07.15
pkgrel=1
pkgdesc="Implementation of Magic the Gathering that lets you play against a computer AI (daily snapshot)"
arch=('any')
url="https://github.com/Card-Forge/forge"
license=('GPL3')
depends=('jre17-openjdk')
provides=('forge-gui-desktop')
conflicts=('forge-gui-desktop')
source=("AppIcon.png::https://github.com/Card-Forge/forge/raw/master/AppIcon.png")
sha256sums=('SKIP')

pkgver() {
    local api_response version_url version_content formatted

    api_response=$(curl -sLf "https://api.github.com/repos/Card-Forge/forge/releases/tags/daily-snapshots") || {
        echo "ERROR: Failed to fetch API data" >&2
        return 1
    }

    version_url=$(echo "$api_response" | jq -r '.assets[] | select(.name == "version.txt") | .browser_download_url')
    if [[ -z "$version_url" || "$version_url" == "null" ]]; then
        echo "ERROR: version.txt URL not found" >&2
        return 1
    fi

    version_content=$(curl -sLf "$version_url") || {
        echo "ERROR: Could not fetch version.txt" >&2
        return 1
    }

    formatted=$(echo "$version_content" | sed -E 's/-SNAPSHOT-/.snapshot./; s/-//g')
    if [[ -z "$formatted" ]]; then
        echo "ERROR: Version transformation failed" >&2
        return 1
    fi

    echo "$formatted"
}


prepare() {
    cd "$srcdir"
    echo "Fetching latest snapshot info..."

    local api_response=$(curl -s "https://api.github.com/repos/Card-Forge/forge/releases/tags/daily-snapshots")
    local tarball_url=$(echo "$api_response" | jq -r '.assets[] | select(.name | startswith("forge-installer") and endswith(".tar.bz2")) | .browser_download_url' | head -n 1)

    if [ -z "$tarball_url" ] || [ "$tarball_url" = "null" ]; then
        echo "Could not find valid snapshot."
        exit 1
    fi

    local tarball_name=$(basename "$tarball_url")
    curl -L -o "$tarball_name" "$tarball_url"
    tar xf "$tarball_name"

    ls -l
}


package() {
    cd "$srcdir"

    install -d -m0755 "$pkgdir"/usr/share/$_pkgname/res
    cp -r res/* "$pkgdir"/usr/share/$_pkgname/res

    install -Dm0664 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE.txt"
    install -Dm0644 "$srcdir"/AppIcon.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png

    jarver=$(echo "$pkgver" | tr '[:lower:]' '[:upper:]' | sed 's/\.SNAPSHOT/-SNAPSHOT-/; s/\.//g')

    install -Dm0644 forge-gui-desktop-*-jar-with-dependencies.jar "$pkgdir"/usr/share/java/$_pkgname.jar


    _deskfile="$pkgdir/usr/share/applications/$pkgname.desktop"
    _startfile="$pkgdir/usr/bin/$_pkgname.sh"
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

    install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$_pkgname.sh" <<END
#!/bin/sh
cd "/usr/share/$_pkgname"
exec /usr/bin/java -Xmx1024m -jar "/usr/share/java/$_pkgname.jar"
END
    chmod +x "$_startfile"
}

