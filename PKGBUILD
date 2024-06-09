# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

_pkgname="fluxis"
pkgname="${_pkgname}-git"
pkgver=r1187.1089b1f8
pkgrel=1
pkgdesc="A community-driven rhythm game with a focus on creativity and expression."
arch=('x86_64')
url="https://github.com/TeamFluXis/fluXis"
license=('MIT')
makedepends=('git' 'dotnet-sdk>=8.0.0' 'dotnet-targeting-pack>=8.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("fluxis::git+${url}"
	"fluxis.sh"
	"fluxis.desktop")
md5sums=('SKIP'
         '42990e57e951a134434355f40c3685e5'
         'bbe3b5fa650730f72e2ab79a6d9ea7be')
options=('!strip')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${_pkgname}"
  DOTNET_CLI_TELEMETRY_OPTOUT="1" dotnet publish -r linux-x64 --no-self-contained -c Release --output output fluXis.Desktop
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "$pkgdir/opt/fluxis"
  cp -r output/* "$pkgdir/opt/fluxis"
  install -Dm755 "$srcdir/fluxis.sh" "$pkgdir/usr/bin/fluxis"
  install -Dm644 "$srcdir/fluxis.desktop" "$pkgdir/usr/share/applications/fluxis.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/fluxis-git/LICENSE"
}
