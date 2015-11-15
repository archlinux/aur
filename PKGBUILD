# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: Alex Ferrando <alferpal@gmail.com>
# Contributor: Archan Paul <arp@archan.org>
pkgname=eclipse-egit
pkgver=4.1.1.201511131810_r
pkgrel=1
pkgdesc='An Eclipse Team provider for the Git version control system.'
arch=('any')
url='https://www.eclipse.org/egit/'
license=('EPL')
depends=('eclipse' 'eclipse-mylyn')
source=("https://www.eclipse.org/downloads/download.php?file=/egit/updates/org.eclipse.egit.repository-${pkgver//_/-}.zip&r=1")
sha512sums=('767aa324c8578c996490f09f110f9b95eda187da5d807b0be101f485a18079b80e1f59b1780a31ea99abbe51ef979a8bccbd223eebf77761dd013ef6cdf791c2')

prepare()
{
	# remove features and plug-ins containing sources
	rm -f features/*.source_*
	rm -f plugins/*.source_*
	# remove gz files
	rm -f plugins/*.pack.gz
}

package()
{
	_dest="${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse"

	# Features
	find features -type f | while read -r _feature ; do
		if [[ "${_feature}" =~ (.*\.jar$) ]] ; then
			install -dm755 "${_dest}/${_feature%*.jar}"
			cd "${_dest}/${_feature/.jar}"
			# extract features (otherwise they are not visible in about dialog)
			jar xf "${srcdir}/${_feature}" || return 1
		else
			install -Dm644 "${_feature}" "${_dest}/${_feature}"
		fi
	done

	# Plugins
	find plugins -type f | while read -r _plugin ; do
		install -Dm644 "${_plugin}" "${_dest}/${_plugin}"
	done
}
