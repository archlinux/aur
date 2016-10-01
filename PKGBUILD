# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=passtrust
pkgver=1.2
pkgrel=1
arch=('any')
pkgdesc="A Ruby-based tool that converts a simple passphrase into a secure password"
url="https://github.com/xorond/passtrust"
license=('MIT')
depends=('ruby' 'xclip')
makedepends=('ruby-bundler')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ad748c57a2338a440ea3215d394de46731f464338063bcc456e16be4c0794b94ebb3f273ff76fceba3d9b374a770bd55dc182dc71e060c387f3a19a72a0e7c21')

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
