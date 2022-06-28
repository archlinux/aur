# Maintainer: Whyme Lyu <callme5long@gmail.com>

# Original PKGBUILD copied from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=sunloginclient
# Credit goes to:
# yjun <jerrysteve1101 at gmail dot com>
# zhullyb <zhullyb at outlook dot com>

pkgname=sunloginremote
pkgver=5.5.0.45114
pkgrel=1
pkgdesc='Proprietary software that remotely controls mobile devices, Windows, Mac, Linux and other systems. Enterprise edition.'
arch=(x86_64)
url='https://sunlogin.oray.com/product/support'
depends=(
  libappindicator-gtk3
  sh
  wqy-zenhei
)
license=(custom)
install=$pkgname.install
source=("https://down.oray.com/sunlogin/linux/${pkgname}-${pkgver}-amd64.deb"
        shim.sh
        tmpfiles.conf
        license.html)
b2sums=('ce5e29dcf218048d78033ed8f18bb75da82a5684f8773167a82f6b118572b15a0344913c2de0b1693c61f136c066e39e68541ebfbb65769e7105552336a9fc39'
        'SKIP'
        'SKIP'
        'SKIP')

declare__root() {
  export _root="$srcdir/$pkgver-data"
}

prepare() {
  declare__root
  mkdir -p "$_root"
  tar -xf data.tar.xz -C "$_root"
}

_install() {
  find "opt/$pkgname/$1" -type f -exec \
      install -Dm$2 {} -t "${pkgdir}/opt/$pkgname/$1" \;
}

build() {
  declare__root
  pushd "$_root"

  desktop_file="usr/share/applications/$pkgname.desktop"
  test -r "$desktop_file"
  # fix path
  sed -i -e "
    s#Exec=/opt/$pkgname/bin/#Exec=/usr/bin/#
  " "$desktop_file"

  popd
}

package() {
  declare__root
  pushd "$_root"

  # bin
  _install bin 755

  _install res/skin 666
  _install res/icon 644
  mkdir -m=755 "$pkgdir/opt/$pkgname/res/font"
  ln -s ../../../../usr/share/fonts/wenquanyi/wqy-zenhei/wqy-zenhei.ttc \
    "$pkgdir/opt/$pkgname/res/font/"

  install -Dm644 "opt/$pkgname/res/DRBELL.WAV" \
    -t "$pkgdir/opt/$pkgname/res"


  # desktop entry
  install -Dm644 usr/share/applications/$pkgname.desktop \
    -t "$pkgdir/usr/share/applications"

  # icon ## TODO: use symlink instead
  install -Dm644 opt/$pkgname/res/icon/sunlogin_remote.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # # license
  # install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  popd

  install -Dm755 shim.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 license.html "$pkgdir/usr/share/licenses/sunloginremote/license.html"
}
