# Maintainer: Emre Cetin <aur@ecetin.dev>

_pkgname="galaxybudsclient"
pkgname="${_pkgname}-git"
pkgver=r1271.41befe8
pkgrel=1
pkgdesc="Unofficial manager for the Samsung Galaxy Buds, Buds+, Buds Live and Buds Pro. Master branch."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ThePBone/GalaxyBudsClient"
license=('GPL-3.0-only')
depends=('gcc-libs' 'zlib' 'bluez')
makedepends=('git' 'dotnet-sdk>=8.0')
provides=("${pkgname}")
conflicts=("${_pkgname}-bin")
options=('!strip')
source=(
  "${pkgname}::git+https://github.com/ThePBone/GalaxyBudsClient.git"
  "galaxybudsclient.desktop"
)
noextract=()
sha256sums=(
  'SKIP'
  '88677692ff1d7202b9f7aedbb5ec6cc01684041b94220a8da8feb69d9a028f70'
)

pkgver() {
	cd "$srcdir/${pkgname}"

  # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}"
  
  # Detect architecture
  if [ $CARCH == "x86_64" ]; then
    DOTNETARCH="linux-x64"
  elif [ $CARCH == "armv7h" ]; then
    DOTNETARCH="linux-arm"
  elif [ $CARCH == "aarch64" ]; then
    DOTNETARCH="linux-arm64"
  fi

  # Restore dependencies
  dotnet restore -r $DOTNETARCH --configfile GalaxyBudsClient/nuget.config GalaxyBudsClient/GalaxyBudsClient.csproj
}

build() {
	cd "$srcdir/${pkgname}"
  
  # Build
  dotnet publish -r $DOTNETARCH -o bin -c Release -p:PublishTrimmed=true -p:PublishSingleFile=true --self-contained true --no-restore GalaxyBudsClient/GalaxyBudsClient.csproj

  # Set exectuable bit
  cd bin
  chmod +x GalaxyBudsClient
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}/GalaxyBudsClient/Resources/icon_white.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm755 "$srcdir/${pkgname}/bin/GalaxyBudsClient" "${pkgdir}/usr/bin/${_pkgname}"
}
