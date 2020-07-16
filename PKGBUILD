pkgname=activitywatch
pkgver=0.9.2
pkgrel=1
url="https://activitywatch.net/"
license=("MPL2")
arch=('x86_64')
depends=(
    'python'  # obviously

    # aw-core
    'python-appdirs' 'python-iso8601' 'python-jsonschema' 'python-peewee'
    'python-json-logger' 'python-strict-rfc3339' 'python-takethetime'

    # aw-client
    'python-requests' 'python-persist-queue'

    # aw-server
    'python-flask' 'python-flask-restx' 'python-flask-cors' 'python-werkzeug'

    # aw-qt
    'python-pyqt5'

    # aw-watcher-{afk,window}
    'python-xlib' 'python-pyuserinput'
)
makedepends=('python-dephell' 'npm')
source=(
    "git+https://github.com/ActivityWatch/activitywatch#tag=v$pkgver"
    "git+https://github.com/ActivityWatch/aw-client"
    "git+https://github.com/ActivityWatch/aw-client-js"
    "git+https://github.com/ActivityWatch/aw-core"
    "git+https://github.com/ActivityWatch/media"
    "git+https://github.com/ActivityWatch/aw-qt"
    "git+https://github.com/ActivityWatch/aw-server"
    "git+https://github.com/ActivityWatch/aw-server-rust"
    "git+https://github.com/ActivityWatch/aw-webui"
    "git+https://github.com/ActivityWatch/aw-watcher-afk"
    "git+https://github.com/ActivityWatch/aw-watcher-window"
)

prepare() {
    cd "$srcdir/$pkgname"

    git submodule init
    for submodule in aw-{core,client,qt,server,watcher-{afk,window}}; do
        git config submodule.$submodule.url "$srcdir/${submodule##*/}"
    done
    git submodule update

    git -C aw-qt submodule init
    git -C aw-server submodule init
    git -C aw-server-rust submodule init

    git -C aw-qt config submodule.media.url "$srcdir/media"
    git -C aw-server config submodule.aw-webui.url "$srcdir/aw-webui"
    git -C aw-server-rust config submodule.aw-webui.url "$srcdir/aw-webui"

    git -C aw-qt submodule update
    git -C aw-server submodule update
    git -C aw-server-rust submodule update

    git -C aw-server/aw-webui submodule init
    git -C aw-server-rust/aw-webui submodule init
    git -C aw-server/aw-webui config submodule.aw-client-js.url "$srcdir/aw-client-js"
    git -C aw-server-rust/aw-webui config submodule.aw-client-js.url "$srcdir/aw-client-js"
    git -C aw-server/aw-webui submodule update
    git -C aw-server-rust/aw-webui submodule update

    msg2 "Checking for new submodules..."

    # if this outputs anything, add them to the sources array and set them up like above.
    git submodule update --recursive

    for repo in aw-{core,client,qt,server,watcher-{afk,window}}; do
        pushd $repo
        dephell deps convert --from pyproject.toml --to setup.py
        popd
    done

    pushd aw-core
    sed -i "s/packages=\\['aw_core'\\]/packages=['aw_core', 'aw_datastore', 'aw_transform', 'aw_query']/" setup.py
    popd

}

build() {
    export DISABLE_OPENCOLLECTIVE=1  # what the fuck is this shit
    cd "$srcdir/$pkgname"

    pushd aw-qt
    pyrcc5 -o aw_qt/resources.py aw_qt/resources.qrc
    popd

    pushd aw-server/aw-webui/aw-client-js
    npm ci --no-fund
    npm run compile
    popd

    pushd aw-server/aw-webui
    npm ci --no-fund
    npm run build
    popd

    pushd aw-server
    mkdir -p aw_server/static/
    cp -rv aw-webui/dist/* aw_server/static
    popd

    for repo in aw-{core,client,qt,server,watcher-{afk,window}}; do
        pushd $repo
        python setup.py build
        popd
    done
}

package() {
    cd "$srcdir/$pkgname"

    for repo in aw-{core,client,qt,server,watcher-{afk,window}}; do
        pushd $repo
        python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build
        popd
    done

    pushd aw-server
    install -Dm644 misc/aw-server.service "$pkgdir/usr/lib/systemd/user/aw-server.service"
    popd
}

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
