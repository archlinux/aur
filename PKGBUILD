# Maintainer: Raimar Buehmann (raimar)

pkgname=lxsession-git
pkgver=0.5.2.r997.20160417
pkgrel=1
epoch=1
pkgdesc='Lightweight X11 session manager for LXDE'
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL2')
groups=('lxde-git')
depends=('polkit' 'dbus-glib' 'libunique' 'libkeybinder2')
makedepends=('pkgconfig' 'intltool' 'docbook-xml' 'docbook-xsl' 'vala')
provides=('lxsession' 'lxsession-edit' 'lxpolkit' 'lxde-settings-daemon' 'lxsession-lite')
conflicts=('lxsession' 'lxsession-edit' 'lxpolkit' 'lxde-settings-daemon' 'lxsession-lite')
source=(
	$pkgname::git+http://git.lxde.org/git/lxde/lxsession.git
#	$pkgname::git+git://git.lxde.org/git/lxde/lxsession.git
	lxclipboard-startup.desktop
)
sha256sums=('SKIP'
            '0c8b776b74da5bb7b126a6bde058318ed84808c50599849ce73ada88db4d58d0')

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
	#patch -Np1 -i ../Create-lock-file-to-prevent-more-than-one-logout-dialog.patch
}

build() {
	cd $pkgname
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --disable-buildin-clipboard --disable-buildin-polkit
	make
}

package() {
	install -Dm644 'lxclipboard-startup.desktop' "${pkgdir}/etc/xdg/autostart/lxclipboard-startup.desktop"
	cd $pkgname
	make DESTDIR="$pkgdir" install
}
