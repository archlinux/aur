# Maintainer: redfish <redfish@galactica.pw>

pkgname=dat-gateway-git
_name=${pkgname%%-git}
pkgver=2.3.0beta.g08df37e
pkgrel=1
pkgdesc="In-memory Dat to HTTP gateway"
arch=(any)
url="https://github.com/garbados/dat-gateway"
license=('Apache-2.0')
depends=('nodejs' 'npm')
conflicts=("$_name")
provides=("$_name")
install="$_name.install"
source=(git+https://github.com/garbados/dat-gateway.git
	dat-gateway.service)

# There are some native binaries being built, but .node files confuse strip, so
# don't bother stripping anything.
options=(!strip)

pkgver() {
  cd "$_name"
  printf "%s.g%s" \
  	$(cat package.json | sed -n 's/.*"version":\s* "\([^"]\+\)".*/\1/p' | sed 's/-//g') \
  	$(git rev-parse --short HEAD)
}

package(){
  npm install --user root --prefix "${pkgdir}/usr" -g $(npm pack ${srcdir}/$_name | tail -1)
  find ${pkgdir} -type d -exec chmod 0755  {} \; # npm creates 777 dirs, causes warnings
  install -Dm0644 $_name.service ${pkgdir}/usr/lib/systemd/system/$_name.service
}

sha256sums=('SKIP'
            '3bc2048a9dcf89e935c276615dcb19da8728fd68842c12ebac1912bfd5a65b15')
