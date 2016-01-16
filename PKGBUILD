# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
pkgname=eclipse-mylyn
pkgver=3.18.0
_reldate=20151215-0126
pkgrel=1
pkgdesc='A task-focused interface for Eclipse.'
arch=('any')
url='https://eclipse.org/mylyn/'
license=('EPL')
depends=('eclipse')
optdepends=('bugzilla: ticketing support')
source=("https://www.eclipse.org/downloads/download.php?file=/mylyn/drops/$pkgver/v$_reldate/mylyn-$pkgver.v$_reldate.zip&r=1")
sha512sums=('e1cecffc6041c9ec1b7bfc6b08545ab354ee7d7d51ad1cbec95c851134dd909e65ecc3f771bdc77d1ecd7f4da11bcaec0bcebbc92149ab4349480ec0f332b00f')

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
