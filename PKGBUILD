# Maintainer: Urban Alič <https://github.com/ualich>

pkgbase=neuroforest-git
pkgname=neuroforest-git
pkgver=1.6.0.r353.8c1f84b
pkgrel=1
pkgdesc="NeuroForest knowledge engineering platform"
arch=('x86_64')
url="https://github.com/neuroforest"
license=('custom')
depends=('docker' 'docker-compose' 'python' 'rsync' 'ttf-liberation')
makedepends=('git' 'npm' 'pnpm' 'uv')
conflicts=('neuroforest')
provides=('neuroforest')
options=('!strip' '!debug')
_commit=8c1f84b308a90444fcdee85168e47facd76b12e5
source=("app::git+https://github.com/neuroforest/app.git#commit=$_commit"
        'neuro.sh'
        'neurowiki.sh'
        'neurowiki.desktop')
sha256sums=('SKIP'
            'c1ae7630bcdbd441112c7ba035e21fa0386d52b6f20bac2b318e8c1a130a473a'
            '7e9cefeebc70e3b2c5f5eb94d45c1589fd7dfa10e5f2f1f6ef41a092bb50fe5a'
            'fda674499a7514ee6154e2aa0af1d7b9b7eb90ec670414327398b60afe78ba34')

pkgver() {
    cd "$srcdir/app"
    local ver
    ver=$(grep -m1 '^APP_VERSION=' .env | cut -d= -f2)
    printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/app"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/app"
    python -m venv nenv
    nenv/bin/pip install ./neuro
    export APP_DIR="$PWD"
    export ENVIRONMENT=BUILD
    nenv/bin/invoke tw5.compile
    nenv/bin/invoke app.build
}

package() {
    local optdir="$pkgdir/opt/neuroforest"
    local repodir="$srcdir/app"
    local buildnenv="$repodir/build/nenv"

    install -dm755 "$optdir"
    rsync -a --exclude='__pycache__' "$repodir"/{build,tasks} "$optdir/"
    mv "$optdir/build/nenv" "$optdir/nenv"
    rsync -a --exclude='test' "$repodir/assets" "$optdir/"
    chmod -R a+rX "$optdir/"
    install -Dm444 "$repodir/.env" "$optdir/.env"
    install -Dm644 "$repodir"/{docker-compose.yml,Dockerfile} -t "$optdir/"

    # Fix venv references from build/nenv to final install path
    find "$optdir/nenv/bin" -type f -exec \
        sed -i "s|$buildnenv|/opt/neuroforest/nenv|g" {} +
    find "$optdir/nenv" -name 'direct_url.json' -delete
    sed -i "s|$buildnenv|/opt/neuroforest/nenv|g" "$optdir/nenv/pyvenv.cfg"

    install -Dm755 "$srcdir/neuro.sh" "$pkgdir/usr/bin/neuro"
    install -Dm755 "$srcdir/neurowiki.sh" "$pkgdir/usr/bin/neurowiki"

    install -Dm644 "$srcdir/neurowiki.desktop" \
        "$pkgdir/usr/share/applications/neurowiki.desktop"
    install -Dm644 "$repodir/assets/images/neuroforest.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/neuroforest.svg"
}
