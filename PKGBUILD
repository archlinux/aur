# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=etc-update-git
_name=${pkgname%-git}
pkgver=2.3.24.r48.g15b849853
pkgrel=1
pkgdesc="CLI to interactively merge .pacnew in /etc (git version)"
url="https://wiki.gentoo.org/wiki/Handbook:X86/Portage/Tools#etc-update"
arch=('any')
license=('GPL')
depends=('bash')
makedepends=('git')
conflicts=('etc-update')
source=("$pkgname::git+https://github.com/gentoo/portage.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^portage-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -e "/Public License v2/a # Ported to Arch Linux by:\n# Kewl <xrjy@nygb.rh.bet(rot13)>
    /^OS_RELEASE_ID=/c\OS_RELEASE_ID=arch
    s/suse|opensuse/arch/
    s/'suse'/'arch'/g
    s/\.rpmnew/\.pacnew/g
    s/Gentoo's/Arch/g
    s/PROTECT='\/etc'/PROTECT='\/etc \/usr\/lib \/usr\/share\/config'/
    s/PROTECT_MASK=''/PROTECT_MASK='\/etc\/udev\/rules.d'/
    s/local file ofile /local file ofile='.pacnew' /
    s/file:10/file::-7/g" "$pkgname/bin/$_name" > "$_name"
}

package() {
  install -Dm 0755 "$_name" "$pkgdir/usr/bin/$_name"
  install -Dm 0644 "$pkgname/cnf/$_name.conf" "$pkgdir/etc/$_name.conf"
}
