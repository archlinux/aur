# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=passtrust
pkgver=2.0
pkgrel=1
arch=('any')
pkgdesc="A Ruby-based tool that converts a simple passphrase into a secure password"
url="https://github.com/xorond/passtrust"
license=('MIT')
depends=('ruby' 'xclip')
makedepends=('ruby-bundler')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d0665ee351698f7aa9b0c20f193d4c8c9876e5ce5b6a255a121192926fb027b97e28c1f8d43b4133b233b9f6e406f0e6c46d43244e0e4048e4e1e23425cf4c81')

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
