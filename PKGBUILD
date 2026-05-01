# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=zapret2-bin
_pkgbase=${pkgname%-bin}
pkgver=0.9.5.2
pkgrel=2
pkgdesc="Anti-DPI software (prebuilt binaries)"
arch=('x86_64' 'aarch64')
url="https://github.com/bol-van/$_pkgbase"
license=('MIT')
depends=(
  'bind'     # host, nslookup
  'curl'
  'iptables'
  'nmap'     # ncat
)
optdepends=('ipset: required for iptables mode')
provides=("$_pkgbase")
conflicts=("$_pkgbase" "$_pkgbase-git")
backup=(
  "opt/$_pkgbase/config"
  "opt/$_pkgbase/ipset/zapret-hosts-user-exclude.txt"
)
install=$_pkgbase.install
options=('!strip' '!debug')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/bol-van/$_pkgbase/releases/download/v$pkgver/$_pkgbase-v$pkgver.tar.gz")
sha256sums=('4f8612fc617c9a1937ca215f85bb6d7005f5455e152a8f7f1dd666c38a080dc8')

latestver() {
    curl -fsSL "https://api.github.com/repos/bol-van/$_pkgbase/releases" |
        jq -r '.[].assets[].name' |
        grep -oP "^${_pkgbase}-v\\K[0-9.]+(?=\\.tar\\.gz\$)" |
        head -1
}

prepare() {
  cd "$_pkgbase-v$pkgver/ipset"
  mv -f zapret-hosts-user-exclude.txt.default zapret-hosts-user-exclude.txt
}

package() {
  cd "$_pkgbase-v$pkgver"

  case "${CARCH}" in
    x86_64)  _bindir=binaries/linux-x86_64 ;;
    aarch64) _bindir=binaries/linux-arm64 ;;
  esac

  for i in ip2net mdig; do
    install -Dm755 "$_bindir/$i" -t "$pkgdir/opt/$_pkgbase/binaries/${_bindir#binaries/}/"
    install -dm755 "$pkgdir/opt/$_pkgbase/$i"
    ln -s "/opt/$_pkgbase/binaries/${_bindir#binaries/}/$i" "$pkgdir/opt/$_pkgbase/$i/$i"
  done

  install -Dm755 blockcheck2.sh -t "$pkgdir/opt/$_pkgbase/"
  for i in custom standard; do
    install -Dm644 "blockcheck2.d/$i/"* -t "$pkgdir/opt/$_pkgbase/blockcheck2.d/$i/"
  done

  install -Dm644 files/fake/* -t "$pkgdir/opt/$_pkgbase/files/fake/"
  install -Dm755 ipset/*      -t "$pkgdir/opt/$_pkgbase/ipset/"
  install -Dm644 common/*     -t "$pkgdir/opt/$_pkgbase/common/"
  install -Dm644 lua/*        -t "$pkgdir/opt/$_pkgbase/lua/"

  install -dm755 "$pkgdir/opt/$_pkgbase/init.d/sysv/custom.d/"
  install -Dm755 "init.d/sysv/functions" "init.d/sysv/$_pkgbase" -t "$pkgdir/opt/$_pkgbase/init.d/sysv/"
  install -Dm644 init.d/systemd/* -t "$pkgdir/usr/lib/systemd/system/"

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$_pkgbase.conf" << END
u $_pkgbase - "$_pkgbase ${pkgdesc,}"
END

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgbase/init.d/sysv/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"

  sed -e "1s/\$/\\n\\nWS_USER=$_pkgbase/" -i "$pkgdir/opt/$_pkgbase/init.d/sysv/functions"
  install -Dm644 config.default -T "$pkgdir/opt/$_pkgbase/config"

  install -Dm755 "$_bindir/nfqws2" -t "$pkgdir/opt/$_pkgbase/binaries/${_bindir#binaries/}/"
  install -dm755 "$pkgdir/opt/$_pkgbase/nfq2"
  ln -s "/opt/$_pkgbase/binaries/${_bindir#binaries/}/nfqws2" "$pkgdir/opt/$_pkgbase/nfq2/nfqws2"
  ln -s "/opt/$_pkgbase/nfq2/nfqws2" "$pkgdir/usr/bin/nfqws2"

  install -Dm644 docs/*.* -t "$pkgdir/usr/share/doc/$_pkgbase/"
  install -Dm644 docs/LICENSE.txt -T "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
