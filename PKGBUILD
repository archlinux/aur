# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pokete
pkgver=0.8.2
pkgrel=2
pkgdesc='A terminal based Pokemon like game'
url='https://lxgr-linux.github.io/pokete'
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=('python' 'python-scrap_engine' 'alsa-lib')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lxgr-linux/pokete/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1ee304143d25e68748be6f2c1dcea136372bdbc5279f376ae23710fc3e7decb')
b2sums=('42b34f0040cf8fffad04d993eed61693da85a3fdc26d1e2422607362f52d9d6e3bd9cda13fc4d76d3df9a25273a6105e8b958a57d1536afd1ec0e5baddb9c699')

build() {
  cd "$pkgname-$pkgver"

  python gen_wiki.py
  rm -rf pokete_{classes,data}/__pycache__

  python -O -m compileall pokete_classes pokete_data

  cd playsound
  echo ":: Building sound module..."

  go build \
    -trimpath -buildmode=c-shared \
    -mod=readonly -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o ./libplaysound.so
}

package() {
  cd "$pkgname-$pkgver"

  install -dm0755 "$pkgdir/usr/share/pokete"
  cp -r -t "$pkgdir/usr/share/pokete" \
    assets pokete_classes pokete_data mods \
    pokete.py pokete_general_use_fns.py release.py \
    Changelog.md wiki.md

  install -Dm0644 -t "$pkgdir/usr/share/pokete/playsound" playsound/__init__.py
  install -Dm0755 -t "$pkgdir/usr/share/pokete/playsound" playsound/libplaysound.so

  install -dm0755 "$pkgdir/usr/bin"
  ln -sf /usr/share/pokete/pokete.py "$pkgdir/usr/bin/pokete"

  install -Dm0644 -t "$pkgdir/usr/share/applications" assets/pokete.desktop

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
