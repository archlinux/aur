# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=openrefine-git
pkgver=20150511
pkgrel=1
pkgdesc="Data transformation powertool (formerly Google Refine)"
arch=('i686' 'x86_64')
depends=('bash' 'java-environment')
makedepends=('apache-ant' 'git')
url="https://github.com/OpenRefine/OpenRefine"
license=('custom:BSD')
options=('!strip')
source=(${pkgname%-git}::git+https://github.com/OpenRefine/OpenRefine
        openrefine.sh)
sha256sums=('SKIP'
            '86d07412ad1e76b1b0b94d0ddf5f7af6102833baee29a9daedf45be5a568e4ea')
provides=('openrefine')
conflicts=('openrefine')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  ./refine build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/openrefine/LICENSE.txt"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/openrefine"
  find . -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/openrefine" \;
  install -Dm 755 "$srcdir/openrefine.sh" "$pkgdir/usr/bin/openrefine"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
