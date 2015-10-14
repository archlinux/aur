# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
pkgname=eclipse-mylyn
pkgver=3.17.0
_reldate=20150909-1855
pkgrel=1
pkgdesc='A task-focused interface for Eclipse.'
arch=('any')
url='https://eclipse.org/mylyn/'
license=('EPL')
depends=('eclipse')
optdepends=('bugzilla: ticketing support')
source=("https://www.eclipse.org/downloads/download.php?file=/mylyn/drops/$pkgver/v$_reldate/mylyn-$pkgver.v$_reldate.zip&r=1")
sha512sums=('aa6289046df4c254567010b30706cc9cb0a1355e9634adcb2052127030d2640f399caf20fce10e8b4fab5885da29057ab9117af42472bcc1645dcf9881f84236')

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
