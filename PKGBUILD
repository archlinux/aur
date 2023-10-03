# Maintainer: xiota / aur.chaotic.cx

if [ x"$SRCDEST" == "x" ] ; then
  : ${YARN_CACHE_FOLDER:=$startdir/yarn}
else
  : ${YARN_CACHE_FOLDER:=$SRCDEST/yarn}
fi

_pkgname="vdhcoapp"
pkgname="$_pkgname-git"
pkgver=1.6.3.r36.gedad10d
pkgrel=2
pkgdesc="Companion application for Video DownloadHelper browser add-on"
arch=('x86_64')
url="https://github.com/aclap-dev/vdhcoapp"
license=('GPL2')
depends=()
makedepends=(
  'gulp'
  'nodejs'
  'npm'
  'yq'
)

options=(!strip)

source=(
  "vdhcoapp-install.hook"
  "vdhcoapp-remove.hook"
)
sha256sums=(
  'cd9b85b365f4ba005d382475655a9bb8a59c3d6f23bf490e64dba9f73aae65e0'
  '5e256cccaf7a6dff80807b3fdf93f93bce986e3336fc76ea2e67bd4b37c1f98a'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  makedepends+=('git')

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  _commit='edad10ddb80dc7e0c9312eb079531a40dd6246db'

  source+=(
    "$_pkgsrc"::"git+$url#commit=$_commit"
    "vdhcoapp-fix-paths.patch"
  )
  sha256sums+=(
    'SKIP'
    '83c1e4807232cde3200db85fe31374a327cf6e8f0648f309fd7e560e008b3e6d'
  )

  pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  }
fi


prepare() {
  cd "$srcdir/$_pkgsrc"

  for patch in "$srcdir"/*.patch ; do
    if [ -f "$patch" ] ; then
      printf 'Applying patch: %s\n' "${patch##*/}"
      patch -Np1 -F100 -i "$patch"
    fi
  done
}

build() {
  cd "$srcdir/$_pkgsrc"

  npm install

  gulp
}

package() {
  depends+=('ffmpeg')

  cd "$srcdir/$_pkgsrc"

  install -Dm755 bin/net.downloadhelper.coapp-* "$pkgdir/usr/bin/vdhcoapp"
  install -Dm644 config.json "$pkgdir/usr/share/vdhcoapp/config.json"

  install -dm755 "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/opt/chrome/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/chromium/native-messaging-hosts/"

  install -Dm644 "$srcdir/vdhcoapp-install.hook" "$pkgdir/usr/share/libalpm/hooks/vdhcoapp-install.hook"
  install -Dm644 "$srcdir/vdhcoapp-remove.hook" "$pkgdir/usr/share/libalpm/hooks/vdhcoapp-remove.hook"
}
