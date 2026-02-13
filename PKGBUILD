# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=nanosaur
pkgver=1.4.4
pkgrel=3
pkgdesc="Play as a cybernetic dinosaur in this third-person shooter"
arch=(x86_64 aarch64)
url="https://github.com/jorio/Nanosaur"
license=(LicenseRef-pangea CC-BY-NC-SA-4.0)
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
source=(
  "$pkgname::git+https://github.com/jorio/Nanosaur.git#tag=v$pkgver"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  "$pkgname.desktop"
  "$pkgname.sh"
  'LICENSE'
)
sha512sums=('62cb29bf923248736e76a9a91594631575de1b388ac1eec715bdc5594fa96bba86987b47739b2c81a467accc86280221db4c1016870c5c04f49d88e75d42ce31'
            'SKIP'
            '16ea64979287d313a95f7df1cf44e9ada5e01bd317d0e11aacf197778d61915a7383f332abcd26746f276301cd07b2e7174ca8fce50fc36f7e718e3db85b47e0'
            '7381a40d3a60b9384bf38203e0da483c2a4ae9d89c2e6f95b62c7fcbe9543e2e7ee06848499275d947400c5c56beb55701ab3a7de016e75dc235193b5edf0248'
            '88a13f3a384c8df91243c6f6fb710d4a85f017c21140b5496ab0eb8aa68d39fba794d29ae2ca110101b9016e3128b8b93137759a24c3862289b2dce7a8efcb71')
b2sums=('6bcc0c4c8e7ec397a2c7cf64d313d2987f68fb8bee7f1c94a7b3d0d25f410a8c3ea36b49b79b7f95ac44e363e98365f1a29291f28c9c91bb00c6bb0b432ba32a'
        'SKIP'
        'a58f80a565d56b634a3ca70867779c469755828c44c26261553b3d7e663d32204318ef29500596668e1de2c4a16068200430820f3dd2c459da1d8265ebe5b78f'
        '50a982c0063cbe5accab0c5e2e21e8aec395e07f96a23021dc9ba9427faffc4ec229368a21f2290f39b57b3b01b1ca7d1a48df8fa3c7a68ea89020559b8a388a'
        'ff25be6bd681b6d54b7ae97f81611bf601fad532ac413c90f2d683e252ada8015da1a24cf830b90d6d3c78463505d55044b58b457351fdae56f14fe2ab9ca754')

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.Pomme.url "$srcdir/github.com-jorio-Pomme"
  git -c protocol.file.allow=always submodule update

  # ftbfs: gcc 13 & cstdint headers
  cd extern/Pomme
  git cherry-pick --no-commit d57c28e205462e51063e787f9ebddaadff592f1e
}

build() {
  cd "$pkgname"

  local cmake_options=(
    -B build
    -S .
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

package() {
  # create directories
  install -dv \
    "$pkgdir/usr/lib/$pkgname" \
    "$pkgdir/usr/share/doc/$pkgname"

  # binary & assets
  cp -vr "$pkgname"/build/{Data,Nanosaur} "$pkgdir/usr/lib/$pkgname"

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
