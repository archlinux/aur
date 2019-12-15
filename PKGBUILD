# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Julio González <juliolokoo at gmail dot com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
# Contributor: alegotta <algottardi at disroot dot org>
# Contributor: oguzkagan <me@oguzkaganeren.com.tr>

pkgname='xampp'
pkgver='7.3.12'
pkgrel=1
pkgdesc="A free and open source cross-platform web server package (LAMP Stack), consisting mainly of the Apache HTTP Server, MySQL database, and interpreters for scripts written in the PHP and Perl programming languages"
url="http://www.apachefriends.org/"
license=('GPL')
arch=('x86_64')
depends=('net-tools' 'mariadb')
optdepends=('polkit: to run XAMPP Manager from menu')
makedepends=('fakeuser-git' 'sdx')
source=('lampp.service'
	'xampp-manager.desktop'
	'xampp-manager.png'
	'xampp-control-panel'
	'properties.ini'
	'xampp-control-panel.desktop'
    'bitrock-unpacker.tcl')
source_x86_64=("https://www.apachefriends.org/xampp-files/${pkgver}/${pkgname}-linux-x64-${pkgver}-0-installer.run"
	'org.freedesktop.xampp-manager.policy'
	'xampp-manager-polkit')
options=(!strip)
install='xampp.install'
sha256sums=('9aa2e9b2ec768b7e0d5394cf27653a7c9d0291a890d058293109f1aeace79150'
            '595de672753af57c4abf1b4549530bba02b004bd45dfa82054d58ea3a174a4e6'
            '3df1d2fa8a8dbba21944045503b94315e5b7bc38b968ca5a816a57b83c6fd77a'
            '35499d6ccf6f4429432b6a484ae21c6813a9d89ccb4b59463018f8b84477cb64'
            '567dcfe99dde385cd93da38ea2ffa9ae9b350d8b4019debc1fb22b3154df4206'
            '731daee35514cce22b8d6b37224bfec08302d219a59b1b30acc3c6b1a799634a'
            '3f262ef4b3e752992667ab482cbf364e3b9e6f95b4b6fb12a1ce6fa7a88f124e')
sha256sums_x86_64=('0bfb680f0745df93bea7a90de44357ff7729c2c29f7aa9880d9987f7ba539be4'
                   '4092631d86ec1c3a155bfec76ea2c8433426a13f12a7a5866f843a099f1ca418'
                   '210beb9372baf79f01b783db6d93a0f9a07289af64dd72d9e09baecd0799a76b')

# Make sure to synchronize the UUID declared here with the one declared in `xampp.install`
_mysql_uuid=992

_fakeadd_error() {

	echo
	echo 'A problem occurred while attempting to launch fakeuser. Due to limitations of'
	echo 'the .run file of this package, you must create a mysql user in your system'
	echo 'before building the package.'
	echo
	echo 'You can create a mysql user by launching:'
	echo
	echo "  groupadd mysql -g ${_mysql_uuid}"
	echo "  useradd -u ${_mysql_uuid} -r -g mysql -s /bin/false mysql"
	echo

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


	msg 'Extracting package...'

	chmod +x "${srcdir}/${pkgname}-linux-x64-${pkgver}-0-installer.run"
    
        ./bitrock-unpacker.tcl ${srcdir}/xampp-linux-x64-${pkgdir}-0-installer.run ${pkgdir}
	msg 'Copying executables and launcher...'
	rsync -avz --remove-source-files "${pkgdir}/xampp_core_files/xampp_core_folder"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/xampp_developer_files/xampp_developer_folder"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/native_apache_adapter/apache_xampp_linux"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/native_proftpd_adapter/proftpd_xampp_linux"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/native_mysql_adapter/mysql_xampp_linux"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/manager/binary"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/common_native_adapter/common"/. "${pkgdir}/opt/lampp"


	#access to phpmyadmin
	chmod 777 ${pkgdir}/opt/lampp/temp
	mkdir ${pkgdir}/opt/lampp/phpmyadmin/tmp
	chmod 777 ${pkgdir}/opt/lampp/phpmyadmin/tmp


	#phpadmin mysql settings
	find ${pkgdir}/opt/lampp/phpmyadmin -type f -exec sed -i 's/localhost/localhost:3306/gI' {} \;
	#make links
	ln -sf '/opt/lampp/xampp' "${pkgdir}/opt/lampp/lampp"
	mkdir ${pkgdir}/opt/lampp/share/lampp
	ln -sf '/opt/lampp/share/xampp/' "${pkgdir}/opt/lampp/share/lampp/"
	
	msg 'Changes root location in files(may take a few minutes)...'
	# Change root location for all files
	find ${pkgdir}/opt/lampp/ -type f -exec sed -i 's/\@\@BITNAMI_XAMPP_ROOT\@\@/\/opt\/lampp/gI' {} \;
	find ${pkgdir}/opt/lampp/ -type f -exec sed -i 's/\@\@BITROCK_INSTALLDIR\@\@/\/opt\/lampp/gI' {} \;

	#For mysql
	#for using mariadb
	find ${pkgdir}/opt/lampp/mysql/scripts -type f -exec sed -i 's/\/opt\/lampp\/var\/mysql\/$HOSTNAME.pid/\/var\/lib\/mysql\/$HOSTNAME.pid/gI' {} \;
	#find ${pkgdir}/opt/lampp/ -type f -exec sed -i 's/\/opt\/lampp\/var\/mysql\/mysql.sock/\/run\/mysqld\/mysqld.sock/gI' {} \;

	# start from xampp manager
	find ${pkgdir}/opt/lampp/mysql/scripts -type f -exec sed -i 's/\/opt\/lampp\/lampp\ startmysql/systemctl\ start\ mysqld/gI' {} \;

	# Licenses
	install -dm755 "${pkgdir}/usr/share/licenses/xampp"
	rsync -avz "${pkgdir}/opt/lampp/licenses"/. "${pkgdir}/usr/share/licenses/xampp"

	# Executables
	install -dm755 "${pkgdir}/usr/bin"
	ln -sf '/opt/lampp/lampp' "${pkgdir}/usr/bin/xampp"
	ln -sf '/opt/lampp/lampp' "${pkgdir}/usr/bin/lampp"
	install -Dm755 "${srcdir}/xampp-manager-polkit" "${pkgdir}/usr/bin/xampp-manager_polkit"
	install -Dm755 "${srcdir}/xampp-control-panel" "${pkgdir}/usr/bin/xampp-control-panel"
	install -Dm755 "${srcdir}/properties.ini" "${pkgdir}/opt/lampp/properties.ini"

	# Systemd service
	install -dm755 "${pkgdir}/etc/systemd/system"
	cp "${srcdir}/lampp.service" "${pkgdir}/etc/systemd/system"

	# Desktop launcher
	install -Dm755 "${srcdir}/xampp-manager.png" "${pkgdir}/usr/share/pixmaps/xampp-manager.png"
	install -Dm755 "${srcdir}/xampp-manager.desktop" "${pkgdir}/usr/share/applications/xampp-manager.desktop"
	install -Dm755 "${srcdir}/xampp-control-panel.desktop" "${pkgdir}/usr/share/applications/xampp-control-panel.desktop"

	# Install policy file for desktop launcher
	install -Dm644 "${srcdir}/org.freedesktop.xampp-manager.policy" "${pkgdir}/usr/share/polkit-1/actions/org.freedesktop.xampp-manager.policy"
        
	msg 'Creating a temporary mysql user/group with fakeadd...'

	getent group mysql > /dev/null || fakeadd -G -n mysql -g "${_mysql_uuid}" || _fakeadd_error
	getent passwd mysql > /dev/null || fakeadd -U -n mysql -g "${_mysql_uuid}" -u "${_mysql_uuid}" -s /bin/false || _fakeadd_error

	# Remove unused folder
	rm -rf "${pkgdir}/xampp_core_files/"
	rm -rf "${pkgdir}/xampp_developer_files/"
	rm -rf "${pkgdir}/native_mysql_adapter/"
	rm -rf "${pkgdir}/native_apache_adapter/"
	rm -rf "${pkgdir}/native_proftpd_adapter/"
	rm -rf "${pkgdir}/manager/"
	rm -rf "${pkgdir}/common_native_adapter/"

	
}


