# Maintainer: Egor Kovetskiy <e.kovetskiy@gmail.com>
pkgname=spotbugs
_pkgname=spotbugs
pkgver=4.0.3
pkgrel=1
pkgdesc="SpotBugs is FindBugs' successor. A tool for static analysis to look for bugs in Java code."
arch=('i686' 'x86_64')
license=('GPL')
depends=(
)
makedepends=(
    'git'
    'jq'
    'curl'
)
backup=(
)

_get_release_json() {
    curl -s https://api.github.com/repos/spotbugs/spotbugs/releases/latest
}

pkgver() {
    if [[ "$PKGVER" ]]; then
        echo "$PKGVER"
        return
    fi

    _get_release_json | jq -r .tag_name
}

build() {
    cd "$srcdir"
    if [[ ! -f $pkgver.zip ]]; then
        zip=$(_get_release_json \
            | jq -r '.assets | .[] | select(.name | startswith("spotbugs-")) | select(.name | endswith(".zip")) | .browser_download_url')
        if [[ ! "$zip" ]]; then
            echo "Unable to find release asset URL" >&2
            exit 1
        fi
        curl -L -o $pkgver.zip "$zip"
    fi

    unzip -f $pkgver.zip
}

package() {
    mkdir -p "$pkgdir/usr/lib/spotbugs/" "$pkgdir/usr/bin/"
    cp -ra "$srcdir/spotbugs-$pkgver/"* "$pkgdir/usr/lib/spotbugs/"
    ln -s "/usr/lib/spotbugs/bin/spotbugs" "$pkgdir/usr/bin/spotbugs"
    chmod +x "$pkgdir/usr/lib/spotbugs/bin/"*
}
