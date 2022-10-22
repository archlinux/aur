# Maintainer: Wenxuan <wenxuangm@gmail.com>
# Maintainer: Hongqi Yu <bowser1704@gmail.com>
_pkgname=ticli
pkgname=ticli-git
pkgver=0.1.0.20221022
pkgrel=1
pkgdesc='A modern cli for tikv'
arch=(i686 x86_64)
url='https://github.com/hackathon-2022-ticli/ticli'
license=('MIT' 'APACHE')
makedepends=('git' 'rust' 'cargo')
conflicts=("${_pkgname}" "${_pkgname}-bin")
provides=("${_pkgname}")

source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo "$(grep -oPm1 '(?<=^version = ")[^"]+' Cargo.toml).$(TZ=UTC git log -1 --pretty='%cd' --date=short-local | tr -d '-')" | tr '-' '.'
}

build() {
    cd "${_pkgname}"
	git submodule update --init
    cargo build --release --locked
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}"        "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "completions/fish/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 "completions/zsh/_${_pkgname}"      "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 "README.md"                         "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "LICENSE-MIT"                       "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE"                    "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
