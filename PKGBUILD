# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Taras Shpot <mrshpot@gmail.com>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
pkgname=('rust-git' 'rust-docs-git' 'rust-src-git')
pkgver=1.0.0.beta.2833.gb850046
epoch=3
pkgrel=3
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=('i686' 'x86_64')
url="http://www.rust-lang.org/"
license=('MIT' 'Apache')
makedepends=('git' 'libffi' 'python2' 'curl' 'llvm' 'jemalloc')
source=("git+https://github.com/rust-lang/rust.git"
        "git+https://github.com/rust-lang/compiler-rt.git"
        "git+https://github.com/rust-lang/libc.git"
        "git+https://github.com/rust-lang/hoedown.git"
        "git+https://github.com/rust-lang/rust-installer.git"

        "git+https://github.com/rust-lang/rust.vim.git"
        "git+https://github.com/rust-lang/rust-mode.git"
        "git+https://github.com/rust-lang/zsh-config.git")
_noclone=(compiler-rt libc hoedown rust-installer)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd rust
	echo "$(grep -m1 'CFG_RELEASE_NUM' src/bootstrap/channel.rs | cut -d'"' -f2)"."$(git rev-parse --short HEAD)"
}

prepare() {
	rm -rf -- "${_noclone[@]}"

	cd rust
	_srcdest="$SRCDEST" perl -pi -- /dev/stdin .gitmodules <<'END'
		if (m{(?<assignment> \s* url \s* = \s*) .* / (?<submodule> [^/]*?)(?:\.git)?$}x) {
			my $local = "$ENV{_srcdest}/$+{submodule}";
			$_ = "$+{assignment}$local\n" if -d $local;
		}
END
}

build() {
	cd rust

	./configure \
		--prefix=/usr \
		--llvm-root=/usr \
		--enable-llvm-link-shared \
		--jemalloc-root=/usr/lib/

	make
}

package_rust-git() {
	depends=('shared-mime-info' 'llvm-libs')
	optdepends=('rust-docs-git: language and API documentation')
	provides=('rust')
	conflicts=('rust')
	options=('staticlibs')
	install=rust.install

	cd rust

	make DESTDIR="$pkgdir" install

	rm -f "$pkgdir"/usr/lib/rustlib/{components,manifest-rust-docs,install.log,uninstall.sh}

	install --directory "$pkgdir"/usr/share/licenses/$pkgname/
	install -m644 COPYRIGHT LICENSE-* "$pkgdir"/usr/share/licenses/$pkgname/

	install --directory "$pkgdir"/usr/share/vim/vimfiles/
	cp -a "$srcdir"/rust.vim/*/ "$pkgdir"/usr/share/vim/vimfiles/

	install --directory "$pkgdir"/usr/share/zsh/functions/Completion/Zsh/
	cp -a "$srcdir"/zsh-config/_* "$pkgdir"/usr/share/zsh/functions/Completion/Zsh/

	cd "$srcdir"/rust-mode
	emacs --eval '(byte-recompile-directory "." 0)' --quick --batch 2> /dev/null || true
	install --directory "$pkgdir"/usr/share/emacs/site-lisp/
	cp -a rust-mode.* "$pkgdir"/usr/share/emacs/site-lisp/

	rm -fr "$pkgdir"/usr/share/doc
}

package_rust-docs-git() {
	pkgdesc="Systems programming language focused on safety, speed and concurrency (Language and API documentation)"
	arch=('any')
	options+=('!strip' '!emptydirs')
	optdepends=('rust-git: to compile and run the programs you can write using this documentation')
	provides=('rust-doc' 'rust-docs')
	conflicts=('rust-doc' 'rust-docs')
	replaces=('rust-doc-git')

	cd rust

	install --directory "$pkgdir"/usr/share/doc
	cp -r doc "$pkgdir"/usr/share/doc/rust

	install --directory "$pkgdir"/usr/share/licenses/$pkgname/
	install -m644 COPYRIGHT LICENSE-* "$pkgdir"/usr/share/licenses/$pkgname/
}

package_rust-src-git() {
	pkgdesc="Systems programming language focused on safety, speed and concurrency (Source Code)"
	arch=('any')
	provides=('rust-src')
	conflicts=('rust-src')

	cd rust
	git checkout-index -a --prefix "$pkgdir"/usr/src/rust/
}
