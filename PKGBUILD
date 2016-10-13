# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=passtrust
pkgver=2.1
pkgrel=1
arch=('any')
pkgdesc="A Ruby-based tool that converts a simple passphrase into a secure password"
url="https://github.com/xorond/passtrust"
license=('MIT')
depends=('ruby' 'xclip')
makedepends=('ruby-bundler')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c3a6af314d8de35369c029d747f93723228bbd4036a6a66c7751fcc238b3fce5df9cba00316f267cbe3413114cb85c4bca5633d4839a8775b217722858564036')

package() {
  cd ${pkgname}-${pkgver}
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}" && rm LICENSE
  cp -a --no-preserve=ownership * "${pkgdir}/usr/share/${pkgname}"

  cd "${pkgdir}/usr/share/${pkgname}"
  bundle install --deployment --with optional

  # remove references to ${pkgdir}
  find . -name gem_make.out | xargs rm -rf

cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/env bash
cd /usr/share/${pkgname}
./passtrust "\$@"
EOF
chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
