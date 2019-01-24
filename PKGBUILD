_pkgbase=virtctl-git
pkgname=virtctl-git
pkgver=r22.07354f1
pkgrel=5
arch=('any')
url="https://github.com/dehesselle/virtctl"
license=('MIT')
depends=('libvirt')
source=(
    "$pkgname::git+https://github.com/dehesselle/virtctl.git"
    'fix_usr_local_virtctl.patch'
    'fix_usr_local_kvm_service.patch'
    'virtctl_create_domain_symlinks'
)
md5sums=('SKIP'
         '03f443ffa18dc0529b5c2fc555bb2fee'
         'a05241fc5cc736a3d15164a2438dbdb1'
         'daaf947f2e9687c532984e747a136371')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  
  patch -p1 -i "$srcdir/fix_usr_local_virtctl.patch"
  patch -p1 -i "$srcdir/fix_usr_local_kvm_service.patch"
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/etc/virtctl"

  for systemd_file in hypervisor.target kvm@.service; do
    cp -a $systemd_file "$pkgdir/usr/lib/systemd/system"
  done

  for script in start_post stop_post virtctl; do
    cp -a $script "$pkgdir/usr/bin"
  done

  cp "$srcdir/virtctl_create_domain_symlinks" "$pkgdir/usr/bin"

  cp -a virtctl.conf "$pkgdir/etc/virtctl"
}

install='virtctl-git.install'
