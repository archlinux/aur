# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=opengrok
pkgver=0.12.1
pkgrel=3
pkgdesc="A wicked fast source browser."
url="http://opengrok.github.io/OpenGrok/"
arch=('i686' 'x86_64')
license=('CDDL')
# Requirements: ... like GlassFish or Tomcat (6.x, 7.x or later) ... 
depends=('tomcat8' 'ctags' 'sh' 'unzip')
makedepends=('sed')
source=(
    "https://java.net/projects/opengrok/downloads/download/opengrok-0.12.1.tar.gz"
    'deploy.sh')
sha1sums=(
    '96a6a5d1888b802cdba15915b283db84439b83fd'
    '118514d7474006c9b98151403d3d7952b8a9cea6')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	# OpenGrok script in /usr/bin
	mkdir -p "${pkgdir}/usr/bin" || return 1
	ln -s /opt/opengrok/bin/OpenGrok "${pkgdir}/usr/bin/OpenGrok"
	
	# copy everything
	mkdir -p "${pkgdir}/opt/opengrok" || return 1
	cp -R * "${pkgdir}/opt/opengrok" || return 1
	msg "Patching OpenGrok binary for Arch Linux..."
	# on Arch,
	# - ctags command is ctags
	# - Tomcat is installed into /opt/tomcat
	# - need to pretend that the script is in /opt/opengrok
	sed \
		-e 's#SCRIPT_DIRECTORY=.*dirname.*#SCRIPT_DIRECTORY="/opt/opengrok/bin"#' \
		-e '/Linux/s:commandName="ctags-exuberant":commandName="ctags":' \
		-e '/DetermineWarDirectoryTomcat[(]/,/^[ \t]*}[ \t]*$/s#.*OPENGROK_TOMCAT_BASE.*#\t/opt/tomcat \\\n&#' \
		-i "${pkgdir}/opt/opengrok/bin/OpenGrok"
	
	install -m0755 "${srcdir}/deploy.sh" "${pkgdir}/opt/opengrok/bin/tomcat-deploy-helper"
}

