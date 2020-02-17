# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

_extname=VisualEditor
_extname_lowercase="${_extname,,}"
_pkgname_base="mediawiki-extension-${_extname_lowercase}"

_mediawiki_mainver=1.34
_mediawiki_mainver_succ=${_mediawiki_mainver%.*}.$((${_mediawiki_mainver##*.}+1))
_branch="REL${_mediawiki_mainver/./_}"

_submodule_name=VisualEditor_submodule
_submodule_path=lib/ve

pkgname="${_pkgname_base}-git"
pkgver=r16039.74116a7219
pkgrel=1
pkgdesc="MediaWiki extension for rich text editing"
arch=('any')
url="https://www.mediawiki.org/wiki/Extension:${_extname}"
license=('MIT')
depends=("mediawiki>=${_mediawiki_mainver}"
         "mediawiki<${_mediawiki_mainver_succ}"
         'parsoid')
makedepends=('git')
provides=("$_pkgname_base")
conflicts=("$_pkgname_base")
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/${_extname}#branch=${_branch}"
        "${_submodule_name}::git+https://gerrit.wikimedia.org/r/VisualEditor/VisualEditor.git")
sha512sums=('SKIP' 'SKIP')

pkgver()
{
	cd "${_extname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_extname}"
  git submodule init
  git config "submodule.${_submodule_path}.url" "${srcdir}/${_submodule_name}"
  git submodule update
}

package()
{
	local ext_dir="/usr/share/webapps/mediawiki/extensions/${_extname}"

	install -d -m755 "${pkgdir}${ext_dir}"
	cp -a "$_extname"/* "${pkgdir}${ext_dir}/"

	install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "${ext_dir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -s "${ext_dir}/${_submodule_path}/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_SUBMODULE.txt"
}
