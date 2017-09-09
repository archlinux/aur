# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ninez <triplesquarednine@gmail.com>

pkgname=tuna
epoch=1
pkgver=0.13.1
pkgrel=1

pkgdesc="Application tuning GUI & command line utility"
url="https://rt.wiki.kernel.org/index.php/Tuna"
arch=('any')
license=('GPL')

depends=('python2' 'python2-ethtool' 'python2-linux-procfs' 'python2-schedutils' 'python2-numpy' 'python2-matplotlib' 'pygtk' 'libglade' 'gksu')
optdepends=('python2-inet_diag')
makedepends=('git')

source=("https://www.kernel.org/pub/software/utils/tuna/tuna-${pkgver}.tar.xz" 'tuna.png')
sha256sums=('552604c20d80d19f11bbfda3bafef3e14bde163cdb7e2417d9867f405583606b'
            '2f4dc206a7762380355e7bb323d508c205d493add89d67b325d5e55874486ac8')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '1s/python/python2/' tuna-cmd.py
  sed -i '1s/python/python2/' oscilloscope-cmd.py
  sed -i -e 's/gtk-preferences/tuna/g' tuna.desktop
  sed -i -e 's/Exec=tuna --gui/Exec=gksu tuna/g' tuna.desktop
}

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --skip-build --root="$pkgdir"
  install -D -m 775 tuna-cmd.py "$pkgdir"/usr/bin/tuna
  install -m 775 oscilloscope-cmd.py "$pkgdir"/usr/bin/oscilloscope
  install -D -m 644 etc/tuna/example.conf "$pkgdir"/etc/tuna/example.conf
  install -m 644 etc/tuna.conf "$pkgdir"/etc
  install -D -m 644 "$srcdir"/tuna.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/tuna.png
  install -D -m 644 docs/oscilloscope+tuna.pdf "$pkgdir"/usr/share/tuna/docs
  install -d -m 755 "$pkgdir"/usr/share/tuna/help/kthreads
  install -m 644 help/kthreads/* "$pkgdir"/usr/share/tuna/help/kthreads
  install -m 644 tuna/tuna_gui.glade "$pkgdir"/usr/share/tuna
  install -D -m 644 tuna.desktop "$pkgdir"/usr/share/applications/tuna.desktop
  install -D -m 644 org.tuna.policy "$pkgdir"/usr/share/polkit-1/org.tuna.policy
  install -D -m 644 docs/tuna.8 "$pkgdir"/usr/share/man/man8/tuna.8
}
# vim:set ts=2 sw=2 et:
