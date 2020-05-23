pkgname=ethercalc
pkgver=0.20200505.0
pkgrel=2
pkgdesc="a web spreadsheet"
arch=('any')
url="https://ethercalc.net"
license=('CPAL')
depends=('nodejs-lts-erbium')
optdepends=('redis: redis support')
makedepends=('npm' 'jq')
backup=("etc/conf.d/$pkgname")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
    "$pkgname.tmpfiles"
    "$pkgname.sysusers"
    "$pkgname.service"
    "$pkgname.conf")
noextract=("$pkgname-$pkgver.tgz")

sha256sums=('663689e933f45ce621c31eab5bfa754e7adcc01789e032e5f61a0ae5ce2898a4'
            '785aedcb398f637d55b4a1f0956f814bc836ee4a059c743fd6e9411d1fba7b10'
            '437445d2a0ab54008bfa42c197e387863f246da5ee1cda3c0fd1cefe07a2d6fd'
            'abb5615b6f2f6dce2eca5cc9bae41204087b49f065feee3d306cdb1e3caa7103'
            '66cf0fb8ba94c0598ac1fe03d161809d28e27fd708764b4af513a0873d8b1d74')

package() {
    #TODO:
    # - fix npm errors?
    npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
    find "$pkgdir/usr" -type d -exec chmod 755 {} +

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # system files
    install -Dm644 ${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 ${pkgname}.tmpfiles   "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 ${pkgname}.sysusers   "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 ${pkgname}.conf       "${pkgdir}/etc/conf.d/${pkgname}"
}
