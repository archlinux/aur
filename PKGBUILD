# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
pkgname=eclipse-mylyn
pkgver=3.20.2
_reldate=20160630-1910
pkgrel=1
pkgdesc='A task-focused interface for Eclipse.'
arch=('any')
url='https://eclipse.org/mylyn/'
license=('EPL')
depends=('eclipse')
optdepends=('bugzilla: ticketing support')
source=("https://www.eclipse.org/downloads/download.php?file=/mylyn/drops/$pkgver/v$_reldate/mylyn-$pkgver.v$_reldate.zip&r=1")
sha512sums=('e20d523676dba886e8bfaeb415f5641fd321c75f5b0adbec3ab5f56c5c630d7415d9ff68db4879cd87f4cc67f9ceac506019704133a26c62ebcc327f0595ca21')

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
