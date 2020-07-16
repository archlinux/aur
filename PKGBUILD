# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
pkgname=(
   'zapret-nfqws-git'
   'zapret-tpws-git'
)
pkgbase=zapret-git
pkgver=r85.50a0668
pkgrel=2
pkgdesc="Bypass deep packet inspection."
arch=('x86_64')
url="https://github.com/bol-van/zapret"
license=('GPL')
depends=('systemd' 'ipset' 'curl')
#makedepends=()
backup=('opt/zapret/config')
provides=('zapret-git' 'zapret')
conflicts=('zapret')
source=("git+https://github.com/bol-van/zapret.git")
validpgpkeys=('916961EE198832DD70B628B356DB0538F60D951C')
md5sums=('SKIP')
pkgver()
{
   cd "$srcdir/${pkgbase%-git}"
   (  set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
   )
   pkgrel=$(git diff --shortstat|cut -d' ' -f2)
}
build()
{
    cd "$srcdir/${pkgbase%-git}"
    make
}
_package_common()
{
   for n in ip2net mdig;do
      install -Dm755 "binaries/my/$n" "$pkgdir/opt/zapret/$n/$n"
   done
   install -Dm755 ipset/* -t "$pkgdir/opt/zapret/ipset"
   install -Dm644 init.d/systemd/*  -t "$pkgdir/usr/lib/systemd/system"
   install -Dm755 init.d/sysv/*     -t "$pkgdir/opt/zapret/init.d/sysv"
   install -Dm644 config               "$pkgdir/opt/zapret/config"
}
package_zapret-nfqws-git() {
   cd "$srcdir/${pkgbase%-git}"
   _package_common
   install -Dm755 "binaries/my/nfqws" "$pkgdir/opt/zapret/nfqws/nfqws"
   # sed -ri "s/^#?\($1=\).*$/\1$M/" "$pkgdir/opt/zapret/config"
   sed -ri "s/^#?MODE=.*$/MODE=nfqws_all_desync/" "$pkgdir/opt/zapret/config"
}
package_zapret-tpws-git() {
   cd "$srcdir/${pkgbase%-git}"
   _package_common
   install -Dm755 "binaries/my/tpws" "$pkgdir/opt/zapret/tpws/tpws"
   sed -ri "s/^#?MODE=.*$/MODE=tpws_all/" "$pkgdir/opt/zapret/config"
}
