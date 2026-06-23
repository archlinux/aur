# Maintainer: wyf9661 <wyf9661@hotmail.com>
# Contributor: Keithsel <keithsel@disroot.org>
pkgname=9router-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="AI router and proxy providing an OpenAI-compatible endpoint for multiple AI providers"
arch=('x86_64')
url="https://github.com/decolua/9router"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'python')
optdepends=('systemd: user service management via systemctl --user')
install="${pkgname}.install"
options=('!strip')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/9router/-/9router-${pkgver}.tgz"
        '9router.sh' '9router.service' '.env.example')
sha256sums=('77a306d326b8d5f2f6e2beeac130b58f4c4d90a5daf6c3742b192b8ce66b6825'
            '912c4a6f0c3589a23dd4e015c28500643727086b89463ec79f62e6dc569a4804'
            '39ea05509034ce1e49c8388e918ecd7f478e0ec996eec8c0cfb7bd57f995eb1a'
            'be29534e45b564eca0a854fd06a06166a5ca0992a48bcedbc36b31e364521786')

build() {
  # npm extracts to a fixed package/ directory
  _pkgroot="${srcdir}/package"
  cd "${_pkgroot}"

  # Isolate npm cache to avoid polluting user directory
  export HOME="${srcdir}/npm-home"
  export JOBS=$(nproc)

  npm install --omit=dev --no-save --no-audit --no-fund --prefer-offline \
    enquirer node-forge node-machine-id react react-dom

  # Rebuild native module (SQLite)
  cd "${_pkgroot}/app" && npm rebuild better-sqlite3

  # Remove systray: poor Linux compatibility, triggers antivirus false positives
  rm -rf "${_pkgroot}/node_modules/systray"
}

package() {
  _pkgroot="${srcdir}/package"
  cd "${_pkgroot}"

  install -dm755 "${pkgdir}/usr/lib/node_modules/9router"
  cp -a . "${pkgdir}/usr/lib/node_modules/9router/"

  local _dest="${pkgdir}/usr/lib/node_modules/9router"

  # Clean up build artifacts and path leaks (targeted, no full-tree scan)
  find "${_dest}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "${_dest}" -type f \( -name "*.mk" -o -name "Makefile" -o -name "*.d" -o -name "config.gypi" \) -delete

  # Set correct permissions (single recursive pass)
  chmod -R a+rX "${_dest}"

  install -Dm755 "${srcdir}/9router.sh" "${pkgdir}/usr/bin/9router"
  install -Dm644 "${srcdir}/9router.service" "${pkgdir}/usr/lib/systemd/user/9router.service"
  install -Dm644 "${srcdir}/.env.example" "${pkgdir}/usr/share/doc/${pkgname}/.env.example"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
