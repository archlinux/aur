# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

_extname=Lockdown
_extname_lowercase="${_extname,,}"
_pkgname_base="mediawiki-extension-${_extname_lowercase}"

_mediawiki_mainver=1.37
_mediawiki_mainver_succ=${_mediawiki_mainver%.*}.$((${_mediawiki_mainver##*.}+1))
_branch="REL${_mediawiki_mainver/./_}"

pkgname="${_pkgname_base}-git"
epoch=1
pkgver=r180.5d8ea76
pkgrel=3
pkgdesc="MediaWiki extension implementing per-namespace group permissions"
arch=('any')
url="https://www.mediawiki.org/wiki/Extension:${_extname}"
license=('GPL')
depends=("mediawiki>=${_mediawiki_mainver}"
         "mediawiki<${_mediawiki_mainver_succ}")
makedepends=('git')
provides=("$_pkgname_base")
conflicts=("$_pkgname_base")
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/${_extname}#branch=${_branch}")
sha512sums=('SKIP')

pkgver()
{
	cd "${_extname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
