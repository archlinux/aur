# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Raphaël Doursenaud <rdoursenaud@free.fr>
# Contributor: crasm <crasm@firebase-tools.aur.yooz4sio.vczf.io>

pkgname=firebase-tools
pkgver=9.1.2
pkgrel=1
pkgdesc="The Firebase Command Line Tools"
arch=('any')
url="https://github.com/firebase/firebase-tools"
license=('MIT')
depends=('nodejs')
makedepends=(
  'npm'
  'jq'
)
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('e9b73e2ef53eb5bea7e706605058ff15e82ac25765155470f4fe200bd3b4556e')

package() {
  # We throw away output here to keep the build quieter; if issues are
  # encountered, be sure to remove the output redirection in order to debug.
  npm install \
    --global \
    --user root \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${pkgname}-${pkgver}.tgz" &> /dev/null
  
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # Remove references to the package directory
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  # Remove references to the package directory from package.json
  find "$pkgdir" \
    -type f \
    -name 'package.json' \
    -execdir sh -c "jq '. | delpaths([paths|select(.[0] | test(\"_.*\"))])' {} > {}.new" \; \
    -exec mv {}.new {} \;

  # sshpk contains build references in the `man` attribute...
  find "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/sshpk/package.json" \
    -execdir sh -c "jq '.man = [[\
      \"man/man1/sshpk-conv.1\", \
      \"man/man1/sshpk-sign.1\", \
      \"man/man1/sshpk-verify.1\" \
    ]]' {} > {}.new" \; \
    -exec mv {}.new {} \;
  
  # Install a symlink for the LICENSE file
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s \
    "/usr/lib/node_modules/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
