# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=reinamanager-git
_pkgname=ReinaManager
pkgver=0.29.1.r0.g414e596
pkgrel=1
pkgdesc="A lightweight galgame/visual-novel manager,Under development..."
arch=('x86_64' 'aarch64')
url="https://github.com/huoshen80/ReinaManager"
license=('AGPL-3.0-only')
depends=('openssl' 'libxcb' 'libsoup3' 'dbus' 'cairo'  'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'webkit2gtk-4.1')
makedepends=(
    'git'
    'rustup'
    )

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}-bin" "${pkgname%-git}")
options=('!lto' '!strip' '!emptydirs')
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')


pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare(){
    ls
    cd "$srcdir/${_pkgname}"

    pnpm install --frozen-lockfile

    # export CARGO_HOME="${srcdir}/${_pkgname}/.cargo"    # Download all to src directory, not in ~/.cargo
    cd src-tauri
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build(){
    cd "$srcdir/${_pkgname}"

    # disable auto update
    sed -i '/"createUpdaterArtifacts":/s/true/false/' src-tauri/tauri.conf.json

    pnpm tauri build -b deb
}

package() {
    cd "$srcdir/${_pkgname}"
    _pkgver="${pkgver%%.r*}"
    cp -a src-tauri/target/release/bundle/deb/${_pkgname}_${_pkgver}_*/data/* "${pkgdir}"
}
