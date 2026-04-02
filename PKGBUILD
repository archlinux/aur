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
install=mikumikubeam-git.install

_commit=224d905571342e1a2f223061f347766c5a52170c
source=("$pkgname::git+https://github.com/sammwyy/MikuMikuBeam.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    # Сборка web-client
    cd web-client
    npm install --no-audit --no-fund
    npm run build

    # Подготовка bin директории
    rm -rf "$srcdir/bin"
    mkdir -p "$srcdir/bin"
    mv dist "$srcdir/bin/web-client"
    cd ..

    # Go сборка - кэш вне srcdir для избежания проблем с правами
    export GOMODCACHE="/tmp/mikumikubeam-gomod-cache"
    mkdir -p "$GOMODCACHE"
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
    # Копируем содержимое public/ прямо в bin/web-client/
    rm -rf "$pkgdir/usr/bin/bin/web-client"
    mkdir -p "$pkgdir/usr/bin/bin/web-client"
    cp -r "$srcdir/bin/web-client/public/"* "$pkgdir/usr/bin/bin/web-client/"

    # Создаём директорию для данных и конфига (будут заполнены при установке)
    install -dm755 "$pkgdir/var/lib/mikumikubeam"
    install -dm755 "$pkgdir/etc/mikumikubeam"

    # Пример конфига
    cat > "$pkgdir/etc/mikumikubeam/config.toml.example" << 'EOF'
proxies_file = "/var/lib/mikumikubeam/proxies.txt"
user_agents_file = "/var/lib/mikumikubeam/uas.txt"
server_port = 3000
allowed_origin = "http://localhost:5173"
EOF

    # systemd сервис
    install -Dm644 "$startdir/mmb-server.service" "$pkgdir/usr/lib/systemd/system/mmb-server.service"
}
