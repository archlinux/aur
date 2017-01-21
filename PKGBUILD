# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

# TODO PhantomJS from repo?!
# TODO Double quotes around $srcdir & $pkgdir

pkgbase=riot
pkgname=(riot-desktop riot-web)
pkgver=0.9.6
pkgrel=2
arch=("any")
license=("Apache")
source=("$pkgbase::git+https://github.com/vector-im/riot-web.git#tag=v$pkgver"
        "Riot.desktop"
        "riot-desktop.sh"
        "riot.svg"
        "riot.png")
validpgpkeys=('6FEB6F83D48B93547E7DFEDEE019645248E8F4A1')  # riot.im (Debian signing key)
url="https://riot.im/"
makedepends=("git" "npm")
depends=("electron")
sha512sums=('SKIP'
            'c2622a1fa082fdf114f0280e001c9d3b07846741a6adc434d36c32ee7b5799d7b6bea87f00fc18765a58b29bfd663f4053d7cf82ee0e58161303ac0208aed32a'
            '53d619f3aab36cbc8d7f8625302fb55fea69d4861911d92c8b30e34f9601f0e5ab797d0fd1e6f5c74b4cca10ffcd4af1a2595aaeeea25d7ebea3dada34359137'
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

package_riot-web() {
  pkgdesc="A glossy Matrix collaboration client for the web."
  replaces=('vector-web')  # @vith

  mkdir -p $pkgdir/{etc,usr/share}/webapps/$pkgname/

  cp -r $srcdir/$pkgbase/webapp/* $pkgdir/usr/share/webapps/$pkgname/
  cp $srcdir/$pkgbase/config.sample.json $pkgdir/etc/webapps/$pkgname/config.json
  ln -s /etc/webapps/$pkgname/config.json $pkgdir/usr/share/webapps/$pkgname/
}

package_riot-desktop() {
  pkgdesc="A glossy Matrix collaboration client for the desktop."
  conflicts=('riot-web')
  replaces=('riot-web')  # this will be removed in some time

  cd $srcdir/$pkgbase
  mkdir -p $pkgdir/usr/lib/$pkgname/{webapp,electron}

  cp $srcdir/$pkgbase/package.json $pkgdir/usr/lib/$pkgname/
  cp -r $srcdir/$pkgbase/webapp/* $pkgdir/usr/lib/$pkgname/webapp/
  cp -r $srcdir/$pkgbase/electron/* $pkgdir/usr/lib/$pkgname/electron/

  install -Dm644 $srcdir/Riot.desktop $pkgdir/usr/share/applications/Riot.desktop
  install -Dm755 $srcdir/riot-desktop.sh $pkgdir/usr/bin/riot-desktop

  install -Dm644 $srcdir/riot.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/riot.svg
  install -Dm644 $srcdir/riot.png $pkgdir/usr/share/pixmaps/riot.png
}

# vim:set ts=2 sw=2 et:
