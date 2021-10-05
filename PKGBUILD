# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=ananicy-rules-git
_pkgname=ananicy
pkgver=2.2.1.r59.g831f397
pkgrel=1
pkgdesc="Rules for ananicy-cpp"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy.git"
license=('GPL3')
makedepends=('git')
source=("$_pkgname"::'git+https://github.com/Nefelim4ag/Ananicy.git#branch=master'
        "firedragon.patch")
md5sums=('SKIP'
         '721cd4f09b44c6710497278175aac018')
conflicts=(ananicy ananicy-git)
backup=('etc/ananicy.d/ananicy.conf')

prepare() {
  cd "$_pkgname"
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      echo "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgname}/"
  make install PREFIX="$pkgdir"

  rm -r "$pkgdir/lib" "$pkgdir/usr"
}
