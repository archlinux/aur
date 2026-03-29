# Maintainer: diplomat <diplomat@example.com>

pkgname=open-webui
pkgver=0.8.12
pkgrel=1
pkgdesc="Web UI and OpenAI API for various LLM runners, including Ollama"
arch=('any')
url="https://github.com/open-webui/open-webui"
license=('BSD-3-Clause')
depends=('python' 'npm')
makedepends=('git' 'nodejs-lts')
optdepends=('ollama' 'tika-server')
conflicts=('open-webui-git' 'open-webui-no-venv')
source=("git+https://github.com/open-webui/open-webui.git#tag=v$pkgver"
        "open-webui.service"
        "open-webui.conf"
        "open-webui.install"
        "LICENSE")
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
options=(!strip !debug)

_appprefix="/opt"
_appdataprefix="/var/opt"

prepare() {
    cd "$srcdir/$pkgname"
}

build() {
    cd "$srcdir/$pkgname"
    export PATH="/usr/lib/node_modules/node/bin:$PATH"
    python -m venv .venv
    source .venv/bin/activate
    pip install --upgrade pip setuptools wheel
    [ -f requirements.txt ] && pip install -r requirements.txt
    export NODE_OPTIONS="--max_old_space_size=4096"
    npm install --legacy-peer-deps
    npm run build
    deactivate
}

check() {
    return 0
}

package() {
    install -Dm644 "$srcdir/open-webui.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
    install -d "$pkgdir/usr/share/$pkgname"
    install -Dm644 "$srcdir/open-webui.conf" "$pkgdir/usr/share/$pkgname/$pkgname.conf"
    install -d "$pkgdir/${_appprefix}/$pkgname"
    install -d "$pkgdir/${_appdataprefix}/$pkgname/data"
    cp -R "$srcdir/$pkgname/." "$pkgdir/${_appprefix}/$pkgname"
    rm -rf "$pkgdir/${_appprefix}/$pkgname/.git"
    chmod 755 "$pkgdir/${_appprefix}/$pkgname"
    find "$pkgdir/${_appprefix}/$pkgname" -type d -exec chmod 755 {} \;
    find "$pkgdir/${_appprefix}/$pkgname" -type f -exec chmod 644 {} \;
    chmod 700 "$pkgdir/${_appdataprefix}/$pkgname"
    find "$pkgdir/${_appdataprefix}/$pkgname" -type d -exec chmod 700 {} \;
    find "$pkgdir/${_appdataprefix}/$pkgname" -type f -exec chmod 640 {} \;
}
