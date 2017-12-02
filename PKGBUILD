# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=dowse-git
pkgver=v0.9.r971.g0b0fc46
pkgrel=1
pkgdesc='The Awareness Hub for the Internet of Things'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/dyne/dowse'
license=('GPL')
depends=('zsh' 'hiredis' 'jemalloc' 'libltdl' 'libsodium' 'ldns' 'libnetfilter_queue' 'uuid' 'liblo' 'nmap' 'python-flask' 'python-redis' 'xmlstarlet')
makedepends=('git' 'cmake' 'wget')
conflicts=('dowse')
provides=('dowse')
backup=('etc/dowse/network.dist' 'etc/dowse/settings.dist')
source=('git+https://github.com/dyne/dowse.git'
        'git+https://github.com/dyne/zuper.git'
        'git+https://github.com/warmcat/libwebsockets.git'
        'git+https://github.com/jedisct1/dnscrypt-proxy'
        'git+https://github.com/dyne/domain-list'
        'git+https://github.com/firehol/netdata'
        'git+https://github.com/node-red/node-red.git'
        'dowse.sh' 'dowse.service' 'dowse-sysusers.conf')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '0fc748c686944f0d9432c6a5f71d3bc3'
         '112e9e1e5b0bee78abdd09dba2e7606d'
         '460d04d7632b4431b4d454326b03a9f0')

pkgver() {
  cd dowse
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd dowse
  git submodule init
  git config submodule.zuper.url "$srcdir/zuper"
  git config submodule.src/libwebsockets.url "$srcdir/libwebsockets"
  git config submodule.src/dnscrypt-proxy.url "$srcdir/dnscrypt-proxy"
  git config submodule.src/domain-list.url "$srcdir/domain-list"
  git config submodule.src/netdata.url "$srcdir/netdata"
  git config submodule.src/node-red.url "$srcdir/node-red"
  git submodule update

  sed -i 's:DOWSE_HOME =.*:DOWSE_HOME = /usr/share/dowse:' config.mk
}

build() {
  cd dowse
  unset LDFLAGS # mosquitto doesn't build with relro,now
  make PREFIX=/usr/share/dowse
}

package() {
  cd dowse
  make DESTDIR="${pkgdir}" PREFIX=/usr/share/dowse install

  chown -R 1988:1988 "${pkgdir}/usr/share/dowse"

  install -Dm0644 "${srcdir}"/dowse-sysusers.conf "${pkgdir}/usr/lib/sysusers.d/dowse.conf"
  install -d "${pkgdir}/usr/lib/systemd/system"
  install "${srcdir}/dowse.service" "${pkgdir}/usr/lib/systemd/system/"
}
