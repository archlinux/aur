# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Ben Ruijl <benruyl at gmail>

pkgname=couchpotato-git
pkgver=2.6.1.r1261.g6f36f917
pkgrel=1
pkgdesc="Automatic Movie Downloading via NZBs & Torrents"
arch=('any')
url="https://couchpota.to/"
license=('GPL3')
makedepends=('git')
#depends=('python2-lxml' 'python2-pyopenssl')
optdepends=('python2-lxml: for better/faster web scraping' 
            'python2-pyopenssl: for better requests validation'
            'unrar: for rar files' 
            'unzip: for zip files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=('couchpotato.service'
        'couchpotato.sysusers'
        "$pkgname::git+https://github.com/CouchPotato/CouchPotatoServer.git#branch=develop")
md5sums=('f03b752e2a46030a9cafa38385f3d0df'
         '1b826a61b26b5ec098b720bac02f4232'
         'SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's|^build/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  sed -i "s/^BRANCH.*/BRANCH = 'develop'/" version.py

  # Disable updater
  sed -i 's/\(.*\)\(def doUpdate(self):\)/\1\2\n\1    return False/g' couchpotato/core/_base/updater/main.py
  find . -name \*.js | while read FILE; do
    sed -i 's/No updates available/The updater is not available on a non-master branch/g' "$FILE"
  done
}

package() {
  install -Dm644 couchpotato.service "$pkgdir/usr/lib/systemd/system/couchpotato.service"
  install -Dm644 couchpotato.sysusers "$pkgdir/usr/lib/sysusers.d/couchpotato.conf"

  install -dm755 "$pkgdir/opt/couchpotato/data"

  cd $pkgname

  # A "source" install does not include the .git folder
  install -dm755  "$pkgdir/opt/couchpotato/app"
  cp -a * "$pkgdir/opt/couchpotato/app"
}

