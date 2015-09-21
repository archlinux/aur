# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: Alex Ferrando <alferpal@gmail.com>
# Contributor: Archan Paul <arp@archan.org>
pkgname=eclipse-egit
pkgver=4.0.2.201509141540_r
pkgrel=1
pkgdesc='An Eclipse Team provider for the Git version control system.'
arch=('any')
url='https://www.eclipse.org/egit/'
license=('EPL')
depends=('eclipse' 'eclipse-mylyn')
source=("https://www.eclipse.org/downloads/download.php?file=/egit/updates/org.eclipse.egit.repository-$(echo $pkgver | sed s/_/-/).zip&r=1")
sha512sums=('f757528aad0841506ec0c2f31865437137407402a6922d8b27e888092080a4cde2a8e70c9d1bdf3f7209ee028a979fc87fefaf973794288ff01799c72584d2a2')

prepare()
{
	# remove features and plug-ins containing sources
	rm features/*.source_*
	rm plugins/*.source_*
	# remove gz files
	rm plugins/*.pack.gz
}

package()
{
	_dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse

	# Features
	find features -type f | while read _feature ; do
		if [[ ${_feature} =~ (.*\.jar$) ]] ; then
			install -dm755 ${_dest}/${_feature%*.jar}
			cd ${_dest}/${_feature/.jar}
			# extract features (otherwise they are not visible in about dialog)
			jar xf ${srcdir}/${_feature} || return 1
		else
			install -Dm644 ${_feature} ${_dest}/${_feature}
		fi
	done

	# Plugins
	find plugins -type f | while read _plugin ; do
		install -Dm644 "${_plugin}" "${_dest}/${_plugin}"
	done
}
