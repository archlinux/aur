# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: François M. <francois5537 @ gmail.com>

## Dynamically retrieve the download url
_manager_source=$(wget -o /dev/null http://www.manager.io/desktop/download/ubuntu/ -O - \
    | grep -o -P 'https://.*Manager\.deb' | tail -n1
)
pkgname=manager-accounting
pkgver=$(echo "${_manager_source}" \
    | grep -o -P '[0-9]+\.[0-9]+\.[0-9]+'
)
pkgrel=1
pkgdesc='Manager is free accounting software for small business'
arch=('i686' 'x86_64')
license=('custom')
url="http://www.manager.io/"
depends=('mono' 'gtk-sharp-3')
makedepends=('wget')
install=manager-accounting.install
options=('!makeflags')
source=(
  "LICENSE"
  "${_manager_source}"
)
sha256sums=(
  'bd144763506372341487683b0f28ad627e7e8923ea8ef8569541b55f4b987061'
  'SKIP'
)

prepare() {
  cd "$srcdir"

  # Extract, patch
  tar --strip-components=1 -Jxvf "data.tar.xz"

  sed -i \
    's|/usr/bin/cli|/usr/bin/mono|g' \
    opt/manager-accounting/manager-accounting

  sed -i \
    's|/opt/|/usr/lib/|g' \
    opt/manager-accounting/manager-accounting

  sed -i \
    's|/opt/|/usr/lib/|g' \
    usr/share/applications/manager-accounting.desktop

  rm -rf usr/share/lintian
}

package() {
  install -d $pkgdir/usr/{bin,lib,share/{applications,icons}}
  cp -r opt/manager-accounting $pkgdir/usr/lib/
  cp -r usr/share/icons/* $pkgdir/usr/share/icons/
  ln -s /usr/lib/manager-accounting/manager-accounting $pkgdir/usr/bin/manager-accounting
  install -m644 usr/share/applications/$pkgname.desktop $pkgdir/usr/share/applications/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
