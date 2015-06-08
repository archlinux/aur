# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Bruenig <Matthew (dot) Bruenig (at) Gmail (dot) com>

_appname_=packer
pkgname=${_appname_}-color
pkgver=20130730
pkgrel=1
pkgdesc="Adds AUR support to 'pacman' | Adds better colourisation and error handling to 'packer'"
url="http://github.com/keenerd/packer"
license="GPL3"
arch=("any")
makedepends=("git")
depends=("grep" "sed" "bash" "curl" "pacman" "jshon")
optdepends=("sudo: install and update packages as non-root"
            "customizepkg: apply customizepkg modifications"
            "zsh-packer-color: for Zsh tab completion")
install="${pkgname}.install"
source=(${pkgname}.patch)

_gitroot="http://github.com/keenerd/${_appname_}.git"
_gitname="${_appname_}"

build() {
	cd "${srcdir}"

	# Repository
	msg "Connecting to GIT server ..."
	if [ -d "${srcdir}/${_gitname}" ] ; then
		cd ${_gitname} && git pull origin
	else
		git clone "${_gitroot}"
		cd ${_gitname}
	fi
	
	# Patches
	patch -Np1 < "${startdir}"/${pkgname}.patch

	# Changes
	sed -i 's|packer |packer-color |g' ${_appname_}
	sed -i "s|echo \"packer: Option .* is not valid.\"|pacman \"\$\@\"|g" ${_appname_}
}

package() {
	cd ${_gitname}

	# Install
	install -D -m755 ${_appname_} "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 ${_appname_}.8 "${pkgdir}/usr/share/man/man8/${pkgname}.8"
}

sha1sums=('9ca7967f2c6abfc1664959d227f9d9375b76d47b')
