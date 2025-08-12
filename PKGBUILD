# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Ben Davis <bendavis78@gmail.com>

_appname="open-webui"
_appprefix="/opt"
_appdataprefix="/var/opt"

pkgname="${_appname}-git"
pkgver=0.6.22.r0.g438e5d9
pkgrel=1
pkgdesc="Web UI and OpenAI API for various LLM runners, including Ollama"
arch=("any")
url="https://github.com/open-webui/open-webui"
license=("MIT")
depends=('python312')
makedepends=('git' 'npm' 'nvm')
optdepends=('ollama' 'tika-server')
conflicts=('open-webui' 'open-webui-no-venv')
provides=('open-webui')
source=(
    "${pkgname}::git+${url}"
    "open-webui.service"
    "open-webui.conf"
)
install="${pkgname}.install"
b2sums=('SKIP'
        '1438948b9e31ccbcfe7eab5965de71b0fb23bc205579c6668cd91f805a17d5a0b2379afeac3148fb0701125e210eebb81f4bdd5496bc9b0d080766ecf71d32bf'
        '1538695adbe92507ef8c319f4aba22bd9c8843ecaebfaf8860485316564708809c92becc0d0634467b068e8d6b17992c2f210f1bdb344d72b0e01db243ac24ca')
options=(!strip !debug)

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    _ensure_local_nvm
    nvm install lts/iron
}

build() {
    _ensure_local_nvm
    cd "$srcdir/$pkgname"
    export NODE_OPTIONS="--max_old_space_size=4096"
    npm install --force
    npm run format
    npm run i18n:parse
    npm run build
}

check() {
    _ensure_local_nvm
    cd "$srcdir/$pkgname"
    export NODE_OPTIONS="--max_old_space_size=4096"
    npm run test:frontend
}

package() {
    # Install systemd service
    install -Dm644 "./$_appname.service" "$pkgdir/usr/lib/systemd/system/$_appname.service"

    # Install license
    install -Dm 644 "$srcdir/${pkgname}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # Install the default config file to /usr/share/$_appname/open-webui.conf
    install -d "$pkgdir/usr/share/$_appname"
    install -Dm644 "./$_appname.conf" "$pkgdir/usr/share/$_appname/$_appname.conf"

    # Copy source to app's home directory
    parent_dir="$pkgdir${_appprefix}"  # /opt

    install -d "$pkgdir${_appprefix}/$_appname"
    install -d "$pkgdir${_appdataprefix}/$_appname"
    install -d "$pkgdir/${_appdataprefix}/$_appname/data"

    # copy over files
    cp -R "$srcdir/${pkgname}/." "$pkgdir${_appprefix}/$_appname"

    # clean up stuff we don't need
    rm -rf "$pkgdir${_appprefix}/$_appname/node_modules"
    rm -rf "$pkgdir${_appprefix}/$_appname/.git"

    # Fix permissions
    echo "Setting permissions for $pkgdir${_appprefix}/$_appname"
    chmod 755 "$pkgdir${_appprefix}/$_appname"
    find "$pkgdir${_appprefix}/$_appname" -type d -exec chmod 755 {} \;
    find "$pkgdir${_appprefix}/$_appname" -type f -exec chmod 644 {} \;

    echo "Setting permissions for $pkgdir${_appdataprefix}/$_appname"
    chmod 755 "$pkgdir${_appdataprefix}/$_appname"
    find "$pkgdir${_appdataprefix}/$_appname" -type d -exec chmod 700 {} \;
    find "$pkgdir${_appdataprefix}/$_appname" -type f -exec chmod 664 {} \;
}
