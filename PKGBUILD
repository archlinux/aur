# Maintainer: James Atkins < hello at jamesatkins dot net >
#
# Stable version of [vim-qt](https://bitbucket.org/equalsraf/vim-qt) - includes "huge"
# features and support for perl, python2, python3, ruby and lua (luajit) plugins.

pkgname=qvim
pkgver=20150102
pkgrel=1
pkgdesc="A Qt Gui for Vim"
arch=("i686" "x86_64")
url="https://bitbucket.org/equalsraf/vim-qt"
license=('custom:vim')
depends=('qt4' 'vim-runtime' 'gpm' 'perl' 'python2' 'python' 'ruby' 'luajit' 'libxt')
makedepends=('desktop-file-utils' 'gettext' 'pkgconfig' 'git')
conflicts=('vim-qt-git')
options=(!strip)
install="${pkgname}.install"
source=("${pkgname}::git+https://bitbucket.org/equalsraf/vim-qt.git#tag=package-${pkgver}"
	'qvim.desktop'
	'qvim.svg')
md5sums=('SKIP'
	'bf0a2b39f308b1db61eaae92bf00b080'
	'58c3f5ca063bd624b9feb5942e4f2adf')

pkgver() {
	cd "$pkgname"

	# get version from most recent tag - make sure the tag in the correct format (package-YYYYMMDD)
	git describe --tags | perl -ne 'print $2 if /^(package-)([0-9]{8})$/; exit 0 if $2; exit 1'
}

build() {
	cd "$pkgname"

	msg2 "Configuring vim-qt"

	./configure --prefix=/usr \
	--localstatedir=/var/lib/vim \
	--mandir=/usr/share/man \
	--with-vim-name=qvim \
	--with-compiledby='Arch Linux' \
	--with-features=huge \
	--with-tlib=ncurses \
	--with-x=yes \
	--enable-fail-if-missing \
	--enable-acl \
	--enable-multibyte \
	--enable-gui=qt \
	--enable-cscope \
	--enable-perlinterp \
	--enable-pythoninterp \
	--enable-python3interp \
	--enable-rubyinterp \
	--enable-luainterp \
	--with-luajit

	msg2 "Compiling vim-qt"

	make
}

package() {
	cd "$pkgname"

	install -D src/qvim ${pkgdir}/usr/bin/qvim

	# Desktop entry
	install -Dm644 ${srcdir}/qvim.desktop ${pkgdir}/usr/share/applications/qvim.desktop

	# Icon
	install -Dm644 "${srcdir}/qvim.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/qvim.svg"
}
