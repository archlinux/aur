# Maintainer: Edoardo Rosa <edoardo dot rosa90 at gmail dot com>
# Maintainer: Thadah Denyse <thadahdenyse at protonmail dot com>

# RegRipper
pkgname=regripper-git
pkgver=r100.cee174f
pkgrel=3
pkgdesc="RegRipper is an open source forensic software used as a Windows Registry data extraction command line or GUI tool."
arch=('any')
url="https://github.com/keydet89/RegRipper3.0"
depends=('perl' 'perl-parse-registry')
makedepends=('git')
options=('!emptydirs')
source=("$pkgname::git+https://github.com/keydet89/RegRipper3.0")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  (set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
}

build() {
  cd "$srcdir/$pkgname"

  # Modify the shebang line and add the plugindir variable
  if [[ -f rip.pl ]]; then
    sed -i '1s|^#! c:\\perl\\bin\\perl.exe|#!/usr/bin/perl|' rip.pl
    sed -i '/GetOptions/i my $plugindir = "/usr/share/regripper/plugins/";' rip.pl
  else
    echo "rip.pl not found!"
    return 1
  fi

  # Rename the file after patching
  mv rip.pl regripper

  ## Clean windows ^M new lines
  sed -i $'s/\r$//' regripper
}

package() {
  install -p -dm 755 "$pkgdir/usr/bin/"
  install -p -m 755 "$srcdir/$pkgname/regripper" "$pkgdir/usr/bin/"

  install -p -dm 755 "$pkgdir/usr/share/regripper/plugins/"
  install -p -m 755 "$srcdir/$pkgname/plugins/"* "$pkgdir/usr/share/regripper/plugins/"
}
