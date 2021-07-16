# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=vscode-langservers-extracted
pkgname=vscode-langservers-extracted
pkgver=2.4.0
pkgrel=2
pkgdesc='vscode-langservers bin collection.'
arch=('any')
url='https://github.com/hrsh7th/vscode-langservers-extracted'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
_servers=(css html json)
for _server in "${_servers[@]}"; do
    source+=("vscode-$_server-language-server")
done
sha256sums=('7b2033734f26ba7abb017d31bc3208d2f446b5d324fd5663e716ba7ce82ba3c3'
            '1f085bae8d3a80ebf8899f4ddb6efc18438fe8f8ee54165e5d7003d40c73235e'
            '750f31ad2a1041500a6208d989a21fac09d73732c4ab3e2f4c9345b0b80f97a1'
            '8936486374e88da553e9da7993ced588c8e31fafb1e85763d9dede92be383d52')
noextract=("${_npmname}-${pkgver}.tgz")

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"

    for _server in "${_servers[@]}"; do
        install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/vscode-$_server-language-server"
    done
}
