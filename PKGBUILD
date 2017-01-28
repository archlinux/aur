# Contributor: neuromante <lorenzo.nizzi.grifi@gmail.com>. Based on the PKGBUILDs by Garrett <garrett16@hotmail.it> and TDY <tdy@gmx.com>
# Maintainer: PhotonX <photon89 [at] gmail.com>. Taken over on 02.09.2011.

pkgname=shutter-bzr
_realname=shutter
pkgver=1278
pkgrel=10
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
source=('bug_1396368.patch'
	'bug_1618310.patch'
	'bug_731874.patch'
	'CVE-2015-0854.patch'
	'bug_1596733.patch')
md5sums=('0d35f8b2439cb5634fe75d3210d6c3e9'
	'6ba9ded906a6de88a29fdc62a411af25'
	'1c6233dbd912fa7836f2e5ed69ef555d'
	'8eed7a77e7a0c488d01a3cbc415dfb5a'
	'a2ac67b81fe6b1ec817c32d6afe1beb7')

_bzrtrunk=lp:shutter
_bzrmod=trunk

build() {
	cd ${srcdir}
	msg "Connecting to the server...."
	
	# LANG=C for bzr commands as temporary workaround for https://bugs.launchpad.net/bzr/+bug/1644003
	if [ ! -d ./${_bzrmod} ]; then
		LANG=C bzr co ${_bzrtrunk} ${_bzrmod} 
	else
		LANG=C bzr up ${_bzrmod}
	fi

	msg "BZR checkout done or server timeout"
	msg "Starting make..."

	[ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
	mkdir ${_bzrmod}-build
	cp -r ./${_bzrmod}/* ./${_bzrmod}-build
	patch ${srcdir}/${_bzrmod}-build/share/shutter/resources/system/upload_plugins/upload/Dropbox.pm < bug_1396368.patch
	patch ${srcdir}/${_bzrmod}-build/bin/shutter < bug_1618310.patch
	patch ${srcdir}/${_bzrmod}-build/bin/shutter < bug_731874.patch
	patch ${srcdir}/${_bzrmod}-build/share/shutter/resources/modules/Shutter/App/HelperFunctions.pm < CVE-2015-0854.patch
	cd ${srcdir}/${_bzrmod}-build/
	patch -p0 < "${srcdir}/bug_1596733.patch"
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
