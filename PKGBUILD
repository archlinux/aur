_npmname=verdaccio
_npmver=5.29.0

pkgname=$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Private npm repository server"
arch=(any)
url="https://github.com/verdaccio/verdaccio"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz
        verdaccio.sysusers
        verdaccio.tmpfiles)
sha256sums=('d4320fe35a139a5df333206164916b7919876405ddbe9f9ee5e0d0ec816157d1'
            '75d544a5f25ca4c18743b1c879a8db0b9d9ae72ac41043a922733f19df394235'
            '833b7223a643a4e1550c8b85b23b7c9e7337c46bc9bf9daa0a0b33a627ddc990')

backup=(etc/verdaccio/config.yaml)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --registry https://registry.npmjs.org/ --prefix "$pkgdir/usr" $_npmname@$_npmver
  install -Dm644 "$srcdir"/package/systemd/verdaccio.service "$pkgdir"/usr/lib/systemd/system/verdaccio.service
  install -Dm644 "$srcdir"/package/conf/default.yaml "$pkgdir"/etc/verdaccio/config.yaml
  install -Dm644 "$srcdir"/verdaccio.sysusers "$pkgdir"/usr/lib/sysusers.d/verdaccio.conf
  install -Dm644 "$srcdir"/verdaccio.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/verdaccio.conf
}
