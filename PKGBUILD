# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
pkgname=eclipse-mylyn
pkgver=3.19.0
_reldate=20160331-2042
pkgrel=1
pkgdesc='A task-focused interface for Eclipse.'
arch=('any')
url='https://eclipse.org/mylyn/'
license=('EPL')
depends=('eclipse')
optdepends=('bugzilla: ticketing support')
source=("https://www.eclipse.org/downloads/download.php?file=/mylyn/drops/$pkgver/v$_reldate/mylyn-$pkgver.v$_reldate.zip&r=1")
sha512sums=('d96335045a221e96bb6598051381464fdbf004f8f83433c3954d6df5d2d9818b65562444c8c6b9328ea1b425c30551720a00371b208b4f1b7b1487dd053c0bd8')

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
