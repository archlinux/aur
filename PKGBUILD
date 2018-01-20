# Maintainer: mattski <redmattski at gmail dot com>

_pkgname=sonospy
pkgname=$_pkgname-git
pkgver=360
pkgrel=1
pkgdesc="A music server for Sonos"
arch=('any')
url="https://github.com/henkelis/sonospy/wiki/Welcome-to-Sonospy"
license=('GPL3')
depends=('python2')
makedepends=('git')
optdepends=('lame: for converting mp2 to mp3'
            'sox: for downsampling FLAC')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
source=("$pkgname::git://github.com/henkelis/sonospy.git"
        'sonospy.service'
        'sonospy-scan.service'
        'sonospy.conf'
        'sonospy-scan.timer'
        'sonospy.sysusers'
        'sonospy.tmpfile')
backup=('etc/sonospy/sonospy.conf')
md5sums=('SKIP'
         'ba80b3b6ef03365df3cee5bc0a7d38f8'
         '407a5cc2b1d16f35aef94b0448a08083'
         '8540b7e955534c61033f8daa13461d32'
         '88de0ae42d0579e32f8df3a3fdc16694'
         '6f7306d7872d3c2e0bb6dd7b52b73171'
         'ef3a9e190911c931311e8fd9f0c6e4ef')

pkgver() {
  cd $pkgname
  git log --pretty=format: | wc -l
}

package() {
  install -Dm644 sonospy.service "$pkgdir/usr/lib/systemd/system/sonospy.service"
  install -Dm644 sonospy-scan.service "$pkgdir/usr/lib/systemd/system/sonospy-scan.service"
  install -Dm644 sonospy-scan.timer "$pkgdir/usr/lib/systemd/system/sonospy-scan.timer"
  install -Dm644 sonospy.sysusers "$pkgdir/usr/lib/sysusers.d/sonospy.conf"
  install -Dm644 sonospy.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sonospy.conf"

  mv $srcdir/sonospy-git/sonospy/scan.ini $srcdir/sonospy-git/sonospy/scan2.ini
  mv $srcdir/sonospy-git/sonospy/pycpoint.ini $srcdir/sonospy-git/sonospy/pycpoint2.ini
  install -dm755 "$pkgdir"/opt/sonospy/{app,data}
  cp -rp $pkgname/* "$pkgdir/opt/sonospy/app/"
  install -Dm644 sonospy.conf "${pkgdir}/etc/sonospy/sonospy.conf"
}
