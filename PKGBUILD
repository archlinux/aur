# Maintainer: Urban Alič <https://github.com/ualich>

pkgbase=neuroforest-git
pkgname=neuroforest-git
pkgver=1.2.0.r120.7772b0f
pkgrel=1
pkgdesc="NeuroForest knowledge engineering platform"
arch=('x86_64')
url="https://github.com/neuroforest"
license=('custom')
depends=('docker' 'docker-compose' 'python' 'rsync' 'ttf-liberation')
makedepends=('git' 'npm')
conflicts=('neuroforest')
provides=('neuroforest')
options=('!strip' '!debug')
_commit=7772b0fdde699521a716012c871a5e31e503c2fe
source=("app::git+https://github.com/neuroforest/app.git#commit=$_commit"
        'neurowiki.sh'
        'neurowiki.desktop')
sha256sums=('SKIP'
            'b0f745fde1dbd9767d199266f7c5883f2e46510c7ece565a0743000e49629565'
            '7533ca9accca26b1537c5083a4141897ca2b85b5b0bd6982392d95e7ddf0d0f9')

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
    export NF_DIR="$PWD"
    export ENVIRONMENT=BUILD
    mkdir -p build
    nenv/bin/invoke desktop.build tw5.build
}

package() {
    local optdir="$pkgdir/opt/neuroforest"
    local repodir="$srcdir/app"

    install -dm755 "$optdir"
    rsync -aL --exclude='__pycache__' "$repodir"/{build,nenv,tasks} "$optdir/"
    chmod -R a+rX "$optdir/"
    install -Dm444 "$repodir/.env" "$optdir/.env"
    install -Dm644 "$repodir"/{docker-compose.yml,Dockerfile} -t "$optdir/"

    # Fix venv references to $srcdir
    find "$optdir/nenv/bin" -type f -exec \
        sed -i "s|$repodir/nenv|/opt/neuroforest/nenv|g" {} +
    find "$optdir/nenv" -name 'direct_url.json' -delete
    sed -i "s|$repodir|/opt/neuroforest|g" "$optdir/nenv/pyvenv.cfg"

    install -Dm755 "$srcdir/neurowiki.sh" "$pkgdir/usr/bin/neurowiki"
    ln -s /opt/neuroforest/nenv/bin/neuro "$pkgdir/usr/bin/neuro"
    install -Dm644 "$srcdir/neurowiki.desktop" \
        "$pkgdir/usr/share/applications/neurowiki.desktop"
    install -Dm644 "$repodir/assets/neuroforest.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/neuroforest.svg"
}
