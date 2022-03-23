# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>

pkgname=tsar-git
_gitname=tsar
pkgver=0.408.0224ccb
pkgrel=2
pkgdesc="Taobao System Activity Reporter"
arch=('x86_64')
url="https://github.com/alibaba/tsar"
license=('Apache')
depends=('glibc' 'luajit' 'cron')
makedepends=('git')
backup=('etc/tsar/tsar.conf')
source=("git+https://github.com/alibaba/$_gitname.git"
        "fix_module_path.patch"
        "fix_apache_log.patch")
sha1sums=('SKIP'
          '64f0e29f56e2be08a54ecd6b1819e1c0f97e72cb'
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
