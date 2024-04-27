# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Buce <dmbuce@gmail.com>

_name=NBT
pkgname=python-${_name,,}
pkgver=1.5.1
pkgrel=3
pkgdesc="Named Binary Tag Reader/Writer"
url="https://github.com/twoolie/$_name"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pillow')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/version-$pkgver.tar.gz"
        # https://github.com/twoolie/NBT/blob/766daa242197a12317564c1b734308d31fb22b4f/tests/downloadsample.py#L23
        "$url/files/13199373/Sample_World.tar.gz"
        '0001-Fix-support-for-Minecraft-version-1.12.2-data-versio.patch')
noextract=('Sample_World.tar.gz')
sha256sums=('8b260dc68ed91819e990ca677ee05417e259145fb7531428a1f7b948d71367dc'
            '8966c9333b69307420512c4ae57639863980b1123d621155830f75167f79a8e8'
            '4f16d8e0cdc6e29af972b52200c439e67626c4454d853f69a3001c58cec84b45')

prepare() {
  cd "$_name-version-$pkgver"

  # fix regression in 1.5.1
  patch -Np1 -i "$srcdir/0001-Fix-support-for-Minecraft-version-1.12.2-data-versio.patch"

  # Python 3.12
  sed -Ei 's/(locale\.format)/\1_string/g' examples/{chest,mob}_analysis.py
}

build() {
  cd "$_name-version-$pkgver"

  python setup.py build
}

check() {
  cd "$_name-version-$pkgver"

  # use file downloaded by `makepkg`
  ln -s "$srcdir/Sample_World.tar.gz" tests/

  python tests/alltests.py
}

package() {
  cd "$_name-version-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
