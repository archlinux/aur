# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Ilgrim <ilgrim at gmail dot com>

pkgname=squirrel
pkgver=3.1
pkgrel=1
pkgdesc="A light-weight scripting language that fits in the size, memory bandwidth, and real-time requirements of applications like video games"
arch=('i686' 'x86_64')
url="http://www.squirrel-lang.org/"
license=('MIT')
source=(http://sourceforge.net/projects/squirrel/files/squirrel3/squirrel%20${pkgver}%20stable/${pkgname}_3_1_stable.tar.gz)
sha256sums=('4845a7fb82e4740bde01b0854112e3bb92a0816ad959c5758236e73f4409d0cb')

build() {
  cd "${srcdir}"/squirrel3
# If $arch is x86_64, compile for 64bits. Else do it for 32.
  if [ $CARCH=='x86_64' ]; then
    make sq64
  else
    make sq32
  fi
}

package() {
  cd "${srcdir}"/squirrel3

# Install squirrel Interpreter
  install -Dm755 bin/sq "${pkgdir}"/usr/bin/$pkgname

# Install Includes and various headers
  for _file in $(ls "${srcdir}"/squirrel3/include)
  do
     install -Dm644 include/$_file "${pkgdir}"/usr/include/$_file
  done
# Install all static libraries & others
  for _file in $(ls "${srcdir}"/squirrel3/lib)
  do
     install -Dm644 lib/$_file "${pkgdir}"/usr/lib/$_file
  done

# Install docs & examples.
  for _file in $(ls "${srcdir}"/squirrel3/doc)
  do
     install -Dm644 doc/$_file "${pkgdir}"/usr/share/$pkgname/doc/$_file
  done
  for _file in $(ls "${srcdir}"/squirrel3/samples)
  do
     install -Dm644 samples/$_file "${pkgdir}"/usr/share/$pkgname/samples/$_file
  done

# Install Other docs
  install -Dm644 COPYRIGHT "${pkgdir}"/usr/share/licenses/$pkgname/COPYRIGHT
  install -Dm644 HISTORY "${pkgdir}"/usr/share/$pkgname/HISTORY
  install -Dm644 README "${pkgdir}"/usr/share/$pkgname/README
  for _file in $(ls "${srcdir}"/squirrel3/etc)
  do
     install -Dm644 etc/$_file "${pkgdir}"/usr/share/$pkgname/embebing/$_file
  done
}
