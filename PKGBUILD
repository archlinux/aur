# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor:  jyantis <yantis@yantis.net>

_pkgname=powerlevel9k
pkgname=zsh-theme-${_pkgname}-git
pkgver=v0.3.1.r10.g2630526
pkgrel=2
pkgdesc='Powerlevel9k theme for zsh'
arch=('any')
url='https://github.com/bhilburn/powerlevel9k'
license=('custom')
depends=('zsh')
optdepends=('oh-my-zsh-git: oh-my-zsh integration'
	'prezto-git: Prezto integration'
	'antigen-git: Antigen integration'
	'zpm: ZPM integration'
	'zsh-zim-git: Zim integration')
source=("${_pkgname}::git+https://github.com/bhilburn/${_pkgname}.git")
sha256sums=('SKIP')
makedepends=('git')
provides=("zsh-theme-${_pkgname}")
conflicts=("zsh-theme-${_pkgname}")
install="zsh-theme-${_pkgname}.install"

pkgver()
{
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
	cd "${srcdir}/${_pkgname}"

	# No license
	# Install Readme as License in case in the future some type of license is added
	install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Install Documentation
	install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Install the theme
	install -D -m644 powerlevel9k.zsh-theme "${pkgdir}/usr/share/zsh-theme-${_pkgname}/${_pkgname}.zsh-theme"

	# Install the utilities
	for FILE in functions/*.zsh; do
		install -D -m644 "${FILE}" "${pkgdir}/usr/share/zsh-theme-${_pkgname}/functions/$(basename ${FILE})"
	done
}
