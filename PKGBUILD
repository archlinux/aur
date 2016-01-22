# Contributor: MatToufoutu <mattoufootu[at]gmail.com>
# Maintainer: Thorsten Töpper <atsutane-aur@freethoughts.de>
# Moved to AUR4: GI_Jack <iamjacksemail@hackermail.com>

pkgname=armitage-svn
pkgver=841
pkgrel=1
pkgdesc="A graphical cyber attack management tool for Metasploit"
url="http://www.fastandeasyhacking.com/"
arch=('any')
license=('GPL')
depends=('metasploit' 'java-environment')
makedepends=('apache-ant' 'zip' 'unzip' 'subversion')
provides=('armitage')
install='armitage.install'

source=('armitage.install' 'armitage.desktop' 'metasploit.png')
sha256sums=('f9b6e484754d52eae999dbc72982ca4729ef40b76097898f2b4fbec24c2a4259'
            '02c829495ebfb171146e2b02f1c2470f814c41b6c80f0649f59ac62609d18689'
            '7d25e47bbd5cd710020c30fb645229a774672c7bcb451a0cf2fd6ba327d8b141')

_svntrunk=http://armitage.googlecode.com/svn/trunk/
_svnmod=armitage

build() {
	cd ${srcdir}
	if [ -d ${_svnmod}/.svn ]; then
		svn up ${_svnmod}
	else
		svn co ${_svntrunk} ${_svnmod}
	fi

	rm -rf ${_svnmod}-build
	cp -r ${_svnmod} ${_svnmod}-build
	cd ${_svnmod}-build

	sed -i s+/usr/share/java/apache-ant/bin/++g package.sh
	bash package.sh
	echo "#!/bin/bash" > ${_svnmod}.sh
	echo "java -jar /opt/${_svnmod}/${_svnmod}.jar" >> ${_svnmod}.sh
}

package() {
	mkdir -p ${pkgdir}/{opt/${_svnmod},usr/bin}
	tar -C ${pkgdir}/opt/ -xzf ${srcdir}/${_svnmod}-build/${_svnmod}.tgz
	install -m755 ${srcdir}/${_svnmod}-build/${_svnmod}.sh ${pkgdir}/usr/bin/${_svnmod}
  install -Dm644 ${srcdir}/armitage.desktop ${pkgdir}/usr/share/applications/armigate.desktop
  install -Dm644 ${srcdir}/metasploit.png ${pkgdir}/usr/share/icons/metasploit.png
}

# vim:set ts=2 sw=2 et:

