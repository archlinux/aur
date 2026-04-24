# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-quota
_npmname=@slkiser/opencode-quota
pkgver=3.2.0
pkgrel=1
pkgdesc="OpenCode plugin for quota & token usage tracking with zero context window pollution"
arch=('any')
url="https://github.com/slkiser/opencode-quota"
license=('MIT')
depends=('opencode')
makedepends=('npm')
options=('!debug')
install=$pkgname.install

source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$pkgname-$pkgver.tgz")
sha256sums=('71c96b84953f0e5658c43aa574cd552014392077ce0b0a0384a4d91999314bf8')

latestver() {
    curl -fsSL "https://registry.npmjs.org/$_npmname/latest" | jq -r '.version'
}

package() {
    cd "$srcdir/package"
    npm install --omit=dev --ignore-scripts

    mapfile -t _peerdeps < <(python3 - <<'PY'
import json

for name, version in json.load(open('package.json')).get('peerDependencies', {}).items():
    print(f"{name}@{version}")
PY
    )
    if ((${#_peerdeps[@]})); then
        rm -rf "$srcdir/peer-root"
        npm install --prefix "$srcdir/peer-root" --omit=dev --ignore-scripts "${_peerdeps[@]}"
        cp -a "$srcdir/peer-root/node_modules/." node_modules/
    fi

    # Remove build tools pulled in by npm resolution (not needed at runtime)
    rm -rf node_modules/typescript node_modules/.bin

    install -d "$pkgdir/usr/lib/opencode/plugins/$pkgname"
    cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
