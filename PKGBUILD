
_pkgname="vdhcoapp"
pkgname="$_pkgname-git"
pkgver=1.6.3.r2.g6ebd8ae
pkgrel=1
pkgdesc="Companion application for Video DownloadHelper browser add-on"
arch=('x86_64')
url="https://github.com/mi-g/vdhcoapp"
license=('GPL2')
depends=()
makedepends=(
  'git'
  'gulp'
  'nodejs'
  'npm'
)
provides=("$_pkgname")
conflicts=(${provides[@]})

options=(!strip)
source=(
  "$_pkgname"::"git+$url"
  "vdhcoapp-install.hook"
  "vdhcoapp-remove.hook"

  "vdhcoapp-fix-paths.patch"
  "vdhcoapp-fix-esm.patch"::"https://github.com/mi-g/vdhcoapp/pull/149.patch"
)
sha256sums=(
  'SKIP'
  'cd9b85b365f4ba005d382475655a9bb8a59c3d6f23bf490e64dba9f73aae65e0'
  '5e256cccaf7a6dff80807b3fdf93f93bce986e3336fc76ea2e67bd4b37c1f98a'

  '2ac3273ac5f1250e06ee4a4df14c63c7e60dc36a6122f6047800275dc830072e'
  '21afcc17fb2a53d1da77d1f84fc46b82ee2ba09ad327776427ec27d186b97858'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  for i in "$srcdir"/*.patch ; do
    if [ -f "$i" ] ; then
      echo "Applying patch... ${i##*/}"
      patch -N -p1 -F100 -i "$i"
    fi
  done
}

build() {
  cd "$srcdir/$_pkgname"

  npm install

  gulp
}

package() {
  depends+=('ffmpeg')

  cd "$srcdir/$_pkgname"

  install -Dm755 bin/net.downloadhelper.coapp-* "$pkgdir/usr/bin/vdhcoapp"
  install -Dm644 config.json "$pkgdir/usr/share/vdhcoapp/config.json"

  install -dm755 "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/opt/chrome/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/chromium/native-messaging-hosts/"

  install -Dm644 "$srcdir/vdhcoapp-install.hook" "$pkgdir/usr/share/libalpm/hooks/vdhcoapp-install.hook"
  install -Dm644 "$srcdir/vdhcoapp-remove.hook" "$pkgdir/usr/share/libalpm/hooks/vdhcoapp-remove.hook"
}
