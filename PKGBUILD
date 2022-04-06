pkgname=virtctl-git
pkgver=r53.c601cfe
pkgrel=2
arch=('any')
url="https://github.com/dehesselle/virtctl"
license=('MIT')
depends=('libvirt')
pkgdesc="virtctl is a script and framework for libvirt to integrate it with systemd."
source=(
    "$pkgname::git+https://github.com/dehesselle/virtctl.git"
    execstop_locale_fix.patch
)
md5sums=('SKIP'
         '05a41d5fa551c4285e515b106bb18601')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  patch -i ../execstop_locale_fix.patch
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/etc"

  for systemd_file in hypervisor.target virtctl@.service virtctl@.service.d; do
    cp -a $systemd_file "$pkgdir/usr/lib/systemd/system"
  done
  
  cp -a "virtctl.d" "$pkgdir/etc"
}

