# Maintainer: willemw <willemw12@gmail.com>

pkgname=sickchill-git
pkgver=2020.01.14.2.r0.g4dedd01fc
pkgrel=1
pkgdesc="Automatic video library manager for TV shows"
arch=('any')
url="https://github.com/SickChill/SickChill"
license=('GPL3')
makedepends=('git')
#         'deluge: supported torrent client'
#         'qbittorrent: supported torrent client'
#         'rtorrent: supported torrent client'
#         'sabnzbd: supported NZB downloader'
#         'transmission-cli: supported torrent client'
optdepends=('python2-notify: desktop notifications'
            'unrar: RAR archives')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=('!strip')
install=$pkgname.install
source=("$pkgname::git+$url.git"
        'sickchill.service'
        'sickchill.sysusers'
        'sickchill.tmpfile')
md5sums=('SKIP'
         '5f5c96bdeb4eb5665af2bcebf0ceca53'
         '97fb191af2e326d5aba2cf58270b4feb'
         '515f13e391105a716ef6763ba8533fc7')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#build() {
#  cd $pkgname
#  python2 setup.py --quiet build
#}

#check() {
#  cd $pkgname
#  python2 setup.py test
#}

package() {
  install -Dm644 sickchill.service "$pkgdir/usr/lib/systemd/system/sickchill.service"
  install -Dm644 sickchill.sysusers "$pkgdir/usr/lib/sysusers.d/sickchill.conf"
  install -Dm644 sickchill.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickchill.conf"

  install -dm755 "$pkgdir"/opt/sickchill/{app,data}

  # The install type is "source": .git folder is not included
  #cd $pkgname
  #python2 setup.py install --prefix=/opt/sickchill/app --install-lib=/opt/sickchill/app --root="$pkgdir" --optimize=1
  cp -a $pkgname/* "$pkgdir/opt/sickchill/app/"

  warning "If the upgrade fails with \"error: failed to commit transaction (conflicting files)\", then uninstall first"
}

