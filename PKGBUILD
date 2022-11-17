# Maintainer: Robin Jadoul (aur@ur4ndom.dev) 
pkgname=helix-git
_pkgname=helix
pkgver=r3147.eef9eff2
pkgrel=1
pkgdesc="A text editor written in rust"
url="https://helix-editor.com"
_git="https://github.com/helix-editor/${_pkgname}.git"
arch=(x86_64)
makedepends=('cargo')
depends=()
provides=('hx')
conflicts=('helix')
source=("${_pkgname}::git+${_git}")
sha256sums=('SKIP')

_bin="hx"
_lib_path="/usr/lib/${_pkgname}"
_rt_path="${_lib_path}/runtime"


pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cat > "$_bin" << EOF
#!/usr/bin/env sh
HELIX_RUNTIME=${_rt_path} exec ${_lib_path}/${_bin} "\$@"
EOF
	chmod +x "$_bin"

    cd "${_pkgname}"
    git submodule update --force --init --recursive --depth 1 --jobs 8

}

build() {
	cd "${_pkgname}"
	cargo build --release --locked
}

check() {
	cd "${_pkgname}"
	cargo test --all-features
}

package() {
	cd "${_pkgname}"
	mkdir -p "${pkgdir}${_lib_path}"
	cp -r "runtime" "${pkgdir}${_lib_path}"
	install -Dm 0755 "target/release/${_bin}" "${pkgdir}${_lib_path}/${_bin}"
	install -Dm 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm 0777 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/${_bin}"
}
