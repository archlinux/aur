# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Jean Lucas <jean@4ray.co>
# Maintainer: AI5C <ai5c@ai5c.com>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop
pkgver=5.10.5
pkgrel=1
pkgdesc='Real-time team chat based on the email threading model'
arch=(i686 x86_64)
url=https://zulipchat.com
license=(Apache)
depends=(libxkbfile gtk3 libxss nss python)
makedepends=(npm nvm)
source=($pkgname-$pkgver.tar.gz::https://github.com/zulip/$pkgname/archive/v$pkgver.tar.gz
        $pkgname.desktop)
sha512sums=('838b33a46f1f0886461edac0597e6ac802a2ffd07e548b29eabef38931ca2b4d9e772dde81dd1333a7568cae5797c3754f9fc49001345b00bdcce565c84189d0'
            '4899b20aaff5f8906de1c9d0f9b54d440e9b22cd19a8b383def92b973a8c4d954f88cee623744ec42546dc2f82d4849bcc1c49917efbea9ab346d41ac0dba589')

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm
    nvm install 19.3.0
}

build() {
  cd $pkgname-$pkgver
  _ensure_local_nvm
  npm i
  npm run pack
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a dist/linux-unpacked "$pkgdir"/usr/lib/$pkgname
  ln -s /usr/lib/$pkgname/zulip "$pkgdir"/usr/bin

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  install -Dm 644 ../$pkgname.desktop -t "$pkgdir"/usr/share/applications
  for i in 16 24 32 48 64 96 128 256 512; do
    install -Dm 644 build/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/zulip.png
  done
}
