# Maintainer: Carlen White <whitersuburban@gmail.com>
pkgname=fchat-rising-git
_pkgname=fchat-rising
pkgver=1.21.1
pkgrel=1
pkgdesc="The F-Chat 3.0 client from F-List modifed by MrStallion. Uses a system-wide electron instead of the built in."
arch=('x86_64')
url="https://github.com/mrstallion/fchat-rising"
license=('MIT')
depends=(
    'electron17'
    'libappindicator-gtk3'
    'libindicator-gtk3'
    'libnotify'
    'libxss'
    'libxtst'
    'libsecret'
)
makedepends=('yarn' 'npm' 'nvm' 'node-gyp')
provides=('fchat-3.0')
source=(
    "fchat::git+https://github.com/mrstallion/fchat-rising#tag=v$pkgver"
    'local://fchat.desktop'
    'local://deadletter.patch'
)
sha256sums=(
    'SKIP'
    'eaa27f1eb8bd228e9bd11a1cd068f30b3129abce85ab9f275de34dbf60ba8fba'
    '249e4e9263098b64399ccc8bcd9c64dca5b3858c244c061ccc2ebe37f32cb258'
)

_ensure_local_nvm() {
    # https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    cd $srcdir/fchat/
    git apply $srcdir/deadletter.patch
    cd $srcdir
    echo "Init NVM..."
    _ensure_local_nvm
    echo "Install Node v16..."
    nvm install v16
    echo "Enabling Node v16..."
    nvm use v16
}

build() {
    echo "Init NVM..."
    _ensure_local_nvm
    echo "Using Node v16..."
    nvm use v16
    cd $srcdir/fchat/
    HOME="$srcdir/.node" yarn install
    cd $srcdir/fchat/electron
    HOME="$srcdir/.node" yarn build:dist
    export SKIP_INSTALLER=TRUE
    HOME="$srcdir/.node" yarn run pack
    sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" "$srcdir"/fchat.desktop
    sed -i "s|Icon=.*|Icon=/usr/share/pixmaps/$_pkgname.png|" "$srcdir"/fchat.desktop
}

package() {
    export SKIP_INSTALLER=TRUE
    source /usr/share/nvm/init-nvm.sh
    nvm use v16
    cd $srcdir/fchat/electron
    install -d "$pkgdir"/usr/lib/$_pkgname
    cp -r "$srcdir"/fchat/electron/dist/F-Chat-linux-x64/resources/app/* "$pkgdir"/usr/lib/$_pkgname
    rm "$srcdir"/$_pkgname || true
    echo "#!/bin/sh" >> "$srcdir"/$_pkgname
    # F-Chat needs to executed within it's directory
    echo "cd /usr/lib/$_pkgname" >> "$srcdir"/$_pkgname
    echo "exec /usr/bin/electron17 ./ \$@" >> "$srcdir"/$_pkgname
    install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
    install -Dm 755 "$srcdir"/$_pkgname "$pkgdir"/usr/bin/$_pkgname
    cp "$srcdir"/fchat/electron/build/icon.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
    cp "$srcdir"/fchat.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop

    install -Dm 644 "$srcdir"/fchat/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
