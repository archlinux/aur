# Maintainer: Keithsel <keithsel@disroot.org>
pkgname=9router-bin
pkgver=0.4.59
pkgrel=1
pkgdesc="AI router and proxy providing an OpenAI-compatible endpoint for multiple AI providers"
arch=('x86_64')
url="https://github.com/decolua/9router"
license=('MIT')
depends=('nodejs-lts-jod')
makedepends=('npm' 'python')
optdepends=('systemd: user service management via systemctl --user')
install="${pkgname}.install"
options=('!strip')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/9router/-/9router-${pkgver}.tgz"
        '9router.sh' '9router.service' '.env.example')
sha512sums=('c65e872c5e310576514c334d3b010e87e70356d49decd31d6efcd1a703cda5240dac6c69e121219f19d5a1156a803a22e919cbdfd9f61f9c033b6a41516559f2'
            '67ccfb89f1e35f6e629af0d10fdf12b8b11f8c321024a7e4b29d262c0709391553caf60d24dd4e1c6531ebcac51fa229ce2e406a4c4c677d7804b32618130b00'
            'ee90928c03257aa32e6e0a2a7fc1d5ea63bbfa0b3565dc1bf1d41f4ff7e96ec813d51ae0b802ae3de001f1b510560ff7c04f949beecd6312874bb77edc851914'
            '01bd0f7ab44cfdc0d5d4a053a1e8ed3023381d86502da3e5ce934ec884c9c35d94b9fab34053ddd2451e6fa0835f8b47fae09b9cf9f2b5712bb7053b6332bdc0')

build() {
  _pkgroot=$(find "${srcdir}" -maxdepth 2 -name "package.json" -not -path "*/app/*" -printf '%h' -quit)
  cd "${_pkgroot}"

  export HOME="${srcdir}/npm-home"
  export JOBS=$(nproc)

  npm install --omit=dev --no-save --no-audit --no-fund --prefer-offline \
    enquirer node-forge node-machine-id react react-dom
  
  npm rebuild better-sqlite3 --prefix app

  find node_modules/systray -depth -delete 2>/dev/null || true
}

package() {
  _pkgroot=$(find "${srcdir}" -maxdepth 2 -name "package.json" -not -path "*/app/*" -printf '%h' -quit)
  cd "${_pkgroot}"

  install -dm755 "${pkgdir}/usr/lib/node_modules/9router"
  cp -a . "${pkgdir}/usr/lib/node_modules/9router/"

  find "${pkgdir}/usr/lib/node_modules/9router" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${pkgdir}/usr/lib/node_modules/9router" -type f \( -name "*.mk" -o -name "Makefile" -o -name "*.d" -o -name "config.gypi" \) -delete
  find "${pkgdir}/usr/lib/node_modules/9router" -type f ! -perm -u+r -exec chmod a+r {} +
  find "${pkgdir}/usr/lib/node_modules/9router" -type d -exec chmod a+rx {} +

  install -Dm755 "${srcdir}/9router.sh" "${pkgdir}/usr/bin/9router"
  install -Dm644 "${srcdir}/9router.service" "${pkgdir}/usr/lib/systemd/user/9router.service"
  install -Dm644 "${srcdir}/.env.example" "${pkgdir}/usr/share/doc/${pkgname}/.env.example"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
