# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgbase=zsh
pkgname=('zsh-minimal-git' 'zsh-doc-minimal-git')
pkgver=5.2.r502.ge35dcae
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.zsh.org/'
license=('custom')
makedepends=('git' 'pcre' 'libcap' 'gdbm')
source=('zsh::git://git.code.sf.net/p/zsh/code'
        'zprofile')
md5sums=('SKIP'
         '24a9335edf77252a7b5f52e079f7aef7')

pkgver() {
	cd "${srcdir}/${_pkgbase}"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
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
		--disable-maildir-support \
		--with-term-lib='ncursesw' \
		--enable-multibyte \
		--enable-function-subdirs \
		--enable-fndir=/usr/share/zsh/functions \
		--enable-scriptdir=/usr/share/zsh/scripts \
		--with-tcsetpgrp \
		--enable-pcre \
		--enable-cap \
		--disable-zsh-debug \
		--disable-zsh-mem-debug \
		--disable-zsh-mem-warning \
		--disable-zsh-heap-debug \
		--disable-zsh-valgrind \
		--disable-zsh-hash-debug \
		--enable-zsh-secure-free
	make

}

#check() {
#	cd "${srcdir}/${_pkgbase}"
#	HOME="${srcdir}" make check
#}

package_zsh-minimal-git() {
	pkgdesc='A very advanced and programmable command interpreter (shell) for UNIX'
	depends=('pcre' 'libcap' 'gdbm')
	conflicts=('zsh')
	provides=("zsh=${pkgver%%.r*}")
	backup=('etc/zsh/zprofile')
	install=zsh.install

	cd "${srcdir}/${_pkgbase}"
	make DESTDIR="${pkgdir}/" install
	install -D -m644 "${srcdir}/zprofile" "${pkgdir}/etc/zsh/zprofile"
	install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_zsh-doc-minimal-git() {
   pkgdesc='Info, HTML and PDF format of the ZSH documentation'
   conflicts=('zsh-doc')
   provides=('zsh-doc')

   cd "${srcdir}/${_pkgbase}"
   make DESTDIR="${pkgdir}/" install.info install.html
   install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
