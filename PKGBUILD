# Maintainer: Enova <enova@waifu.club>

_pkgname="saradomin-launcher"
pkgname="${_pkgname}-git"
pkgver=r117.a84c3a1
pkgrel=1
pkgdesc="A clean, modern launcher with all the bells and whistles written in C# and DotNet6 for 2009Scape."
arch=(x86_64)
url="https://gitlab.com/2009scape/Saradomin-Launcher"
license=('GPL3')
# TODO
depends=()
makedepends=(
	'git'
	'dotnet-sdk>=6')
source=(
	"${_pkgname}::git+https://gitlab.com/2009scape/Saradomin-Launcher.git"
	"Saradomin.desktop")
conflicts=("${_pkgname}")
provides=("saradomin-launcher=${pkgver}")
sha256sums=('SKIP'
            'a8ae565774939d1c2a48c2d4b69a150d23015fd3f09a69663dc410d5a9802957')
options=(!strip)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive
}

build() {
	mkdir "${srcdir}/build"
	cd "${srcdir}/${_pkgname}"
	dotnet restore
	cd Saradomin
	#--no-self-contained
	dotnet publish --runtime linux-x64 --sc -o "${srcdir}/build" -c Release /p:DebugType=None /p:DebugSymbols=false -p:PublishTrimmed=false -p:PublishReadyToRun=true -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/${_pkgname}/"
    install -D -m644 "${srcdir}/Saradomin.desktop" "${pkgdir}/usr/share/applications/Saradomin.desktop"
    install -D -m644 "${srcdir}/${_pkgname}/Saradomin/Resources/Icons/saradomin.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    cp -r "${srcdir}/build/." "${pkgdir}/opt/${_pkgname}/"
    ln -s ../../opt/${_pkgname}/Saradomin "${pkgdir}/usr/bin/Saradomin"
}
