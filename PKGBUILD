# Contributor: fnord0 < fnord0 AT riseup DOT net >
# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

pkgname=mysqloit
pkgver=0.2
pkgrel=2
pkgdesc="SQL Injection takeover tool"
arch=('any')
url="https://github.com/dtrip/mysqloit"
license=('GPL2')
depends=('python2' 'metasploit')
source=("http://mysqloit.googlecode.com/files/${pkgname}v${pkgver}.tar")
sha1sums=('30c8f240f1ead6ad14e31b0d5700265882b1aed9')
options=(!emptydirs)

package() {
	mkdir -p ${pkgdir}/usr/{bin,share} || return 1
	mkdir ${pkgdir}/usr/share/${pkgname} || return 1
	cd ${srcdir}/${pkgname}v${pkgver}
	mv * ${pkgdir}/usr/share/${pkgname} || return 1
	# archlinux fixes
	cd ${pkgdir}/usr/share/${_svnmod}
	grep -rl python ${pkgdir}/usr/share/${pkgname}/ | xargs sed -i 's|python|python2|g' || return 1
	cd ${pkgdir}/usr/share/${pkgname}
	#check if metasploit-svn or metasploit stable is installed (metasploit-svn takes presidence)
	if [ -d /usr/src/metasploit ]; then
	  sed -i 's|/usr/local/metasploit|/usr/src/metasploit|g' conf.py || return 1
	else
	  sed -i 's|/usr/local/metasploit|/opt/metasploit|g' conf.py || return 1
	fi

	# create startup app
	echo "#!/bin/sh" > ${pkgdir}/usr/bin/mysqloit || return 1
	echo "cd /usr/share/mysqloit" >> ${pkgdir}/usr/bin/mysqloit || return 1
	echo "if test -z \"\$1\"" >> ${pkgdir}/usr/bin/mysqloit || return 1
	echo "then" >> ${pkgdir}/usr/bin/mysqloit || return 1
	echo "python2 ./mysqloit.py -h" >> ${pkgdir}/usr/bin/mysqloit || return 1
	echo "else" >> ${pkgdir}/usr/bin/mysqloit || return 1
	echo "python2 ./mysqloit.py \"\$@\"" >> ${pkgdir}/usr/bin/mysqloit || return 1
	echo "fi" >> ${pkgdir}/usr/bin/mysqloit || return 1
	echo "cd -" >> ${pkgdir}/usr/bin/mysqloit || return 1
	chmod +x ${pkgdir}/usr/bin/mysqloit || return 1

	# user notification
	echo -e ""
	echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mrun '\e[0m\e[1;34m/usr/bin/mysqloit -h\e[0m\e[1;31m' for an explanation of mysqloit startup options\e[0m"
	echo -e "\e[1;34m>>>\e[0m \e[1;31mmysqloit project homepage @ \e[0m\e[1;32mhttp://code.google.com/p/mysqloit\e[0m"
	echo -e ""
}
# vim:syntax=sh
