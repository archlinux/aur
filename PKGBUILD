# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=zapret2
pkgver=0.8.2
pkgrel=1
pkgdesc="Anti-DPI software"
arch=('x86_64')
url="https://github.com/bol-van/$pkgname"
license=('MIT')
depends=(
  'bind'  # host, nslookup
  'curl'
  'iptables'
  'libnetfilter_queue'
  'luajit'
  'nmap'  # ncat
)
optdepends=('ipset: required for iptables mode')
makedepends=('git')
backup=(
  "opt/$pkgname/config"
  "opt/$pkgname/ipset/zapret-hosts-user-exclude.txt"
  #"opt/$pkgname/ipset/zapret-hosts-user.txt"
  #"opt/$pkgname/ipset/zapret-hosts-user-ipban.txt"
  #"opt/$pkgname/ipset/zapret-ip-user.txt"
)
install=$pkgname.install
source=($pkgname::git+$url.git#tag=v$pkgver)
sha256sums=('f95679eb40ca771b78fe6f8ffdd9c20ffda08b4d2d92a8cad394e96b755be1ab')

prepare() {
  # 'KillMode=none' is a deprecated option and is not recommended for use.
  sed -i 's/KillMode=none/KillMode=mixed/g' "$srcdir"/$pkgname/init.d/systemd/zapret2.service

  cd $pkgname/ipset
  mv -f zapret-hosts-user-exclude.txt.default zapret-hosts-user-exclude.txt
  #touch zapret-hosts-user.txt
  #touch zapret-hosts-user-ipban.txt
  #touch zapret-ip-user.txt
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname

  for i in ip2net mdig; do
    install -Dm755 binaries/my/$i -t "$pkgdir"/opt/$pkgname/$i/
  done

  install -Dm755 blockcheck2.sh -t "$pkgdir"/opt/$pkgname/
  for i in custom standard; do
    install -Dm644 blockcheck2.d/$i/* -t "$pkgdir"/opt/$pkgname/blockcheck2.d/$i/
  done

  for i in fake; do
    install -Dm644 files/$i/* -t "$pkgdir"/opt/$pkgname/files/$i/
  done

  install -Dm755 ipset/*  -t "$pkgdir"/opt/$pkgname/ipset/
  install -Dm644 common/* -t "$pkgdir"/opt/$pkgname/common/
  install -Dm644 lua/*    -t "$pkgdir"/opt/$pkgname/lua/

  install -dm755 "$pkgdir"/opt/$pkgname/init.d/sysv/custom.d/
  install -Dm755 init.d/sysv/{functions,$pkgname} -t "$pkgdir"/opt/$pkgname/init.d/sysv/
  install -Dm644 init.d/systemd/*                 -t "$pkgdir"/usr/lib/systemd/system/

  install -Dm644 /dev/stdin "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf << END
u $pkgname - "$pkgname ${pkgdesc,}"
END

  install -dm755 "$pkgdir"/usr/bin
  for i in init.d/sysv/$pkgname; do
    ln -s /opt/$pkgname/$i "$pkgdir"/usr/bin/${i##*/}
  done

  sed -e '1s/$/\n\nWS_USER=$pkgname/' -i "$pkgdir"/opt/$pkgname/init.d/sysv/functions
  install -Dm644 config.default -T "$pkgdir"/opt/$pkgname/config

  for i in nfq2/nfqws2; do
    install -Dm755 binaries/my/${i##*/} -T "$pkgdir"/opt/$pkgname/$i
    ln -s /opt/$pkgname/$i "$pkgdir"/usr/bin/${i##*/}
  done

  install -Dm644 docs/*.*         -t "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 docs/LICENSE.txt -T "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
