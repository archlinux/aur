# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=reinamanager
_pkgname=ReinaManager
pkgver=0.29.2
pkgrel=1
pkgdesc="A lightweight galgame/visual-novel manager,Under development..."
arch=('x86_64' 'aarch64')
url="https://github.com/huoshen80/ReinaManager"
license=('AGPL-3.0-only')
depends=('openssl' 'libxcb' 'libsoup3' 'dbus' 'cairo'  'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'webkit2gtk-4.1')
makedepends=(
    'rustup'
    )
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
options=('!lto' '!strip' '!emptydirs')
source=("${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('0596a2c054e58213b881f1cfeb15721aefa4739cb661c2aea8ad8424b9f2cc9b')




prepare(){
    cd "$srcdir/${_pkgname}-${pkgver}"

    pnpm install --frozen-lockfile

    # export CARGO_HOME="${srcdir}/${_pkgname}/.cargo"    # Download all to src directory, not in ~/.cargo
    cd src-tauri
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build(){
    cd "$srcdir/${_pkgname}-${pkgver}"

    # disable auto update
    sed -i '/"createUpdaterArtifacts":/s/true/false/' src-tauri/tauri.conf.json


    #FIXME faile to build due to ring link fail
    pnpm tauri build -b deb
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    cp -a src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver}_*/data/* "${pkgdir}"
}
