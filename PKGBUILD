# Maintainer: Moses Miller <Majora320@gmail.com>

fetch_version() {
    python <<EOF
import requests,json

response = requests.get("https://dev.azure.com/EverestAPI/Olympus/_apis/build/builds")
builds = json.loads(response.text)
stable_builds = -1

for b in builds["value"]:
    if b["sourceBranch"] == "refs/heads/stable" :
        stable_builds = max(int(b["id"]), stable_builds)

if stable_builds == -1:
    os.exit(1)
else:
    print(stable_builds)
EOF
}

pkgname=olympus-bin
pkgver=$(fetch_version)
pkgrel=1
pkgdesc='A mod manager for Celeste'
arch=('x86_64')
url='https://github.com/EverestAPI/Olympus'
license=('MIT')
depends=('love' 'lua51-lsqlite3')
makedepends=('unzip' 'python' 'python-requests')
source=("$pkgname-$pkgver.zip::https://dev.azure.com/EverestAPI/Olympus/_apis/build/builds/$pkgver/artifacts?artifactName=linux.main&\$format=zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('372e2738248d1c61cc3d06f73850448214cd958107562edbe1620ee37cf0b8b4')


prepare() {
    unzip "$pkgname-$pkgver.zip"
    cd linux.main
    unzip dist.zip
}

package() {
    cd linux.main

    install -Dm755 subprocess.so "$pkgdir/usr/lib/olympus/subprocess.so"
    install -Dm755 nfd.so "$pkgdir/usr/lib/olympus/nfd.so"
    install -Dm755 olympus.love "$pkgdir/usr/lib/olympus/olympus.love"
    install -Dm644 olympus.desktop "$pkgdir/usr/share/applications/olympus.desktop"
    install -Dm644 olympus.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/olympus.png"
    install -Dm755 olympus "$pkgdir/usr/lib/olympus/olympus"
    install -Dm755 find-love "$pkgdir/usr/lib/olympus/find-love"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/usr/lib/olympus/olympus" "$pkgdir/usr/bin/olympus"
    
    cp -r sharp "$pkgdir/usr/lib/olympus/sharp"
    rm "$pkgdir/usr/lib/olympus/sharp/Olympus.Sharp.bin.osx"
}
