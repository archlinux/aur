pkgname=c9.core
_pkgname=core
pkgver=3.1.3943
pkgrel=1
pkgdesc="Cloud9 Core - Part of the Cloud9 SDK for Plugin Development https://c9.io"
url="http://c9.io/"
license=('GPL2')
depends=('nodejs' 'python2')
makedepends=('git' 'npm' 'python2')
provides=('cloud9')
conflicts=('cloud9')
options=('!libtool')
arch=('any')
install=cloud9.install
source=(${pkgname}::git+https://github.com/c9/${_pkgname}.git
        cloud9.sh
        cloud9.desktop
        cloud9.png
        cloud9.service
        cloud9@.service
        cloud9.install
)
md5sums=('SKIP'
         '86f1e75f56277bc81e0f170398e42773'
         '5982f046d81679c9a248a52fd87ab93f'
         'fad2be0e1cf10d29ad98727739353626'
         '373c0a4e2b8278fd315940dd61b3a952'
         '8fbf927e0cb9af22bf15666fd993a5e1'
         'e5bd6988f4d1e76dd999c6478115af8d'
)

pkgver() {
  cd "$pkgname"
  echo $(git log |& grep auto-bump | head -n1 | awk '{print $2}')
}

build() {
  cd "$pkgname"
  scripts/install-sdk.sh
  git reset HEAD --hard
  git clean -df
}

package() {
  cd "$pkgname"
  install -dm755 $pkgdir/opt/cloud9
  cp -r * $pkgdir/opt/cloud9/
  cp -r .git $pkgdir/opt/cloud9/
  mkdir $pkgdir/opt/cloud9/.cloud9
  chown 419:419 -R $pkgdir/opt/cloud9
  install -vDm755  $srcdir/cloud9.sh $pkgdir/usr/bin/cloud9
  install -vDm644 $srcdir/cloud9.desktop $pkgdir/usr/share/applications/cloud9.desktop
  install -vDm644 $srcdir/cloud9.png $pkgdir/usr/share/pixmaps/cloud9.png
  install -Dm644 $srcdir/cloud9.service $pkgdir/usr/lib/systemd/system/cloud9.service
  install -Dm644 $srcdir/cloud9@.service $pkgdir/usr/lib/systemd/system/cloud9@.service
} 

