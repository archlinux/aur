# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=reinamanager
_pkgname=ReinaManager
pkgver=0.34.0
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
install=hint.install
sha256sums=('22a60b5f6675dd58b18e0978fa88c47f8fe649e1391eca0cdee5bf4d612ee231')




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
