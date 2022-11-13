# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Giusy Digital <kurmikon@libero.it>

_appname=pulsar
_reponame=pulsar-edit
_tasktag=4704092994928640
_datetag=2022111319

pkgname="${_appname}-bin"
pkgver="1.63.${_datetag}"
pkgrel=1
pkgdesc="Community build of the hackable text editor, built on Electron"
arch=("x86_64")
url="https://github.com/${_reponame}/${_appname}"
license=("MIT")
depends=("libxkbfile" "ripgrep")
makedepends=("asar")
optdepends=(
  "ctags: symbol indexing support"
  "git: Git and GitHub integration"
  "hunspell: spell check integration"
)
provides=("${_appname}")
conflicts=("${_appname}")
source=("${_appname}-${pkgver}.deb::https://api.cirrus-ci.com/v1/artifact/task/${_tasktag}/binary/binaries/${_appname}_${pkgver}_amd64.deb")
sha256sums=('bc814d81f4eea6e361fda039393f3516e6687547232016a83f6402f31d2a1cc4')

prepare() {
  bsdtar xf data.tar.xz
  asar e opt/Pulsar/resources/app.asar asar
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"

  # Cleanup specs. Remove if implemented upstream
  find "$pkgdir/opt/Pulsar/resources/app/ppm" -type d -name "spec" -exec rm -rf {} +
  find "$pkgdir/opt/Pulsar/resources/app.asar.unpacked" -type d -name "spec" -exec rm -rf {} +

  # Fix core modules missing in settings. Remove when implemented upstream
  sed -i "s/=== 'apm'/=== 'ppm'/" "$pkgdir/opt/Pulsar/resources/app/ppm/lib/apm.js"
  sed -i "s/is 'apm'/is 'ppm'/" "$pkgdir/opt/Pulsar/resources/app/ppm/src/apm.coffee"

  # Fix featured not working. Remove when implemented upstream
  sed -i "/pack != null/c return pack != null && pack.releases != null;" \
        "$pkgdir/opt/Pulsar/resources/app/ppm/lib/featured.js"

  sed -i "s/pack?.releases?.latest?/pack?.releases?/" \
        "$pkgdir/opt/Pulsar/resources/app/ppm/src/featured.coffee"

  # This needs removal along with asar makedepend when fixed upstream
  mkdir -p "$pkgdir/opt/Pulsar/resources/app.asar.unpacked/node_modules/github/"
  mv asar/node_modules/github/bin "$pkgdir/opt/Pulsar/resources/app.asar.unpacked/node_modules/github/bin"
  rm -rf asar

  mkdir -p "$pkgdir/usr/bin"
  chmod +x "$pkgdir/opt/Pulsar/resources/${_appname}.sh"

  ln -sf "/opt/Pulsar/resources/${_appname}.sh" "$pkgdir/usr/bin/${_appname}"
}
