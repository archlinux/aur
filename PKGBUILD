# Maintainer: dougefresh (dchimento@gmail.com)
# Contributor: Robin Jadoul (aur@ur4ndom.dev)
# Contributor: Wojciech Kępka (wojciech@wkepka.dev)
pkgname=helix-editor-git
_pkgname=helix
pkgver=25.07.r532.g78b999f11
pkgrel=1
pkgdesc="A text editor written in rust"
url="https://helix-editor.com"
license=("MPL-2.0")
_git="https://github.com/helix-editor/${_pkgname}.git"
arch=(x86_64)
makedepends=('git' 'cargo' 'rustup')
depends=()
provides=('hx')
conflicts=('helix' 'helix-git')
options=(!lto !debug)
source=("${_pkgname}::git+${_git}")
sha256sums=('SKIP')

_bin="hx"
_lib_path="/usr/lib/${_pkgname}"
_rt_path="${_lib_path}/runtime"


pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    export CARGO_TARGET_DIR=target
    cargo fetch --locked  --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}"
    export CARGO_TARGET_DIR=target
    cargo build \
       --profile release \
       --config 'build.rustflags=["-C", "target-cpu=native"]' \
       --locked
}

package() {
    cd "${_pkgname}"
    mkdir -p "${pkgdir}${_lib_path}"
    rm -r  "runtime/grammars/sources"
    cp -r "runtime" "${pkgdir}${_lib_path}"
    install -Dm 0755 "contrib/hx_launcher.sh" "${pkgdir}/usr/bin/${_bin}"
    install -Dm 0755 "target/release/${_bin}" "${pkgdir}${_lib_path}/${_bin}"
    install -Dm 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm 0644 "contrib/Helix.desktop" "${pkgdir}/usr/share/applications/Helix.desktop"
    install -Dm 0644 "contrib/Helix.appdata.xml" "${pkgdir}/usr/share/appdata/Helix.appdata.xml"
    install -Dm 0644 "contrib/helix.png" "${pkgdir}/usr/share/icons/helix.png"
    install -Dm 0644 "contrib/completion/hx.zsh" "${pkgdir}/usr/share/zsh/site-functions/_hx"
    install -Dm 0644 "contrib/completion/hx.bash" "${pkgdir}/usr/share/bash-completion/completions/hx.bash"
    install -Dm 0644 "contrib/completion/hx.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/hx.fish"

    # mdbook
    if [ -d book/src ]; then
      mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
      cp -r book/src/* "${pkgdir}/usr/share/doc/${_pkgname}"
    fi
}
