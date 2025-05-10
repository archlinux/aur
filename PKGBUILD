# Maintainer: envolution
# Contributor: schlmm - packaging suggestions
# Contributor: éclairevoyant
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=owncast
pkgver=0.2.3
pkgrel=1
_npmver=iron
pkgdesc='Self-hosted live video streaming (chat included)'
arch=(x86_64)
license=(MIT)
depends=(glibc)
url='https://owncast.online/'
makedepends=(git go npm nvm)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/owncast/owncast/archive/refs/tags/v${pkgver}.tar.gz"
  owncast.tempfiles.conf
  owncast.users.conf
  owncast.service
  nginx.sample.conf
)
sha256sums=('b881bec39aa210430bac76ece05fdb761c09972167d71bf7d9e3feff3f9da639'
            'bba4d75a41a90d778928439bc8e1c21b359dcc45d0b909ba5171ac2fb2c05a3b'
            'd822e9e1e4d6fb58c76ebcb2d5e30e4d4d79c7599c135365163c4f6074e33cb2'
            '07b76935dec80397e0a5f8db4bc64dc7fec5c620388e1971e2961b7b6eeb352c'
            '608a36e7ac62b07d08091d547f909571ecf9cc33e8fc1578d64d064f61183675')

options=(emptydirs !strip)
install=$pkgname.install

_ensure_local_nvm() {
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  #select npm version
  _ensure_local_nvm
  nvm install --lts=${_npmver}

  #prepare web bundle
  rm -rf bundleWeb && mkdir -p bundleWeb
  cd "${pkgname}-${pkgver}"
  cp build/web/bundleWeb.sh "$srcdir/bundleWeb"

  sed -i "/rev-parse.*show-toplevel/c\
cd \"${srcdir}/${pkgname}-${pkgver}\"\\
rm -rf web/node_modules web/package-lock.json" "$srcdir/bundleWeb/bundleWeb.sh"

  #build with verbosity
  #sed -i 's/npm.*silent.*install.*/npm install/' "$srcdir/bundleWeb/bundleWeb.sh"
  #currently has dependency conflicts that --legacy-deps wouldn't solve, this may change in later releases
  sed -i 's/npm.*install.*/npm install --force/' "$srcdir/bundleWeb/bundleWeb.sh"

}

build() {
  #build frontend
  bundleWeb/bundleWeb.sh

  cd "$pkgname-$pkgver"
  # Build backend
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname}" -ldflags "-extldflags '${LDFLAGS}' -s -w -X main.version=${pkgver}"
}

package() {
  install -vDm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 $pkgname.users.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 $pkgname.tempfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm644 nginx.sample.conf -t "$pkgdir/usr/share/$pkgname/"

  cd $pkgname-$pkgver
  install -vdm755 "$pkgdir/usr/share/webapps/$pkgname"
  cp -R static/web/. "$pkgdir/usr/share/webapps/$pkgname"
  install -vDm755 $pkgname -t "$pkgdir/usr/bin/"
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set ts=2 sw=2 et:
