# Maintainer: Peter Cai <peter at typeblog dot net>
pkgname=netease-cloud-music-workarounds
pkgver=1.2.1
_pkgdate=20190428
pkgrel=1
pkgdesc="Netease Cloud Music, converted from .deb package, with some workarounds.."
arch=("x86_64")
url="https://music.163.com/"
license=('custom')
depends=()
makedepends=(live-media xosd vcdimager sdl_image libgoom2 projectm aribb25 svn)
source=(
  "https://d1.music.126.net/dmusic/netease-cloud-music_${pkgver}_amd64_ubuntu_${_pkgdate}.deb"
  "https://music.163.com/html/web2/service.html"
  "vlc-pkgbuild.patch"
  "ncm.patch"
)
md5sums=(
  '1f47c7dc3d9ce46da8099e539ee8a74d'
  'SKIP'
  'f40f0ab23b8fc14c86cc0858b70234c7'
  '02fe81a46cf611e655762cff98e2f539'
)

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

prepare() {
  cd ${srcdir}
  find packages | xargs rm -rf
  svn checkout --depth=empty svn://svn.archlinux.org/packages
  cd packages
  svn update vlc
  cd vlc/repos/extra-x86_64
  cp ${srcdir}/ncm.patch ./
  patch -p1 < ${srcdir}/vlc-pkgbuild.patch
  gpg --receive-keys 65F7C6B4206BD057A7EB73787180713BE58D1ADC
  makepkg -f
  ./pkg/vlc/usr/lib/vlc/vlc-cache-gen ./pkg/vlc/usr/lib/vlc/plugins
}

package() {
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
  cp -vrf ${srcdir}/packages/vlc/repos/extra-x86_64/pkg/vlc/usr/lib/* ${pkgdir}/opt/netease/netease-cloud-music/libs/
  rm ${pkgdir}/opt/netease/netease-cloud-music/libs/libgtk-x11-2.0.so.0
  install -D -m644 service.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
}
