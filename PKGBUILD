# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=idlersc
pkgver=r489.g6a7281f
pkgrel=1
pkgdesc='A fork of IdleRSC for playing on OpenRSC servers'
arch=('any')
url='https://gitlab.com/open-runescape-classic/idlersc'
license=('GPL3')
depends=('jre-openjdk')
makedepends=('git' 'gradle' 'gendesk')
_commit='6a7281fddb4cf2f1f6567336d9e4e8fe74170295'
source=(
  "$pkgname::git+https://gitlab.com/open-runescape-classic/idlersc.git#commit=$_commit"
  'idlersc.sh'
)
b2sums=('SKIP'
        'ef68e1b337454a325a38edae5ed9dfb0b3e3d178393221c0bc76d819fe1efc8ee1dfcc52afd6d7cc39673fb31f6c13f36e4a574d9c9f1eb9d2320fd88ba1abd5')

pkgver() {
  cd "$pkgname"

  local rev_count=$(git rev-list --count HEAD)
  local rev_parse=$(git rev-parse --short HEAD)

  printf "r%s.g%s" "$rev_count" "$rev_parse"
}

prepare() {
  cd "$pkgname"

  # file generation
  for server in coleslaw uranium; do
    # desktop files
    gendesk \
      -n \
      --pkgname "vet.rsc.IdleRSC.${server}" \
      --pkgdesc "Bot for OpenRSC (${server^})" \
      --name "IdleRSC (${server^})" \
      --exec "/usr/bin/idlersc ${server}"

    # hash for wrapper script
    pushd "${server^}Cache"
    find . \
      -type f \
      -exec sha256sum {} + | \
      LC_ALL=C sort | \
      sha256sum | \
      cut -d ' ' -f 1 > "../${server^}Cache.hash"
    popd

  done
}

build() {
  cd "$pkgname"

  # build fat jar
  gradle build
}

package() {
  cd "$pkgname"

  # wrapper script
  install -vDm755 "$srcdir/idlersc.sh" "$pkgdir/usr/bin/idlersc"

  # jar
  install -vDm644 -t "$pkgdir/usr/share/java/$pkgname" IdleRSC.jar

  # assets
  install -vd "$pkgdir/usr/share/$pkgname"
  cp -vr {Coleslaw,Uranium}Cache{,.hash} "$pkgdir/usr/share/$pkgname"

  # scripts
  install -vd "$pkgdir/usr/share/$pkgname/bin/scripting"
  cp -vr bin/scripting/{apos,idlescript,sbot} "$pkgdir/usr/share/$pkgname/bin/scripting"
  
  # desktop files
  install -vDm644 -t "$pkgdir/usr/share/applications" ./*.desktop
}
