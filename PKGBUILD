# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>
# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>

pkgname=ferdi-nightly-bin
pkgver=5.6.3.nightly.16
pkgrel=1
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application - nightly binary version'
url='https://getferdi.com'
license=('Apache')
arch=('x86_64')
makedepends=('curl' 'jq')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libnghttp2' 'libxkbfile' 'libxslt' 'minizip' 'nss' 're2' 'snappy')
provides=('ferdi')
conflicts=('ferdi' 'ferdi-bin')
source=(git+https://github.com/getferdi/nightlies.git)
sha512sums=('SKIP')
_github_api_uri=https://api.github.com/repos/getferdi/ferdi/releases

pkgver() {
  newest_nightly_version=$(curl --silent ${_github_api_uri} | jq -r '.[0].tag_name[1:]')
  printf ${newest_nightly_version/-/.}'\n'
}

prepare() {
  cd "${srcdir}"

  newest_nightly_download_url=$(curl --silent ${_github_api_uri} | jq -r '.[0].assets[] | select(.name | contains("rpm")).browser_download_url')
  curl ${newest_nightly_download_url} -L --output ferdi.rpm
}

package() {
  cd "${pkgdir}"

  bsdtar -xf ${srcdir}/ferdi.rpm

  mkdir -p usr/local/bin
  ln -sf /opt/Ferdi/ferdi usr/local/bin/ferdi
}
