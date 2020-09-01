# Maintainer: willemw <willemw12@gmail.com>

pkgname=sickchill-git
pkgver=2020.07.09.1.r266.g319d20e55
pkgrel=1
pkgdesc="Automatic video library manager for TV shows"
arch=('any')
url="https://github.com/SickChill/SickChill"
license=('GPL3')
depends=('nodejs' 'python')
makedepends=('git' 'python-pygithub')
#            'deluge: supported torrent client'
#            'qbittorrent: supported torrent client'
#            'rtorrent: supported torrent client'
#            'sabnzbd: supported NZB downloader'
#            'transmission-cli: supported torrent client'
optdepends=('unrar: for RAR archives')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=('!strip')
install=$pkgname.install
#source=("$pkgname::git+$url.git"
source=("$pkgname::git+$url.git#branch=develop"
        'sickchill.service'
        'sickchill.sysusers'
        'sickchill.tmpfile')
md5sums=('SKIP'
         'fe1030d29e883682a9c3117867edd9d8'
         '97fb191af2e326d5aba2cf58270b4feb'
         '515f13e391105a716ef6763ba8533fc7')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#build() {
#  cd $pkgname
#  python setup.py --quiet build
#}

#check() {
#  cd $pkgname
#  python setup.py test
#}

package() {
  install -Dm644 sickchill.service "$pkgdir/usr/lib/systemd/system/sickchill.service"
  install -Dm644 sickchill.sysusers "$pkgdir/usr/lib/sysusers.d/sickchill.conf"
  install -Dm644 sickchill.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickchill.conf"

  install -dm755 "$pkgdir"/opt/sickchill/{app,data}

  # The install type is "source": .git folder is not included
  #cd $pkgname
  #python setup.py install --prefix=/opt/sickchill/app --install-lib=/opt/sickchill/app --root="$pkgdir" --optimize=1
  cp -a $pkgname/* "$pkgdir/opt/sickchill/app/"

  warning "If the upgrade fails with \"error: failed to commit transaction (conflicting files)\", then uninstall first"
}

