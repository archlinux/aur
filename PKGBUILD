# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=passtrust
pkgver=1.3
pkgrel=1
arch=('any')
pkgdesc="A Ruby-based tool that converts a simple passphrase into a secure password"
url="https://github.com/xorond/passtrust"
license=('MIT')
depends=('ruby' 'xclip')
makedepends=('ruby-bundler')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c53c29208682b138566cf837c5cfdd5f127ac70237c0cd7b7753312adc372a135ec1951856fe811fb453da6b7f686c7876f05a108d67395e7fc2e3475f894670')

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
