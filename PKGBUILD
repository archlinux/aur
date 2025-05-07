# Maintainer : Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# shellcheck disable=SC2034,SC2164,SC2154

_ver="v1.12.1"
_fragment="#tag=$_ver"
pkgname=ninja-mem
pkgver=${_ver%v}
pkgrel=1
pkgdesc='Small build system with a focus on speed (with trashing feature)'
arch=('i686' 'x86_64')
url='https://ninja-build.org/'
license=(Apache)
depends=(gcc-libs)
makedepends=(re2c emacs-nox git asciidoctor cmake gtest)
provides=('ninja')
conflicts=('ninja')
install=ninja-git.install

source=("git+https://github.com/ninja-build/ninja.git${_fragment}"
	'0001-Limit-job-execution-dependant-on-available-memory-m.patch')
b2sums=('959957c27f4444b6a7e547fcfa8042033dee9d279cc0833265b6bc4bddf128b19060473a115f06c215bf42271b243b896a9fe7efa00f4ef9dec3fa4c885af2a3'
        'e2c1a0b1fc817ca38a2a4bc57ce4a293e950655011c7afa632e0480934ceaf264489bf1367b88bac1885fe7bb4be87b7f8c789adad1d09a2092d797a14ca11b0')

function prepare {
	git -C ninja apply -v "${srcdir}/0001-Limit-job-execution-dependant-on-available-memory-m.patch"
}

function build {
	emacs -Q --batch -f batch-byte-compile ninja/misc/ninja-mode.el
	cmake -S ninja -B build
	cmake --build build
}

function check {
	./build/ninja_test
}

function package {
	cd ninja

	install -m755 -D "${srcdir}"/build/ninja "$pkgdir/usr/bin/ninja"
	install -m644 -D doc/manual.asciidoc "$pkgdir/usr/share/doc/ninja/manual.asciidoc"
	asciidoctor -b manpage  doc/manual.asciidoc -o "$pkgdir/usr/share/man/man1/ninja.1"

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	install -m644 -D misc/ninja-mode.el "$pkgdir/usr/share/emacs/site-lisp/ninja-mode.el"
	install -m644 -D misc/ninja-mode.elc "$pkgdir/usr/share/emacs/site-lisp/ninja-mode.elc"
	install -m644 -D misc/ninja.vim "$pkgdir/usr/share/vim/vimfiles/syntax/ninja.vim"

	install -m644 -D misc/bash-completion "$pkgdir/usr/share/bash-completion/completions/ninja"
	install -m644 -D misc/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_ninja"
}
