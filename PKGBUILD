# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=mylar-git
pkgver=r1431.3f30fae
pkgrel=1
pkgdesc="Comic book downloader for usenet and torrents"
arch=('any')
url="https://github.com/evilhero/mylar"
license=('GPL3')
depends=('python2' 'python2-setuptools')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy')

makedepends=('git')
provides=("mylar")
conflicts=("mylar")
options=(!strip)
install='mylar.install'

source=('git+https://github.com/evilhero/mylar.git'
        'mylar.service'
        'mylar.tmpfiles'
        'mylar.sysusers')

sha256sums=('SKIP'
            '42f8929aed076868512dbf285d3bc1341cba57069fde8430b5ba46536085ed5f'
            'ccd2419a83587527cbf96aa4a232ee5045915fd4eeb085999508f5a17d0745a8'
            '619a6266ad56e8363296b2ae7e2428c0f433f8c73a57d9bdf55ffba179f6c81d')

pkgver() {
  cd "${srcdir}/mylar"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/mylar"
  cp -dr --no-preserve='ownership' "${srcdir}/mylar/" "${pkgdir}/usr/lib/"
  rm -rf ${pkgdir}/usr/lib/mylar/.git
  rm -f ${pkgdir}/usr/lib/mylar/.gitignore

  install -D -m 644 "${srcdir}/mylar.service" "${pkgdir}/usr/lib/systemd/system/mylar.service"
  install -D -m 644 "${srcdir}/mylar.sysusers" "${pkgdir}/usr/lib/sysusers.d/mylar.conf"
  install -D -m 644 "${srcdir}/mylar.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mylar.conf"
}
