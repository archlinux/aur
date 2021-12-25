# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

_extname=LDAPProvider
_extname_lowercase="${_extname,,}"
_pkgname_base="mediawiki-extension-${_extname_lowercase}"

pkgname="${_pkgname_base}-git"
pkgver=r208.8fa6a15
pkgrel=2
pkgdesc="MediaWiki extension to provide an LDAP infrastructure"
arch=('any')
url="https://www.mediawiki.org/wiki/Extension:${_extname}"
license=('GPL')
depends=('mediawiki')
makedepends=('git')
provides=("$_pkgname_base")
conflicts=("$_pkgname_base")
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/${_extname}")
sha512sums=('SKIP')

pkgver()
{
	cd "${_extname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
	cd "${_extname}"
	sed -Ei 's|/etc/mediawiki|/etc/webapps/mediawiki|g' extension.json
	sed -Ei 's|/etc/mediawiki|/etc/webapps/mediawiki|g' README.mediawiki
}

package()
{
	local ext_dir="/usr/share/webapps/mediawiki/extensions/${_extname}"

	install -d -m755 "${pkgdir}${ext_dir}"
	cd "${_extname}"
	find . -mindepth 1 -maxdepth 1 -regextype posix-extended \
		\! -regex './\.git(|ignore|review)' \
		-exec cp -RP '{}' "${pkgdir}${ext_dir}/" \;
}
