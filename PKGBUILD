# Maintainer : Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# shellcheck disable=SC2034,SC2164,SC2154

_ver="v1.11.1"
_fragment="#tag=$_ver"
pkgname=ninja-mem
pkgver=${_ver%v}
pkgrel=1
pkgdesc='Small build system with a focus on speed (with trashing feature)'
arch=('i686' 'x86_64')
url='https://ninja-build.org/'
license=(Apache)
depends=(gcc-libs)
makedepends=(python re2c emacs-nox git asciidoctor)
provides=('ninja')
conflicts=('ninja')
install=ninja-git.install

source=("git+https://github.com/ninja-build/ninja.git${_fragment}"
	'0001-Limit-job-execution-dependant-on-available-memory-m.patch')
b2sums=('SKIP'
        '210babd66ba92b920f2e0374e0575f58f866cf0f0a1e6d32b79b009e4a9646504daaafaea6443331c749a048e69418006de4194e080d555ad34a500ce78a30e0')

function prepare {
	cd ninja

	git apply -v "${srcdir}/0001-Limit-job-execution-dependant-on-available-memory-m.patch"
}

function build {
	cd ninja

	python configure.py --bootstrap
	emacs -Q --batch -f batch-byte-compile misc/ninja-mode.el
}

function check {
	cd ninja

	python ./configure.py
	./ninja ninja_test
}

function package {
	cd ninja

	install -m755 -D ninja "$pkgdir/usr/bin/ninja"
	install -m644 -D doc/manual.asciidoc "$pkgdir/usr/share/doc/ninja/manual.asciidoc"
	asciidoctor -b manpage  doc/manual.asciidoc -o "$pkgdir/usr/share/man/man1/ninja.1"

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	install -m644 -D misc/ninja-mode.el "$pkgdir/usr/share/emacs/site-lisp/ninja-mode.el"
	install -m644 -D misc/ninja-mode.elc "$pkgdir/usr/share/emacs/site-lisp/ninja-mode.elc"
	install -m644 -D misc/ninja.vim "$pkgdir/usr/share/vim/vimfiles/syntax/ninja.vim"

	install -m644 -D misc/bash-completion "$pkgdir/usr/share/bash-completion/completions/ninja"
	install -m644 -D misc/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_ninja"
}
