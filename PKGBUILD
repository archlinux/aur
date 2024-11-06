# Maintainer:
# Contributor: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>

_pkgname="zapret"
pkgname="$_pkgname-git"
pkgver=68.r27.g9e84bf7
pkgrel=2
pkgdesc="Bypass deep packet inspection"
url="https://github.com/bol-van/zapret"
license=('MIT')
arch=('x86_64')

depends=(
  'curl'
  'ipset'
  'iptables'
  'systemd'
)
makedepends=(
  'git'
  'libnetfilter_queue'
)

provides=("$_pkgname=$pkgver")
conflicts=(
  "$_pkgname"
  'zapret-common'
  'zapret-docs'
  'zapret-nfqws'
  'zapret-tpws'
)

backup=(
  "opt/zapret/config"
  "opt/zapret/config.nfqws"
  "opt/zapret/config.tpws"
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _file _hash _ver _rev
  _file="docs/changes.txt"
  read -r _hash _ver < <(
    NL=$(awk '/^v[0-9]+/{n=NR}END{print n}' "$_file")

    git blame -L "$NL,+1" -- "$_file" \
      | awk '{print $1" "$NF }' \
      | sed -E -e 's& v([0-9]+)([^0-9].*)?$& \1&'
  )
  _rev=$(git rev-list --count --cherry-pick "$_hash"...HEAD)

  printf "%s.r%s.g%s" "${_ver:?}" "${_rev:?}" "${_hash::7}"
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  depends+=(
    'libnetfilter_queue'
  )

  cd "$_pkgsrc"

  for n in ip2net mdig; do
    install -Dm755 "binaries/my/$n" "$pkgdir/opt/zapret/$n/$n"
  done

  install -Dm755 blockcheck.sh -t "$pkgdir"/opt/zapret/
  install -dm755 "$pkgdir"/opt/zapret/files
  cp --reflink=auto -a files/* "$pkgdir"/opt/zapret/files

  install -Dm644 init.d/systemd/* -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm755 init.d/sysv/{functions,zapret} -t "$pkgdir/opt/zapret/init.d/sysv/"
  install -Dm755 ipset/* -t "$pkgdir/opt/zapret/ipset/"
  install -Dm644 common/* -t "$pkgdir/opt/zapret/common/"

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/zapret.conf" << END
u zapret - "zapret dpi bypasser"
END

  install -dm755 "$pkgdir/usr/bin"
  for i in init.d/sysv/zapret; do
    ln -s "/opt/zapret/$i" "$pkgdir/usr/bin/${i##*/}"
  done

  sed -e '1s/$/\n\nWS_USER=zapret/' -i "$pkgdir/opt/zapret/init.d/sysv/functions"
  install -Dm644 config.default "$pkgdir/opt/zapret/config"

  for i in nfq/nfqws tpws/tpws; do
    install -Dm755 "binaries/my/${i##*/}" "$pkgdir/opt/zapret/$i"
    ln -s "/opt/zapret/$i" "$pkgdir/usr/bin/${i##*/}"
  done

  # docs
  install -Dm644 docs/*.* -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 docs/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
