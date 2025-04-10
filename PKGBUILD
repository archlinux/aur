# Maintainer:
# Contributor: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>

_pkgname="zapret"
pkgname="$_pkgname-git"
pkgver=70.6.r7.gb12b1a5
pkgrel=2
pkgdesc="Bypass deep packet inspection"
url="https://github.com/bol-van/zapret"
license=('MIT')
arch=('x86_64')

depends=(
  'bind' # host, nslookup
  'curl'
  'ipset'
  'iptables'
  'libnetfilter_queue'
  'nmap' # ncat
  'systemd'
)
makedepends=(
  'git'
)

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

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
  local _tag _version _revision _hash
  _tag=$(git tag -l 'v[0-9]*' | grep -Ev '[A-Za-z][A-Za-z]' | sort -rV | head -1)
  _version="${_tag#v}"
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
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
