# Maintainer: Reese Wang <thuwrx10 at gmail dotcom>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Peter Cai <peter at typeblog dot net>

pkgname=udp2raw-tunnel-git
pkgver=r709.b98a467
pkgrel=1
pkgdesc='An Encrypted, Anti-Replay, Multiplexed UdP Tunnel, tunnels udp traffic through fake-tcp or icmp by using raw socket'
url='https://github.com/wangyu-/udp2raw-tunnel'
arch=('x86_64')
depends=('iptables' 'libpcap')
conflicts=('udp2raw-tunnel')
license=('MIT')
install=udp2raw-tunnel.install
source=("${pkgname%-*}::git://github.com/wangyu-/udp2raw-tunnel.git#branch=unified"
        "udp2raw_script.sh"
        "udp2raw@.service")
sha512sums=('SKIP'
            'bd58325188f7a4d143d97ea6dfb0b8f2f86f6b82b8cb7496478fb3a9c425d42044db91bd7f554ed95443ce11bad288d48aad1f76404e3efec68ecbff8c56820f'
            'f1e2831c02163646c26601896a617e07704dc1b6324fc73f4ea576959bd33d70425472d42333ad8b7f210bd8761a83bf08db40987b016067f01590703982ae42')

pkgver() {
	cd "${srcdir}/${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	echo "const char *gitversion = \"`(git rev-parse HEAD)`\";" > git_version.h
	g++ -o udp2raw_linux -I. main.cpp lib/md5.cpp lib/pbkdf2-sha1.cpp lib/pbkdf2-sha256.cpp encrypt.cpp log.cpp network.cpp common.cpp  connection.cpp misc.cpp fd_manager.cpp client.cpp server.cpp -lpthread lib/aes_faster_c/aes.cpp lib/aes_faster_c/wrapper.cpp my_ev.cpp -isystem libev -lpcap -std=c++11 -Wall -Wextra -Wno-unused-variable -Wno-unused-parameter -Wno-missing-field-initializers -lrt -O2 -DUDP2RAW_MP
}

package() {
  cd "${srcdir}/${pkgname%-*}"
  install -Dm755 udp2raw_linux "$pkgdir"/usr/bin/udp2raw
  install -Dm644 example.conf "$pkgdir"/etc/udp2raw/example.conf
  install -Dm755 "$srcdir"/udp2raw_script.sh "$pkgdir"/usr/lib/udp2raw/udp2raw_script.sh
  install -Dm644 "$srcdir"/udp2raw@.service "$pkgdir"/usr/lib/systemd/system/udp2raw@.service
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
