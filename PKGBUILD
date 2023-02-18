# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: git

pkgname=(
   zapret-{nfqws,tpws,common,docs}-git
)
pkgbase=zapret-git
pkgver=48.r60.dcd3cc9
pkgrel=1
pkgdesc="Bypass deep packet inspection."
arch=('x86_64')
url="https://github.com/bol-van/zapret"
license=('MIT')
depends=('systemd' 'ipset' 'curl' 'iptables')
makedepends=('libnetfilter_queue' 'git')
provides=("zapret=$pkgver" "zapret-git=$pkgver")
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
      read -r sha ver < <(
         NL=$(awk '/^v[[:digit:]]+/{n=NR}END{print n}' docs/changes.txt)

         git blame master docs/changes.txt \
            | awk -v NL=$NL 'NR == NL {print $1" "$NF }' \
            | sed -E 's/ v([[:digit:]]+)/ \1/'
      )
      git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "%s.%s" \
         "${ver:+$ver.}r$(git rev-list --count ${sha:+$sha~..}HEAD)" \
         "$(git rev-parse --short HEAD)"
   ) | tr -s '[:space:]:\\-' '.'
   pkgrel=$(git diff --shortstat|cut -d' ' -f2)
}

build()
{
    cd "$srcdir/${pkgbase%-git}"
    make
}

_symlink() {
   mkdir -pm755 "$pkgdir/usr/bin"
   ln -s "/opt/zapret/$1" "$pkgdir/usr/bin/${1##*/}"
}

_set_config() {
   local _cfg="$pkgdir/opt/zapret/config.${1%/*}" _key="${1##*/}" _val="$2"
   if grep -q "^#$_key=" "$_cfg";then
      sed -i "/^#$_key/s/#//" "$_cfg"
   fi
   sed -i "/^$_key=/c\\$_key=$(printf '%q' "$_val")" "$_cfg"
}

package_zapret-common-git()
{
   depends=('systemd' 'ipset' 'curl' 'iptables' "zapret-git=$pkgver")
   provides=("zapret-common=$pkgver")
   conflicts=('zapret-common')

   cd "$srcdir/${pkgbase%-git}"

   for n in ip2net mdig;do
      install -Dm755 "binaries/my/$n" "$pkgdir/opt/zapret/$n/$n"
   done
   install -Dm644 init.d/systemd/*  -t "$pkgdir/usr/lib/systemd/system"
   install -Dm755 init.d/sysv/*     -t "$pkgdir/opt/zapret/init.d/sysv"
   install -Dm755 ipset/*           -t "$pkgdir/opt/zapret/ipset"
   install -Dm644 common/*          -t "$pkgdir/opt/zapret/common"
   install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/zapret.conf"
   install -Dm644 docs/LICENSE.txt        "$pkgdir/usr/share/licenses/${pkgbase%-git}/LICENSE"
   install -Dm644 docs/LICENSE.txt        "$pkgdir/usr/share/doc/${pkgbase%-git}/LICENSE"
   install -Dm644 docs/changes.txt        "$pkgdir/usr/share/doc/${pkgbase%-git}/CHANGELOG"

   sed -i '1s/$/\n\nWS_USER=zapret/' "$pkgdir/opt/zapret/init.d/sysv/functions"
   _symlink init.d/sysv/zapret
}

package_zapret-nfqws-git() {

   depends=('libnetfilter_queue' "zapret-common-git=$pkgver")
   provides+=("zapret-nfqws=$pkgver")
   conflicts+=('zapret-nfqws')
   backup=("${makepkg_program_name+/}opt/zapret/config.nfqws")


   cd "$srcdir/${pkgbase%-git}"

   install -Dm644 config              "$pkgdir/opt/zapret/config.nfqws"
   install -Dm755 "binaries/my/nfqws" "$pkgdir/opt/zapret/nfq/nfqws"
   install -Dm644 docs/LICENSE.txt    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   ln -s config.nfqws "$pkgdir/opt/zapret/config"

   _symlink nfq/nfqws

   _set_config nfqws/FWTYPE iptables
   _set_config nfqws/MODE nfqws
   _set_config nfqws/MODE_HTTP_KEEPALIVE 1
   _set_config nfqws/MODE_HTTPS 1
   _set_config nfqws/MODE_HTTP 1
}

package_zapret-tpws-git() {
   depends=("zapret-common-git=$pkgver")
   provides+=("zapret-tpws=$pkgver")
   conflicts+=('zapret-tpws')
   backup=("${makepkg_program_name+/}opt/zapret/config.tpws")

   cd "$srcdir/${pkgbase%-git}"

   install -Dm644 config             "$pkgdir/opt/zapret/config.tpws"
   install -Dm755 "binaries/my/tpws" "$pkgdir/opt/zapret/tpws/tpws"
   install -Dm644 docs/LICENSE.txt    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   ln -s config.tpws "$pkgdir/opt/zapret/config"

   _symlink tpws/tpws

   _set_config tpws/FWTYPE iptables
   _set_config tpws/MODE tpws
   _set_config tpws/MODE_HTTP_KEEPALIVE 1
   _set_config tpws/MODE_HTTPS 1
   _set_config tpws/MODE_HTTP 1
}

package_zapret-docs-git() {
   unset depends
   provides=("zapret-docs=$pkgver")
   conflicts=('zapret-docs')

   cd "$srcdir/${pkgbase%-git}"
   install -Dm644 docs/*.*          -t "$pkgdir/usr/share/docs/${pkgbase%-git}"
   install -Dm644 docs/LICENSE.txt     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

   _rm() {
      rm -rf "$pkgdir/usr/share/docs/${pkgbase%-git}/$1"
   }
   _rm LICENSE.txt
   _rm changes.txt
}
