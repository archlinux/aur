# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Taras Shpot <mrshpot@gmail.com>
pkgname=('rust-git' 'rust-doc-git')
pkgver=1.0.0.beta.2833.gb850046
epoch=3
pkgrel=1
pkgdesc="A safe, concurrent, practical language from Mozilla."
arch=('i686' 'x86_64')
url="http://www.rust-lang.org/"
license=('MIT' 'Apache')
makedepends=('git' 'gcc' 'curl'
             'libffi' 'python2')
optdepends=('haskell-pandoc: to build the documentation'
            'emacs: to build the emacs mode')
source=("git+https://github.com/rust-lang/rust.git"
        "git+https://github.com/rust-lang/compiler-rt.git"
        "git+https://github.com/rust-lang/jemalloc.git"
        "git+https://github.com/rust-lang/llvm.git"
        "git+https://github.com/rust-lang/hoedown.git"
        "git+https://github.com/rust-lang/rust-installer.git"

        "git+https://github.com/rust-lang/rust.vim.git"
        "git+https://github.com/rust-lang/rust-mode.git"
        "git+https://github.com/rust-lang/gedit-config.git"
        "git+https://github.com/rust-lang/nano-config.git"
        "git+https://github.com/rust-lang/zsh-config.git")
_noclone=(compiler-rt jemalloc llvm hoedown rust-installer)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd rust
	git describe | sed -e 's/^release-//' -e 'y/-/./'
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

	# src/rust/src/compiler-rt/make/platform/clang_linux.mk only exports LANG
	# when parsing the output of gcc -v. Let us set LC_ALL as well.
	export LANG=C LC_ALL=C

	./configure --prefix=/usr --disable-rpath
	make all
}

package_rust-git() {
	depends=('shared-mime-info')
	optdepends=('rust-doc-git: language and API documentation')
	provides=('rust')
	conflicts=('rust')
	options=('staticlibs')
	install=rust.install

	cd rust

	make DESTDIR="$pkgdir" install
	rm -fr "$pkgdir"/usr/share/doc/rust/html

	rm -f "$pkgdir"/usr/lib/rustlib/{components,manifest-rustc,manifest-rust-docs,rust-installer-version,install.log,uninstall.sh}

	install --directory "$pkgdir"/usr/share/licenses/rust-git/
	install -m644 COPYRIGHT LICENSE-* "$pkgdir"/usr/share/licenses/rust-git/

	install --directory "$pkgdir"/usr/share/vim/vimfiles/
	cp -a "$srcdir"/rust.vim/*/ "$pkgdir"/usr/share/vim/vimfiles/

	cp -a "$srcdir"/gedit-config/share "$pkgdir"/usr/

	install --directory "$pkgdir"/usr/share/zsh/functions/Completion/Zsh/
	cp -a "$srcdir"/zsh-config/_* "$pkgdir"/usr/share/zsh/functions/Completion/Zsh/

	install --directory "$pkgdir"/usr/share/nano/
	cp -a "$srcdir"/nano-config/*.nanorc "$pkgdir"/usr/share/nano/

	cd "$srcdir"/rust-mode
	emacs --eval '(byte-recompile-directory "." 0)' --quick --batch 2> /dev/null || true
	install --directory "$pkgdir"/usr/share/emacs/site-lisp/
	cp -a rust-mode.* "$pkgdir"/usr/share/emacs/site-lisp/
}

package_rust-doc-git() {
	pkgdesc="A safe, concurrent, practical language from Mozilla. (Language and API documentation)"
	arch=('any')
	options+=('!strip' '!emptydirs')
	optdepends=('rust-git: to compile and run the programs you can write using this documentation')
	provides=('rust-doc')
	conflicts=('rust-doc')

	cd rust

	_docdir="$pkgdir"/usr/share/doc/rust
	install --directory "$_docdir"
	cp -r doc/* "$_docdir"/ || true

	chmod -R 644 "$_docdir"
	find "$_docdir" -type d -exec chmod 755 {} +
	for ext in aux out log toc; do
		rm -f "$_docdir"/*."$ext"
	done

	install --directory "$pkgdir"/usr/share/licenses/rust-doc-git/
	install -m644 COPYRIGHT LICENSE-* "$pkgdir"/usr/share/licenses/rust-doc-git/
}
