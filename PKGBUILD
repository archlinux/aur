pkgname=activitywatch
pkgver=0.13.2
pkgrel=2
url="https://github.com/ActivityWatch/${pkgname}"
pkgdesc="automatically tracks how you spend time on your devices"
license=("MPL2")
arch=('x86_64')
depends=(
    'python'  # obviously

    # aw-core
    'python-jsonschema' 'python-peewee' 'python-platformdirs' 'python-iso8601' 'python-strict-rfc3339' 'python-tomlkit' 'python-deprecation' 'python-timeslot'

    # aw-client
    'python-requests' 'python-persist-queue' 'python-click' 'python-tabulate'

    # aw-server
    'python-flask' 'python-flask-restx' 'python-flask-cors' 'python-importlib-metadata' 'python-werkzeug'

    # aw-qt
    'python-pyqt6'
    # 'python-importlib-metadata'

    # aw-watcher-{afk,window}
    'python-pynput' 'python-xlib'
)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-pip' 'npm')
source=("git+${url}.git#tag=v${pkgver}")
sha512sums=('SKIP')


prepare() {
    cd "$pkgbase"
    git submodule update --init --recursive
}

build() {
    echo $pkgbase
    cd "$pkgbase/aw-core"
    pwd
    python -m build --wheel --no-isolation

    cd "../aw-client"
    python -m build --wheel --no-isolation

    cd "../aw-server"
    python -m build --wheel --no-isolation

    cd aw-webui
    npm install
    npm run build
    cp media/logo/logo.png ./dist/
    cp media/logo/logo.svg ./dist/


    cd "../../aw-qt"
    python -m build --wheel --no-isolation


    cd "../aw-watcher-afk"
    sed -i "s/,<3.13//g" pyproject.toml
    python -m build --wheel --no-isolation


    cd "../aw-watcher-window"
    sed -i "s/,<3.13//g" pyproject.toml
    python -m build --wheel --no-isolation


    # cd "../aw-notify"
    # python -m build --wheel --no-isolation


    # cd "../aw-watcher-input"
    # python -m build --wheel --no-isolation

}

package() {
    python_lib_dir=$(python -c "import site; print(site.getsitepackages()[0])")
    echo $python_lib_dir

    cd "$pkgbase/aw-core"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./dist/*.whl


    cd "../aw-client"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./dist/*.whl


    cd "../aw-server"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./dist/*.whl
    rm -rf "$pkgdir/$python_lib_dir/aw_server/static"
    mkdir "$pkgdir/$python_lib_dir/aw_server/static"
    cp -r aw-webui/dist/* "$pkgdir/$python_lib_dir/aw_server/static/"


    cd "../aw-qt"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./dist/*.whl
    mkdir -p "$pkgdir/usr/share/applications/"
    mkdir -p "$pkgdir/usr/share/icons/"
    install -Dm644 resources/aw-qt.desktop "$pkgdir/usr/share/applications/"
    install -Dm644 media/logo/logo.png "$pkgdir/usr/share/icons/activitywatch.png"
    mkdir -p "$pkgdir/${python_lib_dir}/media/logo/"
    install -Dm644 media/logo/logo-128.png "$pkgdir/${python_lib_dir}/media/logo/logo.png"


    cd "../aw-watcher-afk"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./dist/*.whl


    cd "../aw-watcher-window"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./dist/*.whl


    # cd "../aw-notify"
    # PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./dist/*.whl

    # cd "../aw-watcher-input"
    # PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./dist/*.whl

}
