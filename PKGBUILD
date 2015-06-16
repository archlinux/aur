# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: Alex Ferrando <alferpal@gmail.com>
# Contributor: Archan Paul <arp@archan.org>
pkgname=eclipse-egit
pkgver=3.7.1.201504261725_r
pkgrel=1
pkgdesc='An Eclipse Team provider for the Git version control system.'
arch=('any')
url='https://www.eclipse.org/egit/'
license=('EPL')
depends=('eclipse' 'eclipse-mylyn')
source=("https://www.eclipse.org/downloads/download.php?file=/egit/updates/org.eclipse.egit.repository-$(echo $pkgver | sed s/_/-/).zip&r=1")
sha512sums=('fafd12ad76c23596f93f32177b017f2c752137660e9d4f1048bc09e9de5b6ff6b8b5cf51ef6d21994c5997f2ecc5bb4c7dc0b9427c33cca56809735effda242f')

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
	_dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

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
