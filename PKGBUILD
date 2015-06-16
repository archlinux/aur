# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
pkgname=eclipse-mylyn
pkgver=3.15.0
_reldate=20150331-1812
pkgrel=1
pkgdesc='A task-focused interface for Eclipse.'
arch=('any')
url='https://eclipse.org/mylyn/'
license=('EPL')
depends=('eclipse')
optdepends=('bugzilla: ticketing support')
source=("https://www.eclipse.org/downloads/download.php?file=/mylyn/drops/$pkgver/v$_reldate/mylyn-$pkgver.v$_reldate.zip&r=1")
sha512sums=('7a0265340f8ca9daaf1e31d8eef155cde9f4424153661f84f39d28cee1af08ef479eeb7b7b1af928299769f17522e0129c818ce3594d07d959dc008b0270c408')

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
