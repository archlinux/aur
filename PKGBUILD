# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>

pkgname=tsar-git
_gitname=tsar
pkgver=0.136.2683d6f
pkgrel=1
pkgdesc="Taobao System Activity Reporter"
arch=('i686' 'x86_64')
url="http://tsar.taobao.org/"
license=('Apache')
depends=('glibc')
makedepends=('git')
backup=('etc/tsar/tsar.conf')
source=("git://github.com/alibaba/$_gitname.git"
	"fix_module_path.patch"
	"fix_apache_log.patch")
sha1sums=('SKIP'
          'fcb802d50a4d374b05e9453e688ea6e9e5e40d4d'
          '3ad26fcbc9bcbb886caa58e3315eb02edb65534f')

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/${_gitname}"
  patch -Np1 -i "$srcdir"/fix_module_path.patch
  patch -Np1 -i "$srcdir"/fix_apache_log.patch
  make  # --prefix=/usr Not supported, WTF
}

package() {
  cd "$srcdir/${_gitname}"

  install -d "$pkgdir"/usr/lib/tsar/modules
  cp modules/*.so "$pkgdir"/usr/lib/tsar/modules/
  
  install -Dm755 src/tsar "$pkgdir"/usr/bin/tsar

  install -Dm644 conf/tsar.conf "$pkgdir"/etc/tsar/tsar.conf
  install -Dm644 conf/tsar.logrotate "$pkgdir"/etc/logrotate.d/tsar
  install -Dm644 conf/tsar.cron "$pkgdir"/etc/cron.d/tsar

  install -Dm644 conf/tsar.8 "$pkgdir"/usr/share/man/man8/tsar.8
}
