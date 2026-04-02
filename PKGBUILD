# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen 3.5 Plus (Alibaba).

pkgname=mikumikubeam-git
pkgver=r42.224d905
pkgrel=1
pkgdesc="An open-source network stresser tool but it's Hatsune Miku (Git version)"
arch=('x86_64')
url="https://github.com/sammwyy/MikuMikuBeam"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git' 'nodejs' 'npm')
provides=('mikumikubeam')
conflicts=('mikumikubeam')
options=('!debug' '!strip')

_commit=224d905571342e1a2f223061f347766c5a52170c
source=("$pkgname::git+https://github.com/sammwyy/MikuMikuBeam.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    # Очистка кэша Go modules от предыдущей сборки
    rm -rf "$srcdir/gopath/pkg/mod"
}

build() {
    cd "$pkgname"

    # Сборка web-client
    cd web-client
    npm install --no-audit --no-fund
    npm run build

    # Подготовка bin директории
    mkdir -p "$srcdir/bin"
    mv dist "$srcdir/bin/web-client"
    cd ..

    # Go сборка
    export GOMODCACHE="$srcdir/gopath/pkg/mod"
    export GOFLAGS="-mod=mod"
    go mod tidy

    export CGO_ENABLED=0
    go build -v -trimpath -ldflags="-s -w" -o bin/mmb-server ./cmd/mmb-server
    go build -v -trimpath -ldflags="-s -w" -o bin/mmb-cli ./cmd/mmb-cli
}

package() {
    cd "$pkgname"
    install -Dm755 bin/mmb-server "$pkgdir/usr/bin/mmb-server"
    install -Dm755 bin/mmb-cli "$pkgdir/usr/bin/mmb-cli"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Копирование web-client для работы веб-интерфейса
    # Сервер ищет статику в bin/web-client относительно своего расположения
    mkdir -p "$pkgdir/usr/bin/bin/web-client"
    cp -r "$srcdir/bin/web-client"/* "$pkgdir/usr/bin/bin/web-client/"
}
