# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ninez <triplesquarednine@gmail.com>

pkgname=tuna
epoch=1
pkgver=0.12
pkgrel=2

pkgdesc="Application tuning GUI & command line utility"
url="https://rt.wiki.kernel.org/index.php/Tuna"
arch=('any')
license=('GPL')

depends=('python2' 'python2-ethtool' 'python2-linux-procfs' 'python2-schedutils' 'python2-numpy' 'python2-matplotlib' 'pygtk' 'libglade' 'gksu')
optdepends=('python2-inet_diag')
makedepends=('git')

source=("git://git.kernel.org/pub/scm/utils/tuna/tuna.git"
        "Tuna_User_Guide.pdf::https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_MRG/1.3/pdf/Tuna_User_Guide/Red_Hat_Enterprise_MRG-1.3-Tuna_User_Guide-en-US.pdf"
        "tuna_gui_custom_icon.patch"
        "tuna.desktop"
        "tuna.png")

sha256sums=('SKIP'
            '5db7d3e3cc909ace29fddb4f3669525a3d7ad36b1ced4d8efdc3c93cae57f637'
            '04a39d28fe43def9ca872d6d2ad2c9eec58e572e89b87cc69cd684d3284b4af5'
            '26195d1a7cd48247c54ed1438c6bd4c5aad5e2b080b7fc74f63d934666007f72'
            '4c579e57495b1c00ddfdb9883cd14170b13f0d272afb3ca6a36978f10d6ed5c1')

prepare() {
  cd $pkgname
  patch -Np1 -i "${srcdir}"/tuna_gui_custom_icon.patch
  sed -i '1s/python/python2/' tuna-cmd.py
  sed -i '1s/python/python2/' oscilloscope-cmd.py
}

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --skip-build --root="$pkgdir"
  install -D -m 775 tuna-cmd.py "$pkgdir"/usr/bin/tuna
  install -m 775 oscilloscope-cmd.py "$pkgdir"/usr/bin/oscilloscope
  install -D -m 644 etc/tuna/example.conf "$pkgdir"/etc/tuna/example.conf
  install -m 644 etc/tuna.conf "$pkgdir"/etc
  install -D -m 644 $srcdir/tuna.png "$pkgdir"/usr/share/tuna/img/tuna.png
  install -D -m 644 $srcdir/Tuna_User_Guide.pdf "$pkgdir"/usr/share/tuna/docs/Tuna_User_Guide.pdf
  install -d -m 755 "$pkgdir"/usr/share/tuna/help/kthreads
  install -m 644 help/kthreads/* "$pkgdir"/usr/share/tuna/help/kthreads
  install -m 644 tuna/tuna_gui.glade "$pkgdir"/usr/share/tuna
  install -D -m 644 $srcdir/tuna.desktop "$pkgdir"/usr/share/applications/tuna.desktop
  install -D -m 644 org.tuna.policy "$pkgdir"/usr/share/polkit-1/org.tuna.policy
  install -D -m 644 docs/tuna.8 "$pkgdir"/usr/share/man/man8/tuna.8
}
# vim:set ts=2 sw=2 et:
