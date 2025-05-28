# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='netconsd'
pkgver='0.4.1'
pkgrel='2'
pkgdesc='The Netconsole Daemon'
arch=('x86_64' 'aarch64')
url="https://github.com/facebook/${pkgname}"
license=('BDS3')
makedepends=('gcc' 'make')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	"patch1.patch::${url}/commit/68c5808203d5c381df769857165bffcca5d8245d.patch"
	"patch2.patch::${url}/commit/5e64346e9280d69c41c5e330db471ee8f995b286.patch"
	"patch3.patch::${url}/commit/a26bf94a8cf3c7821cc759fc91c28433433cfd1c.patch"
	"patch4.patch::${url}/commit/2755519ea9d5c2edc91c5b3246ea401bd6697874.patch"
	"patch5.patch::${url}/commit/1d80b66285765a54a4ed681c27608164756ff980.patch")
sha256sums=('6faff1eb8cfa8d2d99302eb9fdb10f0aedb2daf20319cc704b2c80a4f220fc13'
            'a24e2898b4dbcee182312057e74cfc37a97f46f5876e47c2162f292c29197a14'
            '606000a36fc864dc83ef077e43f327dae5dfe97e0ebe03d8902330f5b3094ccb'
            '8595a586457805424b7aea50b75fcd3667577dda23522a1ba5787138a1a3c773'
            'c329cead32ea6369e46c033c2769020073a173f67dddb0a49da0322e6e64e688'
            '2e1eb2d9d315c0c668027fe73d0de58f175a5a5601c2ffba2ef54426b433dbb8'
            'afded887a9a1d62537e0a82b7e53b150fe3fecbe3264332b607137ff200993c6'
            '37bbf8058318f59081e7c49a91612f9298264ad9b5817aadb96a072333c45add'
            '62038f85ee6c82b62a597003cbe36ce085a38899877d5ba501e17cab757cae1a'
            'fe5d0223d2241e99303db551983e940c27db6a722cfa3399abd4ea174f49c732')

prepare() {
  cd "${pkgname}-${pkgver}"
  for e in "../"*".patch"
    do
    echo "Apply patch: ${e}"
    patch -p1 -i "../${e}"
  done
}

build() {
  cd "${pkgname}-${pkgver}"
  make
  make utils
}

package() {
  pushd "${pkgname}-${pkgver}"
  install -Dm0755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0755 "util/netconsblaster" -t "${pkgdir}/usr/bin"
  install -Dm0755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -Dm0755 "modules/"*".so" "${pkgdir}/usr/lib/${pkgname}"
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  popd
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm0644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
