# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pokete
pkgver=0.9.1
pkgrel=1
pkgdesc='A terminal based Pokemon like game'
url='https://lxgr-linux.github.io/pokete'
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=('python' 'python-scrap_engine' 'alsa-lib')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lxgr-linux/pokete/archive/refs/tags/$pkgver.tar.gz"
        0001-archlinux-Use-standard-path-for-libplaysound.so-load.patch)
sha256sums=('302d51385f4a0f2fedc0d0368a49d5aa7020ad80cae47a69fde5919ebcb974fb'
            'f31450329ce84f9cafefec1aee87a48490c55c0ca788d60719b0b7b3e9567824')
b2sums=('029aebe9ed2c86f8b6ed740f83bbd6cf9b61a02e3e81c54ffd43709c0fbccb22e4c79013149b10e55d5f32ea7d53aee001ffe607e9a95ed48a5a9bb5ee54252a'
        '77d924d077aef11d7c852833772af1c3e01c3a6623a036638cd151e28c014a68a19ed91ad75d77b4191c50a1beab5619bc2bed6480d246ef0a42b26eae2024a2')

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
