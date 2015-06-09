# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=miv-git
pkgver=20150216
pkgrel=1
pkgdesc="Vim plugin manager written in Haskell"
arch=('i686' 'x86_64')
makedepends=('ghc'
             'haskell-aeson'
             'haskell-hashable'
             'haskell-text'
             'haskell-unordered-containers'
             'haskell-yaml')
url="https://github.com/itchyny/miv"
license=('MIT')
source=(git+https://github.com/itchyny/miv)
sha256sums=('SKIP')
options=('strip')
install=miv.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  runhaskell Setup configure \
              --prefix=/usr \
              --docdir=/usr/share/doc/miv \
              --enable-split-objs \
              --enable-shared \
              -O -p
  runhaskell Setup build
  runhaskell Setup haddock
  # runhaskell Setup register --gen-script
  # runhaskell Setup unregister --gen-script
  # sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"

  msg 'Installing...'
  # install -Dm 744 register.sh "$pkgdir/usr/share/haskell/${pkgname%-git}/register.sh"
  # install -Dm 744 unregister.sh "$pkgdir/usr/share/haskell/${pkgname%-git}/unregister.sh"
  install -dm 755 "$pkgdir/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/${pkgname%-git}/html "$pkgdir/usr/share/doc/ghc/html/libraries/${pkgname%-git}"
  runhaskell Setup copy --destdir=$pkgdir
  rm -f "$pkgdir/usr/share/doc/${pkgname%-git}/LICENSE"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
