# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

# TODO PhantomJS from repo?!

pkgbase=riot
pkgname=(riot-desktop)  # riot-web will be added soon(tm)
pkgver=0.9.6
pkgrel=1
pkgdesc="A glossy Matrix collaboration client for the desktop."
arch=("any")
license=("Apache")
source=("$pkgbase::git+https://github.com/vector-im/riot-web.git#tag=v$pkgver"
        "Riot.desktop"
        "riot-web.sh"
        "riot.svg"
        "riot.png")
validpgpkeys=('6FEB6F83D48B93547E7DFEDEE019645248E8F4A1')  # riot.im (Debian signing key)
url="https://riot.im/"
makedepends=("git" "npm")
depends=("electron")
#replaces=('vector-web')  # @vith
replaces=('riot-web')
sha512sums=('SKIP'
            '103e08dd228967f75bf7f7a84d8764afdc7e88b3eb8d833e909ee8ca56bed3c451b7297c733de1459f37f1d9f50a3f9859879298ebfe92befe44c0785be7903c'
            '48ec620b07fc57de790abdb1f01048825fa7864d22d3f3494055b3919538868ac9c48048d94ad1655f93da595cc1a06a625170aa070979f98a9d39b5ded34cae'
            'bf88f617f7327b73e10d452c4f316f39e999874c25c6eac124036a28508c9ecadcc15e9540c4297903f1bac88cc580c48f69220c455369a8a21eef688071966b'
            '9bc5c155384bb6d17c9007e9fb17c644db0b86e7c4ca03396d845bdc2916ddf906570bdeca9133d6f09e6920531e742aed31738b4ad77196fdd48e54784d50cf')

_validate_tag() {
  local success fingerprint trusted status tag=v$pkgver

  parse_gpg_statusfile /dev/stdin < <(git verify-tag --raw "$tag" 2>&1)

  if (( ! success )); then
    error 'failed to validate tag %s\n' "$tag"
    return 1
  fi

  if ! in_array "$fingerprint" "${validpgpkeys[@]}" && (( ! trusted )); then
    error 'unknown or untrusted public key: %s\n' "$fingerprint"
    return 1
  fi

  case $status in
    'expired')
      warning 'the signature has expired'
      ;;
    'expiredkey')
      warning 'the key has expired'
      ;;
  esac

  return 0
}

prepare() {
  cd $srcdir/$pkgbase
  _validate_tag || return

  if [ -d $srcdir/$pkgbase/webapp/ ]; then
    rm -rf $srcdir/$pkgbase/webapp/ # The bundle.*.js.map files in this directory accumulate with new versions, so delete the folder.
  fi
}

build() {
  cd $srcdir/$pkgbase
  npm install
  npm run build
}

package() {
  cd $srcdir/$pkgbase
  mkdir -p $pkgdir/usr/lib/$pkgname/{webapp,electron}

  cp $srcdir/$pkgbase/package.json $pkgdir/usr/lib/$pkgname/
  cp -r $srcdir/$pkgbase/webapp/* $pkgdir/usr/lib/$pkgname/webapp/
  cp -r $srcdir/$pkgbase/electron/* $pkgdir/usr/lib/$pkgname/electron/

  install -Dm644 $srcdir/Riot.desktop $pkgdir/usr/share/applications/Riot.desktop
  install -Dm755 $srcdir/riot-web.sh $pkgdir/usr/bin/riot-web

  install -Dm644 $srcdir/riot.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/riot.svg
  install -Dm644 $srcdir/riot.png $pkgdir/usr/share/pixmaps/riot.png
}

# vim:set ts=2 sw=2 et:
