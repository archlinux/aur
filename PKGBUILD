# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Bader <Bad3r@pm.me>
# Acknowledgment: @pychuang (logseq-desktop-git) 

# avoid cluttering user home, while allowing data to be cached
export XDG_CONFIG_HOME="${SRCDEST:-$startdir}/node-home"
export HOME="$XDG_CONFIG_HOME"

# basic info
_pkgname="logseq-desktop"
pkgname="$_pkgname"
pkgver=0.10.3
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
arch=("x86_64")
url="https://logseq.com"
license=('AGPL3')

makedepends=(
    "clojure"
    "gendesk"
    "git"
    "nodejs"
    "npm"
    "yarn"
)

install="$pkgname.install"

_pkgsrc="logseq-${pkgver}"
source=(
    "$_pkgname-${pkgver}.zip::https://github.com/logseq/logseq/archive/refs/tags/${pkgver}.zip"
)
sha256sums=(
    '5894e163f0aa486a7d6c90b762bd19eb9c304a1c8affec20a1150d01ef8f6deb'
)

prepare() {
    cat <<'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
set -e

APPDIR="/opt/logseq-desktop"
_ELECTRON="${APPDIR}/Logseq"

_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/logseq-flags.conf"
if [ -r "$_FLAGS_FILE" ]; then
    _USER_FLAGS="$(cat "$_FLAGS_FILE")"
fi

if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} $_USER_FLAGS "$@"
else
    exec ${_ELECTRON} --no-sandbox $_USER_FLAGS "$@"
fi
EOF

    local _gendesk_options=(
        -q -f -n
        --pkgname="$_pkgname"
        --pkgdesc="$pkgdesc"
        --name="Logseq"
        --exec="logseq %u"
        --icon="logseq"
        --terminal=false
        --categories="Office"
        --mimetypes="x-scheme-handler/logseq"
        --startupnotify=true
        --custom="StartupWMClass=Logseq"
    )
    gendesk "${_gendesk_options[@]}"

    cd "$_pkgsrc"

    # download required js modules
    yarn install

    # create and sync files to folder `static`
    yarn gulp:build

    # go to folder `static` and download required js modules in static
    cd "static"
    yarn install

    # go back to the top-level folder and download clojure dependencies
    cd "${srcdir}/$_pkgsrc"
    clojure -P -M:cljs
}

build() {
    cd "$_pkgsrc"

    # build
    yarn cljs:release

    # packaging javescript files to an executable
    cd "static"
    yarn electron-forge package
}

package() {
    # create destination folder and copy files
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp --reflink=auto -a -r -u --verbose "$_pkgsrc/static/out/Logseq-linux-x64"/* "$pkgdir/opt/$_pkgname"

    # User flag aware launcher
    install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/logseq"

    # create license folder and make soft links to actual license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/opt/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/opt/$_pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/"

    # install readme and additional license file (the top-level AGPL3)
    install -Dm644 "$_pkgsrc/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "$_pkgsrc/LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname/"

    # copy xdg desktop files
    install -dm755 "$pkgdir/usr/share/applications"
    install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
