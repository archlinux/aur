# Mantainer: grufo <madmurphy333 at gmail.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Julio González <juliolokoo at gmail dot com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

pkgname=xampp
pkgver=7.1.1
pkgrel=1
pkgdesc="A free and open source cross-platform web server package (LAMP Stack), consisting mainly of the Apache HTTP Server, MySQL database, and interpreters for scripts written in the PHP and Perl programming languages"
url="http://www.apachefriends.org/"
license=('GPL')
arch=('x86_64')
depends=('net-tools')
optdepends=('polkit: to run XAMPP Manager from menu')
source=('lampp.service'
	'xampp-manager.desktop'
	'xampp-manager.png')

# Due to problems with proot the file
# "https://sourceforge.net/projects/xampp-linux/files/${pkgname}-linux-x64-${pkgver}-0.tar.xz"
# is a re-packed version of
# "https://www.apachefriends.org/xampp-files/${pkgver}/${pkgname}-linux-x64-${pkgver}-0-installer.run"

source_x86_64=("https://sourceforge.net/projects/xampp-linux/files/${pkgname}-linux-x64-${pkgver}-0.tar.xz"
	'org.freedesktop.xampp-manager.policy'
	'xampp-manager-polkit')
options=(!strip)
install='xampp.install'
md5sums=('db1881f9564f18ed34d877035c28a4b8'
         'cbf909c2c3ad89470463eed2ce003f97'
         'f214711d95b8135f16974e36128f3a68')
md5sums_x86_64=('a9ba3b9cc901065885bcd3a871a6a5a9'
                'ba7853fd8b3125b0a783753ca5e23447'
                '9d246102ea20f27a13d119e57741ce7d')

package() {

	install -dm755 "${pkgdir}/opt/lampp"
	cp -r "${srcdir}/lampp"/* "${pkgdir}/opt/lampp"

	# Licenses
	install -dm755 "${pkgdir}/usr/share/licenses/xampp"
	cp "${pkgdir}/opt/lampp/licenses"/* "${pkgdir}/usr/share/licenses/xampp"

	# /usr/bin executables
	install -dm755 "${pkgdir}"/usr/bin
	ln -sf /opt/lampp/lampp "${pkgdir}/usr/bin/xampp"
	ln -sf /opt/lampp/lampp "${pkgdir}/usr/bin/lampp"
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
