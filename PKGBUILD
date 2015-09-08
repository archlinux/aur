# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=opengrok
pkgver=0.12.1
pkgrel=2
pkgdesc="A wicked fast source browser."
url="http://opengrok.github.io/OpenGrok/"
arch=('i686' 'x86_64')
license=('CDDL')
# Requirements: ... like GlassFish or Tomcat (6.x, 7.x or later) ... 
depends=('tomcat8' 'ctags' 'sh')
makedepends=('sed')
source=(
    "https://github.com/OpenGrok/OpenGrok/archive/${pkgver}.tar.gz"
    'deploy.sh')
sha1sums=(
    '68a959ba5c5c23188e02f14ff023265111c86b36'
    '69f98ff5aced0b06b8d2c4fb6cd48c9e82aaaea3')

package() {
	cd "${srcdir}/OpenGrok-${pkgver}"
	
	# OpenGrok script in /usr/bin
	mkdir -p "${pkgdir}/usr/bin" || return 1
	ln -s /opt/opengrok/OpenGrok "${pkgdir}/usr/bin/OpenGrok"
	
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
		-i "${pkgdir}/opt/opengrok/OpenGrok"
	
	install -m0755 "${srcdir}/deploy.sh" "${pkgdir}/opt/opengrok/tomcat-deploy-helper"
}

