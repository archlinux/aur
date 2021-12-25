# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

_skinname=Tweeki
_skinname_lowercase="${_skinname,,}"
_pkgname_base="mediawiki-skin-${_skinname_lowercase}"

pkgname="${_pkgname_base}-git"
pkgver=1.2.6.r2.g7aaf732
pkgrel=2
pkgdesc="MediaWiki skin based on Twitter's Bootstrap"
arch=('any')
url="https://www.mediawiki.org/wiki/Skin:${_skinname}"
license=('GPL2')
depends=('mediawiki')
makedepends=('git')
provides=("$_pkgname_base")
conflicts=("$_pkgname_base")
source=("git+https://github.com/thaider/Tweeki.git")
sha512sums=('SKIP')

prepare()
{
	cd "$_skinname"

	# Avoid escaping of the HTML displaying a pencil icon next to section
	# headings.
	# See also https://github.com/thaider/Tweeki/issues/154.
	sed -Ei 's/(^\s*\$text) = (\$icon .* \$text)\;/\1 = new HTMLArmor( \2 )\;/' \
		includes/Hooks.php
}

pkgver()
{
	cd "$_skinname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
	local skin_dir="/usr/share/webapps/mediawiki/skins/${_skinname}"

	install -d -m755 "${pkgdir}${skin_dir}"
	cd "${_skinname}"
	find . -mindepth 1 -maxdepth 1 -regextype posix-extended \
		\! -regex './\.git(|ignore|review)' \
		-exec cp -RP '{}' "${pkgdir}${skin_dir}/" \;
}
