# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pokete
pkgver=0.9.2
pkgrel=1
pkgdesc='A terminal based Pokemon like game'
url='https://lxgr-linux.github.io/pokete'
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=('python' 'python-scrap_engine' 'alsa-lib')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lxgr-linux/pokete/archive/refs/tags/$pkgver.tar.gz"
        0001-archlinux-Use-standard-path-for-libplaysound.so-load.patch)
sha256sums=('19d9b7a526fdaacdc0e656407f4ccc0545f8fc6ab2beb292d15b686ec90fbc06'
            'f31450329ce84f9cafefec1aee87a48490c55c0ca788d60719b0b7b3e9567824')
b2sums=('bb3f0c5321ed1cf071206fc2d37c6b47f5ada134f804fc2ca434ebf61d9761fdb4c96c5cc473c099d7a1203a76b5c1ef660d4de88777f3f04a51ab6ff5a4353c'
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
