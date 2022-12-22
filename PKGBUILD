#Maintainer: SadaoMaou <luxrayguy@gmail.com>
#Contributor: Satiricon <david.satiricon@gmail.com>
pkgname=lanraragi
pkgver=v.0.8.8
pkgrel=1
pkgdesc="LANraragi build package"
arch=(any)
url="https://github.com/Difegue/LANraragi"
license=("MIT")
depends=(libarchive ghostscript perl gnupg redis imagemagick libwebp openssl zlib perl-local-lib perl-uri)
makedepends=(cpanminus npm perl-config-autoconf pkgconf)
source=("https://github.com/Difegue/LANraragi/archive/${pkgver}.tar.gz"
        "lanraragi.service" "lanraragi.sysusers" "lanraragi.tmpfiles")
sha512sums=(
"33b03576891bb4645986e5ddfadc60020b61892fd1135498157e6c9af13122790119ec1e4efba2260850d8c083b42f87988d0a736d660139f8c8a8c06cc2e2b7"
"1ef2ca60e51269351440c1ae77431c46b8b82eb7d285e6d209ca9ac64141e2a337a5e9abca49425d026a10194b341c6c22966708bfa8f81d3904c8bc490123e6"
"c598b37c691b66c3c32aed50d0e79c9d75708c40f79fe83f287e6ed1592736f608b646427ef044bf489d034a91219fd1567b3d0ece320633176ae5dbe28b7685"
"0f66197d8fe253d1f6ff56f4e301c337be66aa82cf091619df1a8c17ec97d66721f2618cdcdf88718f28f0d80263d4331e482d22468e1bd7bd55ecb2bc076a2d"
)


build() {
  PATH=/usr/bin/vendor_perl:$PATH
  
  cd LANraragi-${pkgver}
  export PERL_CPANM_OPT="--local-lib=./perl5 $PERL_CPANM_OPT"
  npm run lanraragi-installer install-full
}


package() {
  install -d -m 755 "${pkgdir}/usr/lib/lanraragi/perl5"
  cp -dpr --no-preserve=ownership "${srcdir}/LANraragi-${pkgver}/"* "${pkgdir}/usr/lib/lanraragi"
  chmod -R a=,a+rX,u+w ${pkgdir}/usr/lib/lanraragi

  install -D -m 644 "${srcdir}/lanraragi.service" "${pkgdir}/usr/lib/systemd/system/lanraragi.service"
  install -D -m 644 "${srcdir}/lanraragi.sysusers" "${pkgdir}/usr/lib/sysusers.d/lanraragi.conf"
  install -D -m 644 "${srcdir}/lanraragi.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lanraragi.conf"
  install -D -m 644 "${srcdir}/LANraragi-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  grep -rnwl ${pkgdir} -e ${srcdir} | xargs -I % sed -i 's,'"$srcdir"',\.,g' %

}
