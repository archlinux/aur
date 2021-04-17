# Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname="reggie"
pkgname="${_pkgname}-git"
pkgver=1.0.0
pkgrel=1
pkgdesc="A new regex replace CLI tool, as an alternative to sed."
arch=('x86_64')
url="https://github.com/cainy-a/reggie"
license=('GPL3')
groups=()
depends=('dotnet-runtime>=5.0.0' 'dotnet-host>=5.0.0')
makedepends=('git' 'dotnet-sdk>=5.0.0' 'dotnet-targeting-pack>=5.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("usr/share/${_pkgname}/data")
source=("${_pkgname}-source::git+${url}#commit=324e7ce3b0be69b8e9a3992fb3b7214d2e79eaf4")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "${_pkgname}-source"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}-source"

	# make a launch script
	tee 'launch.sh' << END
#!/bin/sh
cd /usr/lib/${_pkgname}
exec ./Reggie
END
}

build() {
	cd "${_pkgname}-source"

	# build with dotnet
	cd Reggie
	dotnet build
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {
	cd "${_pkgname}-source"
	
	# copy build folder
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}/"
	cp -r --preserve=mode "Reggie/bin/Debug/net5.0/"* "${pkgdir}/usr/lib/${_pkgname}/"
	# install launch script
	install -Dm 755 "launch.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
