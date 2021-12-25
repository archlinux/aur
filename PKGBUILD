# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

_extname=MagicNoCache
_extname_lowercase="${_extname,,}"
_pkgname_base="mediawiki-extension-${_extname_lowercase}"

_mediawiki_mainver=1.37
_mediawiki_mainver_succ=${_mediawiki_mainver%.*}.$((${_mediawiki_mainver##*.}+1))
_branch="REL${_mediawiki_mainver/./_}"

pkgname="${_pkgname_base}-git"
pkgver=1.4.0.r45.g07a1b94
pkgrel=3
pkgdesc="MediaWiki extension for selective cache disabling"
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
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
