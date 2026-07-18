# Maintainer: Zhenyu Tan <614106917 at qq dot com>
pkgname=aurora-dict-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='A calm, fast Chinese-English desktop dictionary'
arch=('x86_64')
url='https://github.com/theonegis/aurora-dict'
license=('PolyForm-Noncommercial-1.0.0' 'MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libappindicator-gtk3'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=('libarchive')
provides=('aurora-dict')
conflicts=('aurora-dict')
options=('!strip' '!debug' '!emptydirs')
_deb_asset='aurora-dict_0.1.2_linux_amd64_deb.deb'
source=('AURORA-DICT-LICENSE.txt')
sha256sums=('728d06badaabc9485226552d9a69a8af45069fce48ea4516c4bd85d6c19c2f74')
source_x86_64=("${_deb_asset}::https://github.com/theonegis/aurora-dict/releases/download/v0.1.2/aurora-dict_0.1.2_linux_amd64_deb.deb")
sha256sums_x86_64=('2964cd3f6dfe567ea9c3f425c4bf808918c649ea8ee2702a44f2da4cf161bd68')
noextract=("${_deb_asset}")

package() {
  local deb_contents="$srcdir/deb-contents"
  local data_archive

  rm -rf "$deb_contents"
  mkdir -p "$deb_contents"
  bsdtar --no-same-owner -xf "$srcdir/${_deb_asset}" -C "$deb_contents"
  data_archive=$(find "$deb_contents" -maxdepth 1 -type f -name 'data.tar.*' -print -quit)
  [[ -n "$data_archive" ]] || {
    echo 'Could not find data.tar.* inside the Debian package.' >&2
    return 1
  }
  bsdtar --no-same-owner -xf "$data_archive" -C "$pkgdir"

  install -Dm644 "$srcdir/AURORA-DICT-LICENSE.txt"     "$pkgdir/usr/share/licenses/$pkgname/AURORA-DICT-LICENSE.txt"

  local ecdict_license
  ecdict_license=$(find "$pkgdir" -type f -name 'ECDICT-LICENSE.txt' -print -quit)
  [[ -n "$ecdict_license" ]] || {
    echo 'Could not find the bundled ECDICT license.' >&2
    return 1
  }
  install -Dm644 "$ecdict_license" "$pkgdir/usr/share/licenses/$pkgname/ECDICT-LICENSE.txt"
}
