# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# shellcheck disable=SC2034,SC2164,SC2154

_ver="v1.10.0"
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
sha1sums=('SKIP'
          'a0841bd3d367f04169456525878e4b34079808ff')

function prepare {
	cd ninja

	git apply -v "${srcdir}/0001-Limit-job-execution-dependant-on-available-memory-m.patch"
}

#function pkgver {
#	cd ninja
#
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

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
