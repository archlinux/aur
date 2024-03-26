# Maintainer: Vladislav Babenko <vlad1.96@mail.ru>

pkgname="yd-go-git"
_pkgname=${pkgname%-git}
pkgrel=2
pkgver="master.5af17d8.r0.g5af17d8"
pkgdesc="Panel indicator for Yandex-disk CLI daemon (linux)"
arch=('x86_64')
url="https://github.com/slytomcat/${_pkgname}/"
license=('GPL-3.0 license')
depends=('yandex-disk')
makedepends=('go' 'git' 'gendesk')
conflicts=('yd-go' 'yd-go-bin' 'yd-go-git-bin' 'yd-go-bin-git')
source=("git+https://github.com/slytomcat/yd-go.git")
sha256sums=('SKIP')

options=(!debug)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  echo "Creating desktop file..."
  gendesk -f -n --pkgname ${_pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories="Network; FileTools; Monitor" \
    --icon "${pkgdir}/usr/share/pixmaps/${_pkgname}.png" \
    --exec "${pkgdir}/usr/bin/${_pkgname}"
	# Should i use "applet" type in categories?
	# If I have to, then don't forget about the OnlyShowIn=
	# Categories spec. https://specifications.freedesktop.org/menu-spec/menu-spec-1.1.html#category-registry
}

build() {
	echo "Build yd-go..."
		mkdir -p "${srcdir}/${_pkgname}/build"
		cd "${srcdir}/${_pkgname}"
		export CGO_LDFLAGS="${LDFLAGS}"
		export CGO_CFLAGS="${CFLAGS}"
		export CGO_CPPFLAGS="${CPPFLAGS}"
		export CGO_CXXFLAGS="${CXXFLAGS}"
		export CGO_ENABLED=0 
		go build \
			-buildvcs=false \
			-trimpath \
			-ldflags "-s -w -X main.version=v.${pkgver}" \
			-o build .
	
	#UPX not working with PKGBUILD https://bbs.archlinux.org/viewtopic.php?id=235637
	#echo "Compress yd-go..."
		#upx --best ${srcdir}/${_pkgname}/build/${_pkgname}
}

#Test yd-go
#check() {
	#echo "Test yd-go..."
	#cd "${srcdir}/${_pkgname}"
	#go test ./...
#}

package() {
    echo "Install yd-go..."
	install -Dm755 "${srcdir}/${_pkgname}/build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/${_pkgname}/icons/img/yd128.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	#TODO: add autostart in $XDG_CONFIG_DIRS/autostart
}
