# Maintainer: willemw <willemw12@gmail.com>

_pkgname=sickchill
pkgname=$_pkgname-git
pkgver=2018.10.27.2.r1.g4f7a2a56d
pkgrel=1
pkgdesc="Automatic video library manager for TV shows"
arch=('any')
url="https://github.com/SickChill/SickChill"
license=('GPL3')
#'python2-vcr' 'unrar'
makedepends=('git')
depends=('nodejs' 'python2-babel' 'python2-cheetah' 'python2-mako')
#         'deluge: supported torrent client'
#         'qbittorrent: supported torrent client'
#         'rtorrent: supported torrent client'
#         'sabnzbd: supported NZB downloader'
#         'transmission-cli: supported torrent client'
optdepends=('python2-notify: desktop notifications'
            'unrar: RAR archives')
provides=($_pkgname 'sickrage')
conflicts=($_pkgname 'sickrage')
options=('!strip')
install=$pkgname.install
source=("$pkgname::git+https://github.com/SickChill/SickChill.git"
        'sickchill.service'
        'sickchill.sysusers'
        'sickchill.tmpfile')
md5sums=('SKIP'
         'fd497f3e93f4920f39714be53b0f8809'
         '97fb191af2e326d5aba2cf58270b4feb'
         '515f13e391105a716ef6763ba8533fc7')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#  cd $pkgname
#  sed -i 's/UnRAR2/unrar2/g' lib/unrar2/test_UnRAR2.py
#}

#build() {
#  cd $pkgname
#  python2 setup.py --quiet build
#}

#check() {
#  cd $pkgname
#  python2 setup.py test
#
#  cd lib/unrar2
#  PYTHONPATH="$(pwd)/..:$PYTHONPATH" python2 test_UnRAR2.py
#}

package() {
  install -Dm644 sickchill.service "$pkgdir/usr/lib/systemd/system/sickchill.service"
  install -Dm644 sickchill.sysusers "$pkgdir/usr/lib/sysusers.d/sickchill.conf"
  install -Dm644 sickchill.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickchill.conf"

  install -dm755 "$pkgdir"/opt/sickchill/{app,data}

  # The install type is "source": .git folder is not included
  #cd $pkgname
  #python2 setup.py install --prefix=/opt/sickchill/app --install-lib=/opt/sickchill/app --root="$pkgdir" --optimize=1
  cp -rp $pkgname/* "$pkgdir/opt/sickchill/app/"

  warning "If the upgrade fails with \"error: failed to commit transaction (conflicting files)\", then uninstall first"
}

