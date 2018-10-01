# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: noonov <noonov@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

_pkgname=uim
pkgname=${_pkgname}-git
pkgver=1.8.0.alpha.r352.gc79432cb
pkgrel=4
epoch=1
pkgdesc='Multilingual input method library'
url='https://github.com/uim/uim/wiki'
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('libxft' 'libedit')
makedepends=('git' # for cloning
			 'intltool' 'gettext' # core dependencies
			 'gtk2' 'gtk3' 'qt4' 'qt5-tools' # frontend plugins
			 'anthy' 'm17n-lib' # input method plugins
			 'qt5-x11extras' # platform input context plugin
			 'ruby') # generate functable-r5rs-syntax.c etc.
optdepends=('qt4: immodule and helper applications'
			'qt5-x11extras: platform input context plugin'
            'gtk2: immodule and helper applications'
            'gtk3: immodule and helper applications'
            'emacs: uim.el bridge software'
			'm17n-lib: m17n support'
			'anthy: Japanese input method')
provides=('uim')
conflicts=('uim' 'uim-svn')
source=("git+https://github.com/uim/uim.git"
		"git+https://github.com/uim/sigscheme.git"
		"git+https://github.com/uim/libgcroots.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/^uim-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git config submodule.sigscheme.url "${srcdir}/sigscheme"
  git submodule update

  cd "${srcdir}/${_pkgname}/sigscheme"
  git submodule init
  git config submodule.libgcroots.url "${srcdir}/libgcroots"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}/sigscheme"
  ./autogen.sh

  cd "${srcdir}/${_pkgname}/sigscheme/libgcroots"
  ./autogen.sh

  cd "${srcdir}/${_pkgname}"
  ./autogen.sh

  cmd=(./configure
	   --enable-maintainer-mode # necessary for building from Git
	   --prefix=/usr
	   --libexecdir=/usr/lib/uim
	   --with-anthy-utf8
	   --with-qt4-immodule
	   --with-qt4
	   --with-qt5-immodule
	   --with-qt5
	  )
  "${cmd[@]}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install -j1 # FS#41112
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
