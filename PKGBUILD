# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=idlersc
pkgver=r474.g8d7473b
pkgrel=2
pkgdesc='A fork of IdleRSC for playing on OpenRSC servers'
arch=('any')
url='https://gitlab.com/open-runescape-classic/idlersc'
license=('GPL3')
depends=('jre-openjdk')
makedepends=('git' 'gradle' 'gendesk')
_commit='8d7473b4365e1e2ea8c434991ca21196b3021e20'
source=(
  "$pkgname::git+https://gitlab.com/open-runescape-classic/idlersc.git#commit=$_commit"
  'idlersc.sh'
  'ftbfs-gradle.patch'
)
b2sums=('SKIP'
        'f0704e5e5897de6b9124eec1c1e8ed09f34bf0210486b2967faf6c78afa2dc979676300af4cbc19e7ed55cf8362a126c422865fb3ffa7c8bb80863d5d144af36'
        '33ff64e2e90ca279e0114444ee0b00ad2d669ecf4f68c952e07283242a0f18cec6f21be1ffaced286bfee72f7181eaf411f31f2c8216bc5168adaa413c292a2f')

pkgver() {
  cd "$pkgname"

  local rev_count=$(git rev-list --count HEAD)
  local rev_parse=$(git rev-parse --short HEAD)

  printf "r%s.g%s" "$rev_count" "$rev_parse"
}

prepare() {
  cd "$pkgname"

  # fix FTBFS on newer version of Java
  patch -p1 -i "$srcdir/ftbfs-gradle.patch"

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
  
  # desktop files
  install -vDm644 -t "$pkgdir/usr/share/applications" ./*.desktop
}
