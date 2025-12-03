# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_appprefix="/opt"
_appdataprefix="/var/opt"

pkgname=open-webui
pkgver=0.6.41
pkgrel=1
pkgdesc="Web UI and OpenAI API for various LLM runners, including Ollama"
arch=('any')
url="https://github.com/open-webui/open-webui"
license=('BSD-3-Clause')
depends=('python312')
makedepends=('npm' 'nvm' 'git')
optdepends=('ollama' 'tika-server')
conflicts=('open-webui-git' 'open-webui-no-venv')
source=("git+https://github.com/open-webui/open-webui.git#tag=v$pkgver"
    "open-webui.service"
    "open-webui.conf")

install="${pkgname}.install"
b2sums=('66cdc36d552a26aaaeb79d7c79aa632d6a5b72de7002cf547ad74c4887c989505ea6045b2d611995075395f9682297312e24fb995426591f80ca172b48388aa8'
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

prepare() {
    _ensure_local_nvm
    nvm install lts/jod
}

build() {
    _ensure_local_nvm
    cd "${pkgname}"
    export NODE_OPTIONS="--max_old_space_size=4096"
    npm install --force
    npm run format
    npm run i18n:parse
    npm run build
}

check() {
    _ensure_local_nvm
    cd "${pkgname}"
    export NODE_OPTIONS="--max_old_space_size=4096"
    npm run test:frontend
}

package() {
    # Install systemd service
    install -Dm644 "./$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # Install license
    install -Dm 644 "$srcdir/${pkgname}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # Install the default config file to /usr/share/$pkgname/open-webui.conf
    install -d "$pkgdir/usr/share/$pkgname"
    install -Dm644 "./$pkgname.conf" "$pkgdir/usr/share/$pkgname/$pkgname.conf"

    # Copy source to app's home directory
    parent_dir="$pkgdir/${_appprefix}"  # /opt

    install -d "$pkgdir/${_appprefix}/$pkgname"
    install -d "$pkgdir/${_appdataprefix}/$pkgname"
    install -d "$pkgdir/${_appdataprefix}/$pkgname/data"

    # copy over files
    cp -R "$srcdir/${pkgname}/." "$pkgdir/${_appprefix}/$pkgname"

    # clean up stuff we don't need
    rm -rf "$pkgdir/${_appprefix}/$pkgname/node_modules"
    rm -rf "$pkgdir/${_appprefix}/$pkgname/.git"

    # Fix permissions
    echo "Setting permissions for $pkgdir${_appprefix}/$pkgname"
    chmod 755 "$pkgdir/${_appprefix}/$pkgname"
    find "$pkgdir/${_appprefix}/$pkgname" -type d -exec chmod 755 {} \;
    find "$pkgdir/${_appprefix}/$pkgname" -type f -exec chmod 644 {} \;

    echo "Setting permissions for $pkgdir${_appdataprefix}/$pkgname"
    chmod 700 "$pkgdir/${_appdataprefix}/$pkgname"
    find "$pkgdir/${_appdataprefix}/$pkgname" -type d -exec chmod 700 {} \;
    find "$pkgdir/${_appdataprefix}/$pkgname" -type f -exec chmod 664 {} \;
}
