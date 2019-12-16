# Maintainer: Peter Cai <peter at typeblog dot net>
pkgname=netease-cloud-music
pkgver=1.2.1
_pkgdate=20190428
pkgrel=1
pkgdesc="Netease Cloud Music, converted from .deb package"
arch=("x86_64")
url="http://music.163.com/"
license=('custom')
depends=()
source=("http://music.163.com/html/web2/service.html")
md5sums=('SKIP')

prepare() {
  # Download in prepare to add User-Agent header.
  cd "$srcdir"
  source_uri="http://d1.music.126.net/dmusic/netease-cloud-music_${pkgver}_amd64_ubuntu_${_pkgdate}.deb"
  file_uri="$pkgname-$pkgver.orig.deb"
  md5checksum='1f47c7dc3d9ce46da8099e539ee8a74d'
  user_agent='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.56 Safari/536.5'
  [ ! -f "$file_uri" ] && curl -H "User-Agent: $user_agent" "$source_uri" -o "$file_uri"
  mkdir -p "$pkgname"
  bsdtar -x -C "$pkgname" -f "$file_uri"
  cd "$pkgname"
  mkdir -p data
  bsdtar -x -C data -f data.tar.xz
}

package() {
  cd "$srcdir/$pkgname/data"
  cp -rfp {opt,usr} "$pkgdir/"
  install -D -m644 "$srcdir/service.html" ${pkgdir}/usr/share/licenses/$pkgname/license.html
}
