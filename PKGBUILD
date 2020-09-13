# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Julio González <juliolokoo at gmail dot com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
# Contributor: alegotta <algottardi at disroot dot org>
# Contributor: oguzkagan <me@oguzkaganeren.com.tr>

pkgname='xampp'
pkgver='7.4.10'
pkgrel=1
pkgdesc="A free and open source cross-platform web server package (LAMP Stack), consisting mainly of the Apache HTTP Server, MySQL database, and interpreters for scripts written in the PHP and Perl programming languages"
url="http://www.apachefriends.org/"
license=('GPL')
arch=('x86_64')
depends=('net-tools')
optdepends=('polkit: to run XAMPP Manager from menu')
makedepends=('sdx' 'tclkit' 'rsync')
source=('bitrock-unpacker.tcl'
	'xampp.service'
	'org.freedesktop.xampp-manager.policy'
	'xampp-control-panel'
	'xampp-control-panel.desktop'
	'xampp-manager.desktop'
	'xampp-manager.png'
	'xampp-manager-polkit')
source_x86_64=("https://www.apachefriends.org/xampp-files/${pkgver}/${pkgname}-linux-x64-${pkgver}-0-installer.run")
options=(!strip)
install='xampp.install'
sha256sums=('3f262ef4b3e752992667ab482cbf364e3b9e6f95b4b6fb12a1ce6fa7a88f124e'
            '78854cb427117c69117a8f20685acbe898a02bc3af1409950117986ff1b45f1f'
            '4092631d86ec1c3a155bfec76ea2c8433426a13f12a7a5866f843a099f1ca418'
            '35499d6ccf6f4429432b6a484ae21c6813a9d89ccb4b59463018f8b84477cb64'
            '731daee35514cce22b8d6b37224bfec08302d219a59b1b30acc3c6b1a799634a'
            '595de672753af57c4abf1b4549530bba02b004bd45dfa82054d58ea3a174a4e6'
            '3df1d2fa8a8dbba21944045503b94315e5b7bc38b968ca5a816a57b83c6fd77a'
            '210beb9372baf79f01b783db6d93a0f9a07289af64dd72d9e09baecd0799a76b')
sha256sums_x86_64=('dc216c55f99b04a9e1a458c7c881127fdbf30963710a32f6d5228a09c3cde722')

package() {

	cd "${srcdir}"

	msg 'Extracting package...'

	install -dm755 "${pkgdir}/opt/lampp"    
        ./bitrock-unpacker.tcl "${srcdir}/xampp-linux-x64-${pkgver}-0-installer.run" "${pkgdir}"

	msg 'Copying executables and launcher...'
	rsync -avz --remove-source-files "${pkgdir}/xampp_core_files/xampp_core_folder"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/xampp_developer_files/xampp_developer_folder"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/native_apache_adapter/apache_xampp_linux"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/native_proftpd_adapter/proftpd_xampp_linux"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/native_mysql_adapter/mysql_xampp_linux"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/manager/binary"/. "${pkgdir}/opt/lampp"
	rsync -avz --remove-source-files "${pkgdir}/common_native_adapter/common"/. "${pkgdir}/opt/lampp"

	# Access to phpmyadmin
	install -dm777 "${pkgdir}/opt/lampp/phpmyadmin/tmp"
	chmod 777 "${pkgdir}/opt/lampp/temp"

	# phpadmin mysql settings
	find "${pkgdir}/opt/lampp/phpmyadmin" -type f -exec sed -i 's/localhost/localhost:3306/gI' {} \;

	# Links
	install -dm755 "${pkgdir}/opt/lampp/share/lampp"
	ln -sf '/opt/lampp/xampp' "${pkgdir}/opt/lampp/lampp"
	ln -sf '/opt/lampp/share/xampp/' "${pkgdir}/opt/lampp/share/lampp/"

	# Set root location in all files
	msg 'Setting root location globally (it might take a few minutes)...'

	find "${pkgdir}/opt/lampp/" -type f \
		-exec sed -i 's/\@\@BITNAMI_XAMPP_ROOT\@\@/\/opt\/lampp/gI;s/\@\@BITROCK_INSTALLDIR\@\@/\/opt\/lampp/gI' {} \;

	# For using mariadb
	#find "${pkgdir}/opt/lampp/mysql/scripts" -type f -exec sed -i 's/\/opt\/lampp\/var\/mysql\/$HOSTNAME.pid/\/var\/lib\/mysql\/$HOSTNAME.pid/gI' {} \;
	#find "${pkgdir}/opt/lampp/" -type f -exec sed -i 's/\/opt\/lampp\/var\/mysql\/mysql.sock/\/run\/mysqld\/mysqld.sock/gI' {} \;

	# start from xampp manager
	#find "${pkgdir}/opt/lampp/mysql/scripts" -type f -exec sed -i 's/\/opt\/lampp\/lampp\ startmysql/systemctl\ start\ mysqld/gI' {} \;

	# Licenses
	install -dm755 "${pkgdir}/usr/share/licenses/xampp"
	rsync -avz "${pkgdir}/opt/lampp/licenses"/. "${pkgdir}/usr/share/licenses/xampp"

	# Executables
	install -dm755 "${pkgdir}/usr/bin"
	ln -sf '/opt/lampp/lampp' "${pkgdir}/usr/bin/xampp"
	#ln -sf '/opt/lampp/lampp' "${pkgdir}/usr/bin/lampp"
	install -Dm755 "${srcdir}/xampp-manager-polkit" "${pkgdir}/usr/bin/xampp-manager_polkit"
	install -Dm755 "${srcdir}/xampp-control-panel" "${pkgdir}/usr/bin/xampp-control-panel"

	# Systemd service
	install -dm755 "${pkgdir}/etc/systemd/system"
	install -Dm644 "${srcdir}/xampp.service" "${pkgdir}/etc/systemd/system/xampp.service"

	# Desktop launcher
	install -Dm644 "${srcdir}/xampp-manager.png" "${pkgdir}/usr/share/pixmaps/xampp-manager.png"
	install -Dm644 "${srcdir}/xampp-manager.desktop" "${pkgdir}/usr/share/applications/xampp-manager.desktop"
	install -Dm644 "${srcdir}/xampp-control-panel.desktop" "${pkgdir}/usr/share/applications/xampp-control-panel.desktop"

	# Install policy file for desktop launcher
	install -Dm644 "${srcdir}/org.freedesktop.xampp-manager.policy" "${pkgdir}/usr/share/polkit-1/actions/org.freedesktop.xampp-manager.policy"

	# Remove unused folders
	rm -rf	"${pkgdir}/xampp_core_files/"\
		"${pkgdir}/xampp_developer_files/" \
		"${pkgdir}/native_mysql_adapter/" \
		"${pkgdir}/native_apache_adapter/" \
		"${pkgdir}/native_proftpd_adapter/" \
		"${pkgdir}/manager/" \
		"${pkgdir}/common_native_adapter/"

	# Update backup list for the next time (currently unused method - requires `readarray backup < "./backup.lst"`)
	#(cd "${pkgdir}" && find -L 'opt/lampp/etc' -type f && find -L 'opt/lampp/var' -type f && find -L 'opt/lampp/htdocs' -type f) > "$(readlink 'backup.lst')"

}

