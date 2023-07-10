# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=c-lightning-rest
pkgver=0.10.5
pkgrel=1
pkgdesc="REST APIs for c-lightning written in Node.js"
arch=(any)
url="https://www.ridethelightning.info"
license=("MIT")
depends=("nodejs>=12")
makedepends=("npm" "jq" "moreutils")
optdepends=("lnd" "core-lightning")
backup=("usr/lib/systemd/system/REST.service")
install=$pkgname.install
source=("https://github.com/Ride-The-Lightning/c-lightning-REST/archive/refs/tags/v${pkgver}.tar.gz"
	"https://github.com/Ride-The-Lightning/c-lightning-REST/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc"
	"REST.service"
	"c-lightning-rest.install"
	"REST.sysusers"
	"REST.tmpfiles")

#noextract=("v${pkgver}.tar.gz")
sha256sums=('bfa15d26650e30cb466c816e22098c31789fc1564d7fc5221e14a879c39c7a12'
            'SKIP'
            'c20528fb2c185771dff808ab288ae2c739ef431017fba93814e07852ac65eb3f'
            '83b8752bcc6a68df21540d2ce2809059639de97516e0a3f66b6a2c0f24f40d7c'
            '0ed652bd5833e73bd52d41f9db7fdb1962d3aaa72da7ed495284bcce01a42f97'
            '18e3b9aeba3561f681294b5847d0455da7ea91b5fe21f006d36171240ff648c5')

validpgpkeys=('3E9BD4436C288039CA827A9200C9E2BC2E45666F') # suheb

prepare() {
  # Unpacking license file
  tar -zxvf "${srcdir}/v${pkgver}.tar.gz" --directory "${srcdir}" "c-lightning-REST-${pkgver}/LICENSE"
}

package() {
  
  # Installing c-lightning-REST
  npm install -g --only=prod --legacy-peer-deps --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"

  # Installing license file
  install -Dm644 "${srcdir}/c-lightning-REST-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/c-lightning-REST/LICENSE"

  # Fixing permissions
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  find "$pkgdir" -type f -name __ngcc_entry_points__.json -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;

  # Removing references to pkgdir
  find "${pkgdir}" -type f -name "package.json" -print0 | xargs -0 sed -i "/_where/d"

  # Removing references to srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/node_modules/c-lightning-rest/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"

  # install systemd file
  install -Dm644 "$srcdir/REST.service" "$pkgdir/usr/lib/systemd/system/REST.service"
  install -Dm644 "$srcdir/REST.sysusers" "$pkgdir/usr/lib/sysusers.d/REST.conf"
  install -Dm644 "$srcdir/REST.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/REST.conf"
}
