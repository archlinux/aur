# Contributor: neuromante <lorenzo.nizzi.grifi@gmail.com>. Based on the PKGBUILDs by Garrett <garrett16@hotmail.it> and TDY <tdy@gmx.com>
# Maintainer: PhotonX <photon89 [at] gmail.com>. Taken over on 02.09.2011.

pkgname=shutter-bzr
_realname=shutter
pkgver=1272
pkgrel=3
pkgdesc="A featureful screenshot tool (formerly gscrot) - Mario Kemper's Experimental branch"
arch=('i686' 'x86_64')
url="http://shutter-project.org/"
license=('GPL3')
depends=('gconf-perl' 'gnome-perl' 'imagemagick' 'libxml-perl'
		'perl-gnome2-wnck' 'perl-gtk2-imageview' 'perl-locale-gettext'
		'perl-net-dbus' 'perl-www-mechanize' 'perl-x11-protocol'
		'perl-xml-simple' 'perl-libwww>=6.0' 'perl-gtk2-unique'
		'perl-proc-processtable' 'perl-file-which' 'perl-file-copy-recursive'
		'perl-proc-simple' 'perl-sort-naturally' 'perl-json')
makedepends=('bzr')
optdepends=('gnome-web-photo: web screenshot support'
		'perl-exiftool: read and write EXIF data'
		'nautilus-sendto: integration in Nautilus'
		'perl-goo-canvas: editing screenshots'
		'perl-net-dbus-glib: Ubuntu One support'
		'perl-gtk2-appindicator: AppIndicators support'
		'perl-net-dropbox-api: Dropbox upload support'
		'perl-path-class: Dropbox upload support'
		'perl-lwp-protocol-https: Dropbox upload support'
		'bc: 3D Rotate and 3D Reflection plugins support')
provides=('gscrot' 'shutter')
conflicts=('shutter')
replaces=('gscrot')
source=()
md5sums=()

_bzrtrunk=lp:shutter
_bzrmod=trunk

build() {
	cd ${srcdir}
	msg "Connecting to the server...."

	if [ ! -d ./${_bzrmod} ]; then
		bzr co ${_bzrtrunk} ${_bzrmod} 
	else
		bzr up ${_bzrmod}
	fi

	msg "BZR checkout done or server timeout"
	msg "Starting make..."

	[ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
	mkdir ${_bzrmod}-build
	cp -r ./${_bzrmod}/* ./${_bzrmod}-build
}
package() {
	cd ${srcdir}/${_bzrmod}-build
	install -Dm755 bin/$_realname "$pkgdir/usr/bin/$_realname"
	cp -r share "$pkgdir/usr/"
	find "$pkgdir/usr/share" -type d -exec chmod 755 '{}' \;
	find "$pkgdir/usr/share" -type f -exec chmod 644 '{}' \;
	find "$pkgdir" -path "*plugins*" -type f ! -name '*.*' -exec chmod 755 '{}' \;
	find "$pkgdir" -path "*upload_plugins/upload*" -type f -exec chmod 755 '{}' \;
	rm -fr /${_bzrmod}-build
} 
