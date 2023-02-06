# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=nanosaur
pkgver=1.4.4
pkgrel=1
pkgdesc="Play as a cybernetic dinosaur in this third-person shooter"
arch=(x86_64)
url="https://github.com/jorio/Nanosaur"
license=('custom:pangea' 'custom:CC-BY-NC-SA-4.0')
# License sourced from http://www.pangeasoft.net/nano/nanosource.html
# Decent guidelines for gaming packages: https://fedoraproject.org/wiki/SIGs/Games/Packaging
depends=(
  'glibc'
  'gcc-libs'
  'libglvnd'
  'sdl2'
  'hicolor-icon-theme'
)
makedepends=('git' 'cmake')
_commit='3a56f8a0e5ea6d442ab86c33c1d033c76222b7ac'
source=(
  "$pkgname::git+https://github.com/jorio/Nanosaur.git#commit=$_commit"
  'git+https://github.com/jorio/Pomme.git'
  "$pkgname.desktop"
  "$pkgname.sh"
  'LICENSE'
)
sha512sums=('SKIP'
            'SKIP'
            '16ea64979287d313a95f7df1cf44e9ada5e01bd317d0e11aacf197778d61915a7383f332abcd26746f276301cd07b2e7174ca8fce50fc36f7e718e3db85b47e0'
            '498ca37847b44c15134fa174ad130cc8e481feeefb1e502da8a3dcf6f6967d4c2c93d1acfc5bd13e9b8a32d61c18e3f2b475db0d8b110244b026908083934783'
            '88a13f3a384c8df91243c6f6fb710d4a85f017c21140b5496ab0eb8aa68d39fba794d29ae2ca110101b9016e3128b8b93137759a24c3862289b2dce7a8efcb71')
b2sums=('SKIP'
        'SKIP'
        'a58f80a565d56b634a3ca70867779c469755828c44c26261553b3d7e663d32204318ef29500596668e1de2c4a16068200430820f3dd2c459da1d8265ebe5b78f'
        '21824ed76dd1150c5c7c84e4d580959c2bab00c54d9c558ee1565f63f864a4be3bf745e0d436720a71273efb0b9077cf93477ec977b46dd78bd552786569ec74'
        'ff25be6bd681b6d54b7ae97f81611bf601fad532ac413c90f2d683e252ada8015da1a24cf830b90d6d3c78463505d55044b58b457351fdae56f14fe2ab9ca754')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.Pomme.url ../Pomme
  git submodule update
}

build() {
  cmake \
    -S "$pkgname" \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  cmake --build build
}

package() {
  # create directories
  install -dv \
    "$pkgdir/usr/lib/$pkgname" \
    "$pkgdir/usr/share/doc/$pkgname"

  # binary & assets
  cp -vr build/{Data,Nanosaur} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop file & icon
  install -vDm644 \
    -t "$pkgdir/usr/share/applications" \
    "$pkgname.desktop"
  install -vDm644 \
    "$srcdir/$pkgname/packaging/Nanosaur.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  # documentation
  cp "$pkgname"/docs/* "$pkgdir/usr/share/doc/$pkgname"
  sed -e "s/@PROJECT_VERSION@/$pkgver/" \
    "$pkgname/packaging/ReadMe.txt.in" \
    > "$pkgdir/usr/share/doc/ReadMe.txt"

  # licenses
  install -vDm644 \
    -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE \
    "$pkgname/LICENSE.md"
}
