# Maintainer: Peter Grayson <pete@jpgrayson.net>
# Contributor: Terin Stock <terinjokes@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=stgit-git
_pkgname=stgit
pkgver=r2526.48258d29
pkgrel=1
pkgdesc="Pushing/popping patches to/from a stack on top of Git, similar to Quilt"
url="https://stacked-git.github.io/"
arch=(x86_64)
makedepends=('cargo')
license=('GPL2')
depends=('git')
conflicts=('stgit')
source=("${_pkgname}::git+https://github.com/stacked-git/stgit.git#branch=rust")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	cargo build --release --locked --all-features
}

check() {
	cd "${_pkgname}"
	cargo test --all-features
}

package() {
	cd "${_pkgname}"

	install -D -m 0755 "target/release/stg" "${pkgdir}/usr/bin/stg"

	install -d "${pkgdir}/usr/share/stgit/completion"
	target/release/stg completion bash -o "${pkgdir}/usr/share/stgit/completion/stg.bash"
	target/release/stg completion fish -o "${pkgdir}/usr/share/stgit/completion/stg.fish"
	target/release/stg completion  zsh -o "${pkgdir}/usr/share/stgit/completion/stg.zsh"
	chmod 0644 "${pkgdir}/usr/share/stgit/completion/stg.bash"
	chmod 0644 "${pkgdir}/usr/share/stgit/completion/stg.fish"
	chmod 0644 "${pkgdir}/usr/share/stgit/completion/stg.zsh"
	install -d "${pkgdir}/usr/share/bash-completion/completions"
	install -d "${pkgdir}/usr/share/zsh/site-functions"
	install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
	ln -s "/usr/share/stgit/completion/stg.bash" "${pkgdir}/usr/share/bash-completion/completions/stg"
	ln -s "/usr/share/stgit/completion/stg.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/stg.fish"
	ln -s "/usr/share/stgit/completion/stg.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_stg"

	install -d "${pkgdir}/usr/share/emacs/site-lisp"
	install -D -m 0644 ./contrib/stgit.el "${pkgdir}/usr/share/emacs/site-lisp"

	install -d "${pkgdir}/usr/share/vim/vimfiles/ftdetect"
	install -d "${pkgdir}/usr/share/vim/vimfiles/syntax"
	install -D -m 0644 ./contrib/vim/ftdetect/stg.vim "${pkgdir}/usr/share/vim/vimfiles/ftdetect"
	for vimsyntax in ./contrib/vim/syntax/*.vim; do
		install -D -m 0644 "${vimsyntax}" "${pkgdir}/usr/share/vim/vimfiles/syntax/$(basename $vimsyntax)"
	done

	install -D -m 0644 "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}

