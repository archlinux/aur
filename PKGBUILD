# Maintainer: Grant Handy <grantshandy AT gmail DOT com>

_pkgname='ipmap'
pkgname=${_pkgname}-git
pkgver=0.1.7.r10.gf35da86
pkgrel=1
pkgdesc="An interactive map that shows connected IP addresses"
arch=('x86_64')
url="https://skylinecc.github.io/ipmap/"
license=('GPL')
depends=('glibc' 'libpcap' 'webkit2gtk' 'polkit')
makedepends=('rust' 'gzip' 'git')
source=("${_pkgname}::git+https://github.com/skylinecc/ipmap.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  cargo build --release
}

package() {
  cd "$srcdir/${_pkgname}"

  # Install policy file
  install -D -m0644 data/org.freedesktop.policykit.${_pkgname}.policy \
      "${pkgdir}"/usr/share/polkit-1/actions/org.freedesktop.policykit.${_pkgname}.policy

  # Binary
  install -Dm755 target/release/$_pkgname $pkgdir/usr/bin/$_pkgname

  # Man Page
  install -g 0 -o 0 -Dm644 data/ipmap.1 $pkgdir/usr/share/man/man1/${_pkgname}.1
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  # Icons
  for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
      echo copying icon ${i}
      install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$i/apps/${_pkgname}.png" "data/icons/ipmap-${i}.png"
  done

  install -Dm0644 "data/icons/ipmap-128x128.png" "$pkgdir/usr/share/pixmaps/ipmap.png"

  # Desktop file
  install -Dm0644 -t "$pkgdir/usr/share/applications" "data/ipmap.desktop"

}
