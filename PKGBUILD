# Maintainer: Maksymilian Jopek <maks.aur@jopek.eu>
pkgname=portablemc
pkgver=3.3.1
pkgrel=1
pkgdesc='An easy-to-use Python CLI Minecraft launcher'
arch=('any')
url='https://github.com/mindstorm38/portablemc'
license=('GPL3-only')
depends=('python')
provides=('portablemc')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mindstorm38/portablemc/archive/refs/tags/v$pkgver.tar.gz"
        'portablemc'
        'cli.py.patch'
        'set-aur_utils.sh'
        'aur_utils.py')
sha256sums=('7f05c7a1a59d06a8669afd5650a29b14dd173c5c3eea572bae439a8b64714ae1'
        '305c41ed07f994ab2f088de698ecda60eb6a2697e647d649cfee1c655bc6a571'
        '4fbd0cd24b17bac78625221ecab5917adeca3044199e42c39d348f1020cfba6c'
        '4427b0c3c7159f298bc2b0049549237f1aadff24849ab844362b0652f60d1ee5'
        '60c6792f2869b04ad3b77ef963d359697e4d66b061cac07ee0b3c5f2165aea86')

prepare() {
  mkdir -p lib/
  mv "$pkgname-$pkgver"/src/* aur_utils.py lib/
  rm -r lib/console/ lib/workspace.py

	patch -p0 -i "$srcdir/cli.py.patch"
  ./set-aur_utils.sh

  cd lib
  ADDONS=('archives' 'fabric' 'forge' 'quilt')
  for addon in "${ADDONS[@]}"; do 
    mv "$addon/portablemc_$addon" .
    rm -r "$addon"
  done
  mv core/portablemc .
  rm -r core
}

package() {
  mkdir -p "$pkgdir/usr/lib/portablemc"
  cp -r lib/* "$pkgdir/usr/lib/portablemc"
  install -m 755 -DT portablemc "$pkgdir/usr/bin/portablemc"
}
