# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Giusy Digital <kurmikon@libero.it>

_appname=pulsar
_reponame=pulsar-edit
_tasktag=5999796983955456
_datetag=2022110702

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
sha256sums=('8f7500fb0928390c64d61ad4f78cc4683de912bb47213875ea18f4a1794cd8f3')

prepare() {
  bsdtar xf data.tar.xz
  asar e opt/Pulsar/resources/app.asar asar
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"

  # Cleanup specs. Remove if implemented upstream
  find "$pkgdir/opt/Pulsar/resources/app/apm" -type d -name "spec" -exec rm -rf {} +
  find "$pkgdir/opt/Pulsar/resources/app.asar.unpacked" -type d -name "spec" -exec rm -rf {} +

  # This needs removal along with asar makedepend when fixed upstream
  mkdir -p "$pkgdir/opt/Pulsar/resources/app.asar.unpacked/node_modules/github/"
  mv asar/node_modules/github/bin "$pkgdir/opt/Pulsar/resources/app.asar.unpacked/node_modules/github/bin"
  rm -rf asar

  mkdir -p "$pkgdir/usr/bin"
  chmod +x "$pkgdir/opt/Pulsar/resources/${_appname}.sh"

  ln -sf "/opt/Pulsar/resources/${_appname}.sh" "$pkgdir/usr/bin/${_appname}"
}
