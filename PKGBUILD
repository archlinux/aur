# Maintainer: Steffen Klee <steffen dot klee at gmail dot com>
pkgname='samsung-scantopc-webui'
_pkgname_base='samsung-scantopc'
pkgver=0.6.0
pkgrel=1
pkgdesc="Tool to interact with the \"scan to PC\" option in Samsung MFP. Web user interface."
arch=('any')
url="https://github.com/kleest/samsung-scantopc"
license=('GPL3')
depends=('samsung-scantopc' 'nodejs')
makedepends=('npm')
backup=('etc/samsung-scantopc/webui.env')
source=(
    "samsung-scantopc-webui.service"
    "webui.env"
    "$_pkgname_base-$pkgver.tar.gz::https://github.com/kleest/$_pkgname_base/archive/refs/tags/v$pkgver.tar.gz"
)
sha512sums=('02caabc53af0ce3ce333aac7d194f0abe3b46cc8aae32d18c874cfd5bc5b71d829bccaa04c972f9d8dfe805bf8ed97232c97db4f64d14c7829f1ff20a5b569c9'
            'f0c0c702377f8e87c80e552a0a835dcece70e51b3ffdb6d640e666cf0dd110ec2153025108b9502b953097358d86899ccd149a3f57d7db4642d55909531de295'
            '8a4769a6b0a7c7521fda3b040c30ef575b400e7036da69231ebbe3922309d2058143b326e86090ba53d8f0330986a89208c55a1af24bcb268cec5646ec87a965')

prepare() {
    cd "$_pkgname_base-$pkgver/tools/webui/"

    # frontend
    cd frontend/
    npm install --cache "$srcdir/tools/webui/npm-cache-frontend"

    # backend
    cd ../backend/
    npm install --cache "$srcdir/tools/webui/npm-cache-backend"
}

build() {
    cd "$_pkgname_base-$pkgver/tools/webui/"

    # frontend
    cd frontend/
    REACT_APP_API_BASE_URL=/api PUBLIC_URL=/ npm run build

    # backend
    cd ../backend/
}

package() {
    # frontend
    install -dm755 "$pkgdir/usr/share/samsung-scantopc/webui/frontend/"
    cp -aT "$_pkgname_base-$pkgver/tools/webui/frontend/build/" "$pkgdir/usr/share/samsung-scantopc/webui/frontend/"

    # backend
    cp -a "$_pkgname_base-$pkgver/tools/webui/backend/" "$pkgdir/usr/share/samsung-scantopc/webui/backend/"

    # common files
    install -Dm644 "$_pkgname_base-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "webui.env" "$pkgdir/etc/samsung-scantopc/webui.env"
    install -Dm644 "samsung-scantopc-webui.service" "$pkgdir/usr/lib/systemd/system/samsung-scantopc-webui.service"
}
