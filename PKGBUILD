# Maintainer: mapleafgo <mapleafgo at 163 dot com>
# Contributor: MYT1 <MYT1 at QQ com>
pkgname=mailmaster
pkgver=5.0.2.1011
epoch=2
pkgrel=5
pkgdesc="网易邮箱大师 - 高效强大的全平台邮箱客户端"
arch=('x86_64')
url="https://dashi.163.com"
license=('LicenseRef-custom')
depends=('nss' 'libsasl' 'libxcb' 'curl' 'glibc')
makedepends=('imagemagick')
provides=("$pkgname")
conflicts=('mailmaster-bin')
options=('!strip' '!debug')
install=$pkgname.install

_nssver=1.1.16-1
source=(
  "$pkgname-$pkgver.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/mailmaster/mailmaster_${pkgver}_amd64.deb"
  "libnss-wrapper_${_nssver}_amd64.deb::http://ftp.us.debian.org/debian/pool/main/n/nss-wrapper/libnss-wrapper_${_nssver}_amd64.deb"
  'gconf-stub.c'
  'mailmaster.sh'
  'mailmaster.desktop'
  'LICENSE.html::https://mail.163.com/html/agreement/doc.html'
)
noextract=(
  "$pkgname-$pkgver.deb"
  "libnss-wrapper_${_nssver}_amd64.deb"
)
sha256sums=(
  'd7c272d50798b4f0dc5279efba383e8f12decef19e434b144e07c3c26c25c58a'
  '7f1c57d82bf64e31cc5bbd2e254a460c1236ce19f847fd0079839f28ae390ad9'
  'c0fd028980bcee165184b5e20e9d8cc0a70568695006d8803fe931f4afba063b'
  '6b3f90448bdada12908df03f4fa7184871d92e867d1b63ab9caf51d364685879'
  '384a1b3d3768d4c0424bfdd9b007aecaa712aede9dd7b9b7ad1b507e8708df9d'
  'c8ddd672f5be8b2986fadf04475da64d7768480bf3ec1d5e94479b1a675b40ff'
)

prepare() {
  mkdir -p mailmaster-data nss-wrapper
  bsdtar -xOf "$pkgname-$pkgver.deb" data.tar.xz | bsdtar -x -C mailmaster-data
  bsdtar -xOf "libnss-wrapper_${_nssver}_amd64.deb" data.tar.xz | bsdtar -x -C nss-wrapper
}

build() {
  gcc -shared -fPIC -Wl,-soname,libgconf-2.so.4 -o libgconf-2.so.4 gconf-stub.c
}

package() {
  local appdir=$pkgdir/opt/mailmaster

  install -dm755 "$appdir"
  cp -a mailmaster-data/opt/mailmaster/. "$appdir/"

  install -Dm755 mailmaster.sh "$appdir/launch.sh"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/mailmaster/launch.sh "$pkgdir/usr/bin/mailmaster"
  install -Dm644 mailmaster.desktop "$pkgdir/usr/share/applications/mailmaster.desktop"

  local size
  for size in 16 32 48 64 128 256; do
    install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    magick "$appdir/logo.ico" -resize "${size}x${size}" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/mailmaster.png"
  done

  install -Dm755 nss-wrapper/usr/lib/x86_64-linux-gnu/libnss_wrapper.so \
    "$appdir/lib/libnss_wrapper.so"
  install -Dm755 libgconf-2.so.4 "$appdir/lib/libgconf-2.so.4"
  ln -s /usr/lib/libsasl2.so.3 "$appdir/lib/libsasl2.so.2"

  local f
  for f in "$appdir"/plugins/xcbglintegrations/*.so; do
    mv "$f" "$f.disabled"
  done
  mv "$appdir/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so"{,.disabled}

  chmod 4755 "$appdir/chrome-sandbox"
  install -Dm644 LICENSE.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
  install -Dm644 "$appdir/licences/cef.txt" "$pkgdir/usr/share/licenses/$pkgname/cef.txt"
}
