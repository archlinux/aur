# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: git

pkgname=(zapret-{nfqws,tpws}-git)
pkgbase=zapret-git
pkgver=r241.9f5b44a
pkgrel=1
pkgdesc="Bypass deep packet inspection."
arch=('x86_64')
url="https://github.com/bol-van/zapret"
license=('GPL')
depends=('systemd' 'ipset' 'curl')
makedepends=('libnetfilter_queue' 'git')
backup=('opt/zapret/config')
provides=('zapret')
conflicts=('zapret')
source=(
   "zapret::git+https://github.com/bol-van/zapret.git"
   "sysusers.conf"
)
sha256sums=('SKIP'
            '25c309e2ec545c9ee53759e23961c8a3f02708a7ba8dcbabab6eb681a36c03c0')
pkgver()
{
   cd "$srcdir/${pkgbase%-git}"
   (  set -o pipefail
      git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
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
   install -Ddm755 "$pkgdir/usr/bin"
   install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/zapret.conf"
   sed -ri 's/^#?WS_USER=.*$/WS_USER=zapret/' "$pkgdir/opt/zapret/init.d/sysv/functions"
}
package_zapret-nfqws-git() {

   depends+=('libnetfilter_queue')
   cd "$srcdir/${pkgbase%-git}"
   _package_common
   install -Dm755 "binaries/my/nfqws" "$pkgdir/opt/zapret/nfq/nfqws"
   ln -s /opt/zapret/nfq/nfqws "$pkgdir/usr/bin/nfqws"
   # sed -ri "s/^#?\($1=\).*$/\1$M/" "$pkgdir/opt/zapret/config"
   sed -ri "s/^#?MODE=.*$/MODE=nfqws_all_desync/" "$pkgdir/opt/zapret/config"
}
package_zapret-tpws-git() {
   cd "$srcdir/${pkgbase%-git}"
   _package_common
   install -Dm755 "binaries/my/tpws" "$pkgdir/opt/zapret/tpws/tpws"
   ln -s /opt/zapret/nfq/tpws "$pkgdir/usr/bin/tpws"
   sed -ri "s/^#?MODE=.*$/MODE=tpws_all/" "$pkgdir/opt/zapret/config"
}
