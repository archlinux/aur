# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=ride-the-lightning
pkgver=0.13.3
pkgrel=1
pkgdesc="RTL is a full function, device agnostic, web user interface to help manage lightning node operations."
arch=(any)
url="https://www.ridethelightning.info"
license=("MIT")
depends=("nodejs>=12")
makedepends=("npm" "jq" "moreutils")
optdepends=("lnd" "core-lightning")
backup=("usr/lib/systemd/system/RTL.service")
install=$pkgname.install
source=("https://github.com/Ride-The-Lightning/RTL/archive/refs/tags/v${pkgver}.tar.gz"
	"https://github.com/Ride-The-Lightning/RTL/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc"
	"RTL.service"
	"ride-the-lightning.install"
	"RTL.sysusers"
	"RTL.tmpfiles")

#noextract=("v${pkgver}.tar.gz")
sha256sums=('8032c76537c17821b2cdd25e6a9f48490687b7ac819a6452c78a4843277e3c6d'
            'SKIP'
            '8018bd40de57b45b282943c27887d3eba35e3b0bae26a5a4f6b833b3aff66a7e'
            '0898aaf7835abde7680b17b4dc9969ae4d1d3e173328e49c57617bd3e3fa0b95'
            '96c2cb03de12854d481e9e81f55ecc6c757c7680f3337769f807fe0c12eef60e'
            'b3a51675fceae1cfcec447bca09fe89292512670bd3dcda605defcc5d96b66a9')

validpgpkeys=('3E9BD4436C288039CA827A9200C9E2BC2E45666F') # suheb

prepare() {
  # Unpacking license file
  tar -zxvf "${srcdir}/v${pkgver}.tar.gz" --directory "${srcdir}" "RTL-${pkgver}/LICENSE"
}

package() {
  
  # Installing RTL
  npm install -g --only=prod --legacy-peer-deps --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"
  
  # Installing request dependency
  npm install -g --only=prod --legacy-peer-deps --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" request --save

  # Installing license file
  install -Dm644 "${srcdir}/RTL-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

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
  local pkgjson="${pkgdir}/usr/lib/node_modules/rtl/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"

  # install systemd file
  install -Dm644 "$srcdir/RTL.service" "$pkgdir/usr/lib/systemd/system/RTL.service"
  install -Dm644 "$srcdir/RTL.sysusers" "$pkgdir/usr/lib/sysusers.d/RTL.conf"
  install -Dm644 "$srcdir/RTL.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/RTL.conf"
  install -Dm644 "$pkgdir/usr/lib/node_modules/rtl/Sample-RTL-Config.json" "$pkgdir/etc/RTL/Sample-RTL-Config.json"
}
