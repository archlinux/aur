# Maintainer: Essem <smswessem@gmail.com>

pkgname=gtultra-git
pkgver=r149.45b8e3a
pkgrel=1
pkgdesc='Extensively modified GoatTracker Stereo (2.76) version with many new features'
arch=('x86_64')
url='https://github.com/jpage8580/GTUltra'
license=('GPL')
depends=(
  'gcc-libs'
  'sdl12-compat'
  'hicolor-icon-theme'
)
makedepends=('gendesk')
source=("git+https://github.com/jpage8580/GTUltra.git" "fix-format-warnings.patch")
sha512sums=('SKIP' '1f1d9f431585b841ad0a163915ed0fd0923c9690d58448faf6f61c5b4393c035fabdc03aa92852e2043dee25ee565ede74d318c86da2b9f0cb37426f0ef39f6e')

pkgver() {
  cd GTUltra
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd GTUltra/src

  git apply ../../fix-format-warnings.patch

  gendesk -f -n \
    --pkgname "gtultra" \
    --pkgdesc "$pkgdesc" \
    --name 'GTUltra' \
    --exec 'gtultra %F' \
    --genericname 'C64 Music tracker' \
    --categories 'AudioVideo;AudioVideoEditing' \
    --icon "gtultra" \
    --mimetypes 'audio/sng'
}

build() {
  cd GTUltra/src
  make clean
  cd bme
  make
  cd ..
  make
}

package() {
  cd GTUltra

  # binaries
  find linux -type f -executable -exec install -vDm755 -t "$pkgdir/usr/bin" {} +

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/gtultra" GTUltra.pdf readme.txt readme_gtultra.txt
  #install -vDm644 -t "$pkgdir/usr/share/doc/gtultra/examples" examples/*.{sng,txt,ins,prg}
  cp -r examples "$pkgdir/usr/share/doc/gtultra"

  # man page
  # install -vDm644 -t "$pkgdir/usr/share/man/man1" linux/goattracker.1

  # desktop file
  install -vDm644 -t "$pkgdir/usr/share/applications" src/gtultra.desktop

  # application icon
  install -vDm644 src/goat32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/gtultra.png"
}
