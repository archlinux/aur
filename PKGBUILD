# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=valdi
pkgname="$_pkgname-git"
pkgver=r21.g0155e71
pkgrel=2
pkgdesc='A cross-platform UI framework that delivers native performance without sacrificing developer velocity'
url='https://github.com/Snapchat/Valdi'
arch=('aarch64' 'x86_64')
license=('MIT')
depends=('glibc' 'zlib' 'libxml2' 'npm' 'watchman' 'bazelisk' 'fontconfig' 'java-environment=17')
makedepends=('git-lfs')
provides=("valdi=1.0.1")
source=("${pkgname%-git}::git-lfs+$url.git" "no-hard-apt.patch")
sha256sums=('SKIP' '79d03b3c203783dd31d5a369dc7be98a2b51708da698cf01b705e6180563435c')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 < "${srcdir}/no-hard-apt.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cd "npm_modules/cli"
  npm ci --cache="$srcdir/npm-cache"
  npm pack
}

package() {
  cd "${srcdir}/${_pkgname}"
  cd "npm_modules/cli"

  npm install -g \
    --prefix="$pkgdir/usr" \
    --cache="$srcdir/npm-cache" \
    --no-audit \
    --no-fund \
    $(npm pack | tail -1)

  cd ../../
  find "$pkgdir/usr" -type d -name .cache -exec rm -rf {} +

  # Symlink libxml2.so to libxml2.so.2
  ln -s /usr/lib/libxml2.so "$pkgdir/usr/lib/libxml2.so.2"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
