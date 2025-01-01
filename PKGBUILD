# Maintainer: Rubin Simons <me@rubin55.org>

# Note: change to main when .net9 work merges
_branch=artempyanykh/stack/8
_pkgname=marksman
pkgname=${_pkgname}-git
pkgver=r477.92d3db3
pkgrel=1
pkgdesc="Write Markdown with code assist and intelligence in the comfort of your favourite editor."
arch=('any')
url="https://github.com/artempyanykh/${_pkgname}"
license=('GPL')
makedepends=('dotnet-sdk' 'git')
depends=('dotnet-runtime')
options=('!strip')
source=("${pkgname}::git+${url}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  # Disable dotnet telemetry
  export DOTNET_CLI_TELEMETRY_OPTOUT=1

  dotnet build --configuration Release Marksman.sln
  dotnet publish --configuration Release Marksman.sln --output "$PWD"/publish
}

package() {
  mkdir -p "$pkgdir"/usr/lib
  mkdir -p "$pkgdir"/usr/bin
  cp -dr --no-preserve='ownership' ${pkgname}/publish "$pkgdir"/usr/lib/marksman

  ln -s /usr/lib/marksman/marksman "$pkgdir"/usr/bin/marksman
}
