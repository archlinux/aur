# Maintainer: Raimar Buehmann (raimar)

pkgname=lxpanel-git
pkgver=0.8.1.r2285.20150615
pkgrel=1
pkgdesc='Lightweight X11 desktop panel for LXDE'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-git')
depends=('alsa-lib' 'lxmenu-data' 'libwnck' 'libfm' 'libkeybinder2')
makedepends=('intltool' 'docbook-xml' 'docbook-xsl' 'wireless_tools' 'git')
provides=('lxpanel')
conflicts=('lxpanel')
optdepends=('wireless_tools: netstat plugin')
source=(
	$pkgname::git+http://git.lxde.org/git/lxde/lxpanel.git
#	$pkgname::git+http://git.lxde.org/git/lxde/lxpanel.git#commit=66b35a6e2d9d52a4bf9be326c132e41e34eda71e
#	$pkgname::git+git://git.lxde.org/git/lxde/lxpanel.git
#	lxpanel-volumealsa-volume-mapping.patch
)
sha256sums=('SKIP'
#            '926cdd81eb11b2be7aec1bb9889b88a07d7bd0ca7c22868e7eb4d5ff734fde1b'
)

pkgver() {
	# remove ".r*.*" from package version
	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
	cd $pkgname
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add ".r*.*" from package version
	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
}

prepare() {
	cd $pkgname
	# revert autohide by using timer on pointer every 300ms
	#git revert --no-edit e1fd11eee26bf6150c42216f2e825b35b48f50b7
	#git revert --no-edit 9a2c13d033233b273205e655600ff11d7e928af1
#	patch -Np1 -i ../lxpanel-volumealsa-volume-mapping.patch
}

build() {
	cd $pkgname
	./autogen.sh
	CFLAGS+=' -lgmodule-2.0'
	./configure --prefix=/usr --sysconfdir=/etc --enable-man
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install
}
