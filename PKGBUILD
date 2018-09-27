# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Julio González <juliolokoo at gmail dot com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
# Contributor: alegotta <algottardi at disroot dot org>

pkgname='xampp'
pkgver='7.2.10'
pkgrel=1
pkgdesc="A free and open source cross-platform web server package (LAMP Stack), consisting mainly of the Apache HTTP Server, MySQL database, and interpreters for scripts written in the PHP and Perl programming languages"
url="http://www.apachefriends.org/"
license=('GPL')
arch=('x86_64')
depends=('net-tools')
optdepends=('polkit: to run XAMPP Manager from menu')
makedepends=('fakeuser-git' 'proot')
source=('lampp.service'
	'xampp-manager.desktop'
	'xampp-manager.png')
source_x86_64=("https://www.apachefriends.org/xampp-files/${pkgver}/${pkgname}-linux-x64-${pkgver}-0-installer.run"
	'org.freedesktop.xampp-manager.policy'
	'xampp-manager-polkit')
options=(!strip)
install='xampp.install'
sha256sums=('9aa2e9b2ec768b7e0d5394cf27653a7c9d0291a890d058293109f1aeace79150'
            '595de672753af57c4abf1b4549530bba02b004bd45dfa82054d58ea3a174a4e6'
            '3df1d2fa8a8dbba21944045503b94315e5b7bc38b968ca5a816a57b83c6fd77a')
sha256sums_x86_64=('7af597647957b84ba455c7298dc51ced04c713b6e1312d67f951d259e7bc7531'
                   '4092631d86ec1c3a155bfec76ea2c8433426a13f12a7a5866f843a099f1ca418'
                   '210beb9372baf79f01b783db6d93a0f9a07289af64dd72d9e09baecd0799a76b')

_fakeadd_error() {

	echo 'Due to limitations of the .run file of this package, you must have a mysql user'
	echo 'in your system prior to its build.'
	echo
	echo 'You can create a mysql user by doing:'
	echo
	echo '  groupadd mysql -g 992'
	echo '  useradd -u 992 -r -g mysql -s /bin/false mysql'

	return 1

}

prepare() {

	cd "${srcdir}"

	# Against proot error `proot info: pid XXXX: terminated with signal 11`
	export PROOT_NO_SECCOMP=1

	# Enable fakeadd under fakeroot environment
	export LD_PRELOAD='/usr/lib/fakeuser/libfakeuser.so'

}

package() {

	cd "${srcdir}"

	install -dm755 "${pkgdir}/opt/lampp"

	msg 'Creating a temporary mysql user/group with fakeadd...'

	getent group mysql > /dev/null || fakeadd -G -n mysql -g 992 || _fakeadd_error
	getent passwd mysql > /dev/null || fakeadd -U -n mysql -g 992 -u 992 -s /bin/false || _fakeadd_error

	msg 'Extracting package (this might take several minutes, don'\''t give up!)...'

	chmod +x "${srcdir}/${pkgname}-linux-x64-${pkgver}-0-installer.run"

	proot -0 -b "${pkgdir}/opt/lampp:/opt/lampp" "${srcdir}/${pkgname}-linux-x64-${pkgver}-0-installer.run" \
		--mode unattended --disable-components 'xampp_developer_files' --debuglevel 4 --launchapps 0 \
		--debugtrace "${srcdir}/bitrock_debug.log"


	msg 'Copying executables and launcher...'

	chmod g-s -R "${pkgdir}/opt/lampp"

	# Licenses
	install -dm755 "${pkgdir}/usr/share/licenses/xampp"
	cp "${pkgdir}/opt/lampp/licenses"/* "${pkgdir}/usr/share/licenses/xampp"

	# Executables
	install -dm755 "${pkgdir}/usr/bin"
	ln -sf '/opt/lampp/lampp' "${pkgdir}/usr/bin/xampp"
	ln -sf '/opt/lampp/lampp' "${pkgdir}/usr/bin/lampp"
	install -Dm755 "${srcdir}/xampp-manager-polkit" "${pkgdir}/usr/bin/xampp-manager_polkit"

	# Systemd service
	install -dm755 "${pkgdir}/etc/systemd/system"
	cp "${srcdir}/lampp.service" "${pkgdir}/etc/systemd/system"

	# Desktop launcher
	install -Dm755 "${srcdir}/xampp-manager.png" "${pkgdir}/usr/share/pixmaps/xampp-manager.png"
	install -Dm755 "${srcdir}/xampp-manager.desktop" "${pkgdir}/usr/share/applications/xampp-manager.desktop"

	# Install policy file for desktop launcher
	install -Dm644 "${srcdir}/org.freedesktop.xampp-manager.policy" "${pkgdir}/usr/share/polkit-1/actions/org.freedesktop.xampp-manager.policy"

}

