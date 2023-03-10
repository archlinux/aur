# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=idlersc
pkgver=r504.g7824fd8
pkgrel=1
pkgdesc='A fork of IdleRSC for playing on OpenRSC servers'
arch=('any')
url='https://gitlab.com/open-runescape-classic/idlersc'
license=('GPL3')
depends=('jre-openjdk' 'hicolor-icon-theme')
makedepends=('git' 'gradle' 'gendesk')
_commit='7824fd8211276b34fac30d40caf7deedd79432cc'
source=(
  "$pkgname::git+https://gitlab.com/open-runescape-classic/idlersc.git#commit=$_commit"
  'idlersc.sh'
  'coleslaw_icon_512.png'
  'coleslaw_icon_256.png'
  'coleslaw_icon_128.png'
  'uranium_icon_512.png'
  'uranium_icon_256.png'
  'uranium_icon_128.png'
)
b2sums=('SKIP'
        '60646631c01804a4e4dfa7abd40b960eec642ebbcb0ff8867c07d3f89b57b0035f9d65e7997a378e095175e6b09445f3caf6683328b47652a38c1f879d9f3b15'
        '6e9005bc77036466f2e931adbcd880a704eedc89398ef0c32efc40bb5aebcad72a88479a71303bd9c496c84fce31d4f083464c4faa6df477281c5ad980aa2948'
        '7ac538f0cdde8efb76adbd1c35dd9f4a6e4d6f5a75704d745099f1b43a651a03d0e2b9b8f8f3cb7b6775dbd99c4d886ffb3ad3c1c7223922a1a31681579521d0'
        'e39fdd136683fd1c3124937d76bfebf431b6c7c705b3f08dc9b83248f99a4dbbccd491c77ea7b77ad938ddcb1e53435abb15c6863657356762acedf0d8c7b40d'
        '6962a2ccfcdb7972214a42d391e34ad9828ffbc8aeff236d99ecca7b7270b5b6b674bb9ece43ce810b2b2a6c74643fbc5dd7b03108387259b071a0a5f149b591'
        'df326a9fd71547892aa0dbed93023136a6e176e6a8bcc2e9132c792febe8d7674d57a356966f9937beffc3558af95de9475f8a36bc8a6aa9dcb493fc0310ecea'
        '57e42ba3bf4671c1d2336062efd123d6b07db0480b475fafd7debe4178223c9f497ab9fb17d0a48ace21e874e71e8854c1db04f180f3e86e811649086dbc04db')

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

  # secondary hash for map contents
  cd Map
  find . \
    -type f \
    -exec sha256sum {} + | \
    LC_ALL=C sort | \
    sha256sum | \
    cut -d ' ' -f 1 > "../Map.hash"
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
  cp -vr {Coleslaw,Uranium}Cache{,.hash} Map{,.hash} "$pkgdir/usr/share/$pkgname"

  # desktop files & icons
  for server in coleslaw uranium; do
    install -vDm644 -t "$pkgdir/usr/share/applications" "vet.rsc.IdleRSC.${server}.desktop"
    for res in 128 256 512; do
      install -vDm644 "${srcdir}/${server}_icon_${res}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vet.rsc.IdleRSC.${server}.png"
    done
  done
}
