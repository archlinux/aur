# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=owntone-server
pkgver=28.1
pkgrel=1
pkgdesc="iTunes-compatible media server, originally intended as a rewrite of Firefly Media Server (mt-daapd)."
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/owntone/owntone-server"
license=('GPL')
groups=()
depends=(avahi sqlite3 ffmpeg confuse libevent mxml libunistring libplist libantlr3c libsodium protobuf-c json-c libwebsockets)
makedepends=(gperf java-runtime-headless)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=(etc/owntone.conf)
options=()
install=owntone.install
changelog=
source=(https://github.com/owntone/owntone-server/archive/$pkgver.tar.gz owntone.install http://www.antlr3.org/download/antlr-3.4-complete.jar)
noextract=()
md5sums=('630875a1f9ff350044f00a2bdf03f1dc'
         '40f2522b2727bfe55b424ff1dacef632'
         '1b91dea1c7d480b3223f7c8a9aa0e172')
sha1sums=('436cd6827544b23df7babee393254f095c779bbe'
          '4c14e0f996685f225a7b64f6d7c8e090f03a5867'
          '5cab59d859caa6598e28131d30dd2e89806db57f')
sha256sums=('b3b2c838d606c71cc30d04d09c4964fb491e4f7e11b18512946c04b02efd041e'
            'c21617a866ecd4ae1ea81b372e7ad3a782e6b6bcf3b1c03e6f0666953b1844f2'
            '9d3e866b610460664522520f73b81777b5626fb0a282a5952b9800b751550bf7')
sha384sums=('4d23808735230c275ffc22a9388a9e934ebb88591447974bc6c7319f34b9f472de89dd6201b8ac4aed30b646df98f652'
            'fb7650c4648a2492f310297462f99a9301a47ae2b4ba25d9c8fb099c80b73bd9769893a974427e650c0cffa9d9a390a9'
            'a2fbecb5fae6af12adcfb3801624d4941e25e4b526794f7b9a713ae8b6873962ca36a74f9220d7e0057aaa89d5ca6d68')
sha512sums=('063e0bf451d54515fe80c9533f31f7a1d7784d035219158ba81d185b00a922f95b359d12bf5fad7b5f79874193b03d1839263577691dd465dfb12b00951d4102'
            'd561d8a5b5920994c6a816d8c84a3ae885d7d3f27a92f6467e15f779f1859f085ea126f6932ccf5d3edf81deab2ca4f7836c5fea5503cc4d7861b2bac7f980d4'
            '04be4dfba3a21f3ab9d9e439a64958bd8e844a9f151b798383bd9e0dd6ebc416783ae7cb1d1dbb27fb7288ab9756b13b8338cdb8ceb41a10949c852ad45ab1f2')

build() {
  local OLD_PATH="$PATH"
  export PATH="$srcdir:$PATH"
  echo "#!/bin/bash" > antlr3
  local safequotedsrcdir="'${srcdir//\'/\'\\\'\'}'"
  echo "exec java -cp ${safequotedsrcdir}/antlr-3.4-complete.jar org.antlr.Tool \"\$@\"" >> antlr3
  chmod a+x ./antlr3
  cd "$srcdir/owntone-server-$pkgver"
  echo "$PATH"
  autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-itunes --enable-chromecast --enable-lastfm --with-libwebsockets --sbindir=/usr/bin LDFLAGS="-Wl,--allow-multiple-definition"
  make
  export PATH="$OLD_PATH"
}

package() {
  cd "$srcdir/owntone-server-$pkgver"

  install -D -m644 "owntone.service" "$pkgdir/usr/lib/systemd/system/owntone.service"
  make DESTDIR="$pkgdir/" install
  rmdir $pkgdir/var/run
}
