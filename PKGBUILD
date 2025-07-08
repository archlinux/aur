#Maintainer: Ludwintor <ludwintor at proton dot me>

pkgname=tonkeeper
pkgver=4.1.1
pkgrel=2
pkgdesc='Your desktop wallet on The Open Network'
arch=(any)
url=https://tonkeeper.com
license=(Apache-2.0)
depends=(gtk3 libnotify nss libxtst xdg-utils at-spi2-core libdrm mesa libxcb glib2 alsa-lib)
makedepends=(git nvm)
optdepends=(
    'org.freedesktop.secrets: Store secrets'
)
options=(!debug)
source=("git+https://github.com/tonkeeper/tonkeeper-web.git#tag=v${pkgver}"
         tonkeeper.desktop
         tonkeeper.png)
sha256sums=('c4f6f63037e1a3777984c5301149c23cae9a082854b75ad081ae09456293a258'
            '4a4aee7691da80aba21dbd1bff28791e9edd6ea5e9712457207c6e1b0bc6c5d5'
            'e9dc80e0c41560ca754f668196054317494d32eed827ac0afbf641d86f799d40')

_ensure_local_nvm() {
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/tonkeeper-web/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm
    cd "tonkeeper-web"
    nvm install
    corepack enable
    corepack install
}

build() {
    _ensure_local_nvm
    cd "tonkeeper-web"
    yarn install
    yarn build:pkg
    cd "apps/desktop"
    yarn package
}

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"
    cp -r tonkeeper-web/apps/desktop/out/Tonkeeper-linux-*/. "${pkgdir}/opt/tonkeeper"
    chmod 755 "${pkgdir}/opt/tonkeeper"
    ln -s /opt/tonkeeper/Tonkeeper "${pkgdir}/usr/bin/tonkeeper"

    install -Dm644 tonkeeper.desktop "${pkgdir}/usr/share/applications/tonkeeper.desktop"
    install -Dm644 tonkeeper.png "${pkgdir}/usr/share/pixmaps/tonkeeper.png"
}
