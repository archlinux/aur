# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=nanosaur2
pkgver=2.1.0
pkgrel=2
pkgdesc='Sequel to the original Nanosaur'
arch=(x86_64 aarch64)
url='https://github.com/jorio/Nanosaur2'
license=('custom:CC-BY-NC-SA-4.0')
depends=(
  'glibc'
  'gcc-libs'
  'libglvnd'
  'sdl2'
  'hicolor-icon-theme'
)
makedepends=('git' 'cmake')
source=(
  "$pkgname::git+https://github.com/jorio/Nanosaur2.git#tag=v$pkgver"
  'github.com-jorio-Pomme::git+https://github.com/jorio/Pomme'
  "$pkgname.desktop"
  "$pkgname.sh"
)
sha512sums=('30b28c110be5df2b43312fa8b5bff3b0314049b1e0a4861368bcfb481489b3f0aaa586217bd733a59b8fd9effa8871986226f19a766e73569ffbb27497849688'
            'SKIP'
            '1ce25c64507b08c6ca9075a56a75f93efc19f1aa9e1e86fbe9f5967940aae438bc4839e4b47326fc8c0f3ba6211ceecff32982582bae9896c5ef05bcdf8ab410'
            'bc62ea6c0e4de2fa365eb60b89cb205cff803122fa8d174d6953fef27c469cd612ea2f98f371561ae98fecd100b013a4d7f52eba8eec59899c1d2665e8a1f5db')
b2sums=('724e9ba55bd456879be2b77ffd924f4cda90584169795879e6bdc22521a4af52b87b359386ea30305db6883443b16ee88b86c95d574258dedd2b8a61353cfb04'
        'SKIP'
        'e41fd1bc5e7aa9af7f7bc5c13400f947c9837a54d716ea6cfcb1319a539ed20e7cc9775a6add851a6bc9670ebb34db2191576ebde240a49be23766e5274fe3f5'
        'd862700903f51667999c254bd328f8a7bc9bd00db3a1e6c5b776b908dbfe0f0568b4662cc6ee70ca71421cec87c57c1e05de4c63264e1257fcb9d88ecdf3c1ad')

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

  cmake \
    -S . \
    -B build \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -W no-dev

  cmake --build build
}

package() {
  # binary & assets
  install -dv "$pkgdir/usr/lib/$pkgname"
  cp -vr "$pkgname"/build/{Data,Nanosaur2} "$pkgdir/usr/lib/$pkgname"

  # wrapper script for $PATH execution
  install -vDm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # desktop file & icon
  install -vDm644 \
    -t "$pkgdir/usr/share/applications" \
    "$pkgname.desktop"
  install -vDm644 \
    "$pkgname/packaging/nanosaur2-desktopicon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  cd "$pkgname"

  # documentation
  install -vDm644 \
    -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,README,SECRETS}.md screenshot.webp
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"
  sed -e "s/@PROJECT_VERSION@/$pkgver/" \
    packaging/ReadMe.txt.in \
    > "$pkgdir/usr/share/doc/$pkgname/ReadMe.txt"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
