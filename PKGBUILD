# Maintainer: Xerxes_2 <dspxue@gmail.com>
pkgname=helix-steel-git
_pkgname=helix
pkgver=r0.00000000
pkgrel=1
pkgdesc="Helix fork with Steel event system support (git, replaces helix)"
url="https://github.com/mattwparas/helix"
license=("MPL-2.0")
_git="https://github.com/mattwparas/${_pkgname}.git"
_branch="steel-event-system"
arch=(x86_64)
makedepends=('git' 'cargo')
optdepends=('steel: package management and LSP support')
provides=('helix' 'hx')
conflicts=('helix')
options=(!lto)
source=("${_pkgname}::git+${_git}#branch=${_branch}")
sha256sums=('SKIP')

_bin="hx"
_lib_path="/usr/lib/${_pkgname}"
_rt_path="${_lib_path}/runtime"

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

prepare() {
    cat > "$_bin" << EOF
#!/usr/bin/env sh
HELIX_RUNTIME=${_rt_path} exec ${_lib_path}/${_bin} "\$@"
EOF
    chmod +x "$_bin"

    cd "${_pkgname}"
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}"
    export CARGO_TARGET_DIR=target
    cargo build --locked --profile opt --features steel,git
}

package() {
    cd "${_pkgname}"
    mkdir -p "${pkgdir}${_lib_path}"
    rm -r "runtime/grammars/sources"
    cp -r "runtime" "${pkgdir}${_lib_path}"
    install -Dm 0755 "target/opt/${_bin}" "${pkgdir}${_lib_path}/${_bin}"
    install -Dm 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm 0755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/${_bin}"
    install -Dm 0644 "contrib/Helix.desktop" "${pkgdir}/usr/share/applications/Helix.desktop"
    install -Dm 0644 "contrib/Helix.appdata.xml" "${pkgdir}/usr/share/appdata/Helix.appdata.xml"
    install -Dm 0644 "contrib/helix.png" "${pkgdir}/usr/share/icons/helix.png"
    install -Dm 0644 "contrib/completion/hx.zsh" "${pkgdir}/usr/share/zsh/site-functions/_hx"
    install -Dm 0644 "contrib/completion/hx.bash" "${pkgdir}/usr/share/bash-completion/completions/hx.bash"
    install -Dm 0644 "contrib/completion/hx.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/hx.fish"
}
