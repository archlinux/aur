# Maintainer: Edoardo Rosa <edoardo dot rosa90 at gmail dot com>

# RegRipper
pkgname=regripper-git
pkgver=r181.4cb4ea5
pkgrel=1
pkgdesc="RegRipper is an open source forensic software used as a Windows Registry data extraction command line or GUI tool."
arch=('any')
url="https://github.com/keydet89/RegRipper2.8"
depends=('perl' 'perl-parse-registry')
makedepends=('git')
options=('!emptydirs')
source=("$pkgname::git+https://github.com/keydet89/RegRipper2.8.git"
        "patch.diff")
md5sums=('SKIP'
         'cd51371361a3377bf6af11ee1630e09e')

pkgver() {
  cd "$pkgname"
  (set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
}

build() {
  patch -o "$pkgname/regripper" "$pkgname/rip.pl" < patch.diff
  #cd "$pkgname"
  ## Remove windows perl shebang
  #tail -n +2 rip.pl > regripper
  ## Clean windows ^M new lines
  #sed -i $'s/\r$//' regripper
  ## Add your Linux perl shebang
  #sed -i "1i #!$(which perl)" regripper
  #sed -i '2i use lib qw(/usr/local/lib/rip-lib/lib/perl5/);' regripper
}

package() {
  install -p -dm 755 "$pkgdir/usr/bin/"
  install -p -m 755 "$pkgname/regripper" "$pkgdir/usr/bin/"

  install -p -dm 755 "$pkgdir/usr/share/regripper/plugins/"
  install -p -m 755 "$pkgname/plugins/"* "$pkgdir/usr/share/regripper/plugins/"
}
