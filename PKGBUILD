# Maintainer: Douglas Chimento <dchimento@gmail.com>
pkgname="thunderhub"
pkgver=0.13.16
pkgrel=2
pkgdesc="Lightning Node Manager"
arch=(any)
url="https://github.com/apotdevin/${pkgname}"
license=("MIT")
depends=("nodejs>=10")
makedepends=("npm")
optdepends=('lnd')
source=("https://github.com/apotdevin/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz" "env" "accounts.yaml" "${pkgname}.user" "pacman-01-chown.hook" "${pkgname}.service")
sha256sums=(d9bad5b1a274ed78dba99833407ef6595ce31d5efb1cbbf2eb1b4b30f28ab697 SKIP SKIP SKIP SKIP SKIP)
options=('!strip')
backup=("etc/${pkgname}/accounts.yaml" "etc/${pkgname}/env")
install=${pkgname}.install

prepare() {
    cd "$pkgname-$pkgver"
    sed -i 's/husky install/echo husky install/' package.json
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install --cache "${srcdir}/npm-cache" 
  npm run build  --cache "${srcdir}/npm-cache" 
  npm --cache "${srcdir}/npm-cache" prune production
}

package() {
  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  
  mkdir -p  "${pkgdir}/var/lib"
  cp -a "${srcdir}/${pkgname}-${pkgver}"  "${pkgdir}/var/lib/${pkgname}"
  rm "${pkgdir}/var/lib/${pkgname}/.env"
  
  install -Dm 644 "$srcdir/env" "$pkgdir/etc/${pkgname}/env"
  install -Dm 640 "$srcdir/accounts.yaml" "$pkgdir/etc/${pkgname}/accounts.yaml"

  install -Dm 644 "$srcdir/${pkgname}.user" "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
  msg2 'Installing pacman hooks...'
  install -Dm 644 "$srcdir"/*.hook -t "$pkgdir/usr/share/libalpm/hooks"

  install -Dm 644 "$srcdir/${pkgname}.service" \
    -t "$pkgdir/usr/lib/systemd/system"
}
