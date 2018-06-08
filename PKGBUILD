# $Id$
# Maintainer: James Kolb <jck1089@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=('zsh-athame-git')
pkgver=5.5.1
pkgrel=1
arch=('x86_64')
conflicts=('zsh')
provides=("zsh=${pkgver}")
url='http://github.com/ardagnir/athame/'
license=('custom' 'GPL' 'AGPL')
makedepends=('pcre' 'libcap' 'gdbm' 'git')
source=("https://www.zsh.org/pub/zsh-${pkgver}"{,-doc}".tar.gz"{,.asc}
        'zprofile'
        'git://github.com/ardagnir/athame'
        'git://github.com/ardagnir/vimbed')
sha512sums=('c4f7327a3f5480bd9a169fb07e34812e0106fa9de3b5f7d38bb0db85a3e4d01b9a4a8f35553da03a15d7d819108305cfaa2811c945273e2cac84512219e69ebb'
            'SKIP'
            'd121d3e642e15406ea3e570fe67bb023f27b10e3f12a6a8a8ad02b1f7070c88445f0431a411a8e54ff92a237ba7c4334f4d6f9fb3f4bebeade4c02e42bdf1a5e'
            'SKIP'
            'b287e00d8de4dc4cfb1c52bb2aef1d4b191de3512baad4c91dc81e78ddc3e5bb07297f43924b022ac44ff401a348d8a9fa366e19ddc8ea1ea72df311f5ed0034'
            'SKIP'
            'SKIP')
validpgpkeys=('F7B2754C7DE2830914661F0EA71D9A9D4BDB27B3')

prepare() {
	cd "${srcdir}/athame"
	git submodule init
	git config submodule.vimbed "${srcdir}/vimbed"
	git submodule update

	cd "${srcdir}/zsh-${pkgver}"

	# Set correct keymap path
	sed -i 's#/usr/share/keymaps#/usr/share/kbd/keymaps#g' Completion/Unix/Command/_loadkeys

	# Fix usb.ids path
	sed -i 's#/usr/share/misc/usb.ids#/usr/share/hwdata/usb.ids#g' Completion/Linux/Command/_lsusb

	# Remove unneeded and conflicting completion scripts
	for _fpath in AIX BSD Cygwin Darwin Debian Mandriva openSUSE Redhat Solaris; do
		rm -rf Completion/$_fpath
		sed "s#\s*Completion/$_fpath/\*/\*##g" -i Src/Zle/complete.mdd
	done
	rm Completion/Linux/Command/_{pkgtool,rpmbuild}

	# Remove tests that don't work with the new athame behavior.
	rm Test/[XY]*.ztst

	# Patch with athame
	${srcdir}/athame/athame_patcher.sh zsh ${srcdir}/athame
}

build() {
	cd "${srcdir}/zsh-${pkgver}"

	./configure --prefix=/usr \
		--docdir=/usr/share/doc/zsh \
		--htmldir=/usr/share/doc/zsh/html \
		--enable-etcdir=/etc/zsh \
		--enable-zshenv=/etc/zsh/zshenv \
		--enable-zlogin=/etc/zsh/zlogin \
		--enable-zlogout=/etc/zsh/zlogout \
		--enable-zprofile=/etc/zsh/zprofile \
		--enable-zshrc=/etc/zsh/zshrc \
		--enable-maildir-support \
		--with-term-lib='ncursesw' \
		--enable-multibyte \
		--enable-function-subdirs \
		--enable-fndir=/usr/share/zsh/functions \
		--enable-scriptdir=/usr/share/zsh/scripts \
		--with-tcsetpgrp \
		--enable-pcre \
		--enable-cap \
		--enable-zsh-secure-free
	make ATHAME_VIM_BIN="/usr/bin/vim" ATHAME_USE_JOBS_DEFAULT=1
}

check() {
	cd "${srcdir}/zsh-${pkgver}"
	HOME="${srcdir}" make check
}

package_zsh-athame-git() {
	pkgdesc='Zsh with Athame: provides full vim support for Zsh'
	depends=('pcre' 'libcap' 'gdbm' 'vim')
	backup=('etc/zsh/zprofile', 'etc/athamerc')
	install=zsh.install

	cd "${srcdir}/zsh-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -D -m644 "${srcdir}/zprofile" "${pkgdir}/etc/zsh/zprofile"
	install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "${srcdir}/athame"
	install -D -m644 "${srcdir}/athame/athamerc" "${pkgdir}/etc/athamerc"
}
