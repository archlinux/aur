# Maintainer: Elia Nitsche <nitscheelia at gmail.com>

_enable_gtk=true
_enable_qt=true

pkgname=fauxdacious-git
_pkgname=fauxdacious
pkgver=4.5devel1.r662
pkgrel=1
pkgdesc="Audacious Audioplayer fork, adds DVD & video play, and much more (git version)"
arch=('x86_64')
url="https://wildstar84.wordpress.com/fauxdacious/"
license=('BSD' 'custom')
depends=('glib2')
makedepends=('make' 'autoconf' 'automake' 'git' 'glib2-devel')
optdepends+=('fauxdacious-plugins-git: needed for it to run, but needs to be installed afterwards')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}::git+https://github.com/wildstar84/fauxdacious.git")
sha256sums=('SKIP')

if [ "$_enable_gtk" = true ]; then
	depends+=('gtk3')
fi

if [ "$_enable_qt" = true ]; then
	depends+=('qt6-base' 'qt6-imageformats' 'qt6-svg')
fi

pkgver() {
	cd "${pkgname}"
	# get the version out of the configure.ac file and add commit count
	_versionDash=$(grep AC_INIT configure.ac | sed -E "s/.*\[(.*)\], \[(.*)\].*/\2/")
	_version=${_versionDash//-/}
	#_versionBase=${_versionDash%%-*}
	#_versionSuffix=${_versionDash#*-}
	_commits=$(git rev-list --count HEAD)
	#echo "${_versionBase}.r${_commits}${_versionSuffix}"
	echo "${_version}.r${_commits}"
}

prepare() {
	cd "${pkgname}"
	# configure autoreconf
	aclocal -I /usr/share/gettext/m4
	autoreconf -fvi
	# configure the build environment with scripts from upstream
	./autogen.sh
	./configure --prefix=/usr
}

build() {
	cd "${pkgname}"
	make
}

package() {
	#depends+=('fauxdacious-plugins-git')
	
	cd "${pkgname}"
	make DESTDIR=${pkgdir} install
	install -Dm644 ./contrib/fauxdacious.appdata.xml -t "$pkgdir/usr/share/metainfo"
	install -Dm644 ./COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
}
