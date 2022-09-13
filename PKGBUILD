# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pokete
pkgver=0.9.0
pkgrel=1
pkgdesc='A terminal based Pokemon like game'
url='https://lxgr-linux.github.io/pokete'
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=('python' 'python-scrap_engine' 'alsa-lib')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lxgr-linux/pokete/archive/refs/tags/$pkgver.tar.gz"
        0001-archlinux-Use-standard-path-for-libplaysound.so-load.patch)
sha256sums=('2dea912827481f5bde1ba608aa73dea5466a4ada618b0946c1e7fe0f24162ac3'
            'bf57c5c6e58ab17df630640eacea67541b88dae3f7b0d8f1c690536e676ff501')
b2sums=('998fff27f2675c6b99ebf3864b1c8b295d11ce6b771689679acecdb5b521abef444fcb9c65f8037e859c88b853265e27952bf98e801fe47aa2f6b0057b960700'
        '122f19cd439966d2d16287c67fdb27580cd1b432aca9787da84c83b1f943f6010662f10262a1d456004055ab98a06a20282fd565bf836d12460924908376b876')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-archlinux-Use-standard-path-for-libplaysound.so-load.patch"
}

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
  install -Dm0755 -t "$pkgdir/usr/lib/pokete" playsound/libplaysound.so

  install -dm0755 "$pkgdir/usr/bin"
  ln -sf /usr/share/pokete/pokete.py "$pkgdir/usr/bin/pokete"

  install -Dm0644 -t "$pkgdir/usr/share/applications" assets/pokete.desktop

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
