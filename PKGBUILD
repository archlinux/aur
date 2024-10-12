# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=facad
pkgver=latest
pkgrel=2
pkgdesc="A modern, colorful ls alternative for bringing clarity to the filesystem ☀️"
arch=('any')
url="https://github.com/yellow-footed-honeyguide/facad"
license=('MIT')
depends=(
    'git'
    'meson' 
    'ninja' 
    'base-devel' 
    'sudo' 
    'unzip'
    'jq'
    'curl'
    'wget'
)

prepare() {
    url=$(curl -s https://api.github.com/repos/yellow-footed-honeyguide/facad/releases/latest | jq -r '.zipball_url')

    if [ -z "$url" ]; then
        echo "Could not get link to latest release"
        exit 1
    fi

    echo "The latest version will be downloaded from: $url"

    filename=$(basename "$url")

    wget -O "$srcdir/$filename" "$url" || { echo "Failed to download $url"; exit 1; }

    unzip -q "$srcdir/$filename" -d "$srcdir" || { echo "Failed to unzip $srcdir/$filename"; exit 1; }
}

build() {
    cd "$srcdir/yellow-footed-honeyguide-facad-"* || { echo "Failed to change directory"; exit 1; }

    mkdir build && cd build
    meson setup .. && ninja
}

package() {
    cd "$srcdir/yellow-footed-honeyguide-facad-"*/build || { echo "Failed to change directory"; exit 1; }
    ninja install
}