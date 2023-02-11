# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Dan Ginovker <danielginovker@gmail.com>
# Contributor: Jae Beojkkoch <jae@jae.moe>

pkgname=openrsc-launcher
pkgver=20230208.r7483.gadc5837a1
pkgrel=2
pkgdesc='Open-source launcher for various Runescape Classic servers'
arch=('any')
url='https://rsc.vet'
license=('GPL3')
depends=('jre-openjdk' 'hicolor-icon-theme')
makedepends=('git' 'ant')
_commit='adc5837a16c098b08672e6fa97029cece54543e3'
source=(
  "$pkgname::git+https://gitlab.com/open-runescape-classic/core.git#commit=$_commit"
  'launcher.sh'
)
b2sums=('SKIP'
        'f761bdc177a80f739c777abb629e6e7ee66147914266d7505c5442fb627db57a29cbb891185ec896e39cf9afae2cdb592003f16af67fcfa421166ec84c0ec664')

pkgver() {
  cd "$pkgname"

  local commit_date=$(git show --no-patch --format=%cd --date=format:%Y%m%d)
  local rev_count=$(git rev-list --count HEAD)
  local rev_parse=$(git rev-parse --short HEAD)

  printf "%s.r%s.g%s" "$commit_date" "$rev_count" "$rev_parse"
}

build() {
  cd "$pkgname/PC_Launcher"

  ant compile
}

package() {
  cd "$pkgname/PC_Launcher"

  # wrapper script
  install -vDm755 "$srcdir/launcher.sh" "$pkgdir/usr/bin/openrsc"

  # jar applet
  install -vDm644 -t "$pkgdir/usr/share/java/$pkgname" OpenRSC.jar

  local appname="vet.rsc.OpenRSC.Launcher"

  # application icon
  install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" "$appname.svg"

  # desktop entry
  install -vDm644 -t "$pkgdir/usr/share/applications" "$appname.desktop"

  # appdata.xml
  install -vDm644 -t "$pkgdir/usr/share/appdata" "$appname.appdata.xml"
}
