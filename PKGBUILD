# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgbase=zsh
pkgname=('zsh-fix-winchanged-git' 'zsh-fix-winchanged-doc-git')
pkgver=5.7.1.r312.g8f21786fc
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/romkatv/powerlevel10k/issues/175#issuecomment-522345552'
license=('custom')
makedepends=('git' 'yodl' 'texinfo' 'texlive-plainextra' 'pcre' 'libcap' 'gdbm')
source=('zsh::git://github.com/romkatv/zsh#branch=fix-winchanged'
        'zprofile')
md5sums=('SKIP'
         '24a9335edf77252a7b5f52e079f7aef7')

pkgver() {
	cd "${srcdir}/${_pkgbase}"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${_pkgbase%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

prepare() {
	cd "${srcdir}/${_pkgbase}"

	# Set correct keymap path
	sed -i 's#/usr/share/keymaps#/usr/share/kbd/keymaps#g' Completion/Unix/Command/_loadkeys

	# Fix usb.ids path
	sed -i 's#/usr/share/misc/usb.ids#/usr/share/hwdata/usb.ids#g' Completion/Linux/Command/_lsusb

	# Remove unneeded and conflicting completion scripts
	for _fpath in AIX BSD Cygwin Darwin Debian Mandriva openSUSE Redhat Solaris; do
		rm -rf Completion/$_fpath
		sed "s#\s*Completion/$_fpath/\*/\*##g" -i Src/Zle/complete.mdd
	done
	rm -f  Completion/Linux/Command/_{pkgtool,rpmbuild,yast}
	rm -f  Completion/Unix/Command/_{osc,systemd}
}

build() {
	cd "${srcdir}/${_pkgbase}"

	./Util/preconfig
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
	make

	cd "${srcdir}/${_pkgbase}/Doc"

	make zsh.pdf
}

check() {
	cd "${srcdir}/${_pkgbase}"
	HOME="${srcdir}" make check
}

package_zsh-fix-winchanged-git() {
	pkgdesc='A very advanced and programmable command interpreter (shell) for UNIX; patched to minimize reflow artifacts'
	depends=('pcre' 'libcap' 'gdbm')
	conflicts=('zsh' 'zsh-git')
	provides=("zsh=${pkgver%%.r*}")
	backup=('etc/zsh/zprofile')
	install=zsh.install

	cd "${srcdir}/${_pkgbase}"
	make DESTDIR="${pkgdir}/" install
	install -D -m644 "${srcdir}/zprofile" "${pkgdir}/etc/zsh/zprofile"
	install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

package_zsh-fix-winchanged-doc-git() {
	pkgdesc='Info, HTML and PDF format of the ZSH documentation'
	conflicts=('zsh-doc' 'zsh-doc-git')
	provides=('zsh-doc')

	cd "${srcdir}/${_pkgbase}"
	make DESTDIR="${pkgdir}/" install.info install.html
	install -D -m644 Doc/zsh.pdf "${pkgdir}/usr/share/doc/zsh/zsh.pdf"
	install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/zsh-doc/LICENSE"
}
