# Maintainer: Alex Talker <alextalker at opmbx dot org>
# pentadactyl-hg folks:
# Maintainer: Åsmund Ervik <aaervik at gmail dot com>
# Prev. maintainer: Patrice Peterson <runiq at archlinux dot us>
# Inspiration: Michael Witten <mfwitten>
# (Original) Inspiration: Gustavo Dutra <mechamo@gustavodutra.com>
# Contributor: RunningDroid <rningdrd at tormail dot org>

pkgname="aurora-pentadactyl-git"
_pkgname="pentadactyl"
license=(MIT)
pkgver=pentadactyl.1.1.r125.g07b64b3
pkgver() {
      cd "$_pkgname"
      git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Vim-like five-fingered interface for Firefox"
arch=(any)
url="https://github.com/5digits/dactyl/"
depends=()
optdepends=("firefox")
makedepends=("coreutils" "git" "sh" "zip" "unzip")
provides=("pentadactyl" "aurora-pentadactyl-hg")
conflicts=("pentadactyl" "aurora-pentadactyl-hg")
source=("$_pkgname::git+https://github.com/5digits/dactyl.git")
md5sums=('SKIP')

build() {
  cd "$_pkgname"
  sed -i 's/maxVersion="[^"]*/maxVersion="40/' pentadactyl/install.rdf 
  make -C pentadactyl xpi
}

package() {
  cd "$_pkgname"
  local _version_pentadactyl="$(awk -F 'em:version="|"' '/em:version/ {print $2; exit}' $srcdir/$_pkgname/pentadactyl/install.rdf)"
  local _extension_id="$(awk -F 'em:id="|"' '/em:id/ {print $2; exit}' $srcdir/$_pkgname/pentadactyl/install.rdf)"
  local _path_xpi="$srcdir/$_pkgname/downloads/pentadactyl-${_version_pentadactyl}.xpi"
  local _path_install="$pkgdir/opt/firefox-aurora/browser/extensions/$_extension_id"

  install -d "$_path_install"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  unzip -od "$_path_install" "$_path_xpi"
}
