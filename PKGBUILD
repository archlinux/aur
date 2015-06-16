# Maintainer: Åsmund Ervik <aaervik at gmail dot com>
# Prev. maintainer: Patrice Peterson <runiq at archlinux dot us>
# Inspiration: Michael Witten <mfwitten>
# (Original) Inspiration: Gustavo Dutra <mechamo@gustavodutra.com>
# Contributor: RunningDroid <rningdrd at tormail dot org>
# Contributor: Alessandro Pezzoni <alessandro dot pezzoni at runbox dot com>
#
# Package changed name from pentadactyl-hg to pentadactyl-git on 10. April 2015

pkgname="pentadactyl-git"
_pkgname="pentadactyl"
license=(MIT)
pkgver=r7111.aca9da8
pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=2
pkgdesc="Vim-like five-fingered interface for Firefox"
arch=(any)
url="http://dactyl.sourceforge.net/pentadactyl"
depends=()
optdepends=("firefox")
makedepends=("coreutils" "git" "sh" "zip" "unzip")
provides=("pentadactyl")
conflicts=("pentadactyl")
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
  local _path_install="$pkgdir/usr/lib/firefox/browser/extensions/$_extension_id"

  install -d "$_path_install"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  unzip -od "$_path_install" "$_path_xpi"
}
