# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: Alex Ferrando <alferpal@gmail.com>
# Contributor: Archan Paul <arp@archan.org>
pkgname=eclipse-egit
pkgver=4.1.0.201509280440_r
pkgrel=1
pkgdesc='An Eclipse Team provider for the Git version control system.'
arch=('any')
url='https://www.eclipse.org/egit/'
license=('EPL')
depends=('eclipse' 'eclipse-mylyn')
source=("https://www.eclipse.org/downloads/download.php?file=/egit/updates/org.eclipse.egit.repository-$(echo $pkgver | sed s/_/-/).zip&r=1")
sha512sums=('0bf0c56570ccdbb0f115c793f10cd3530d8698319663242b46ae9d4105ffc93710f0eec59d9a2eb1836f7dfe199eb8532aec5fa5c579133542261523fa6b966b')

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
