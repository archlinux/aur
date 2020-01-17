# Maintainer: Hao Long <aur@esd.cc>

pkgname=nali-cli
pkgver=2.0.1
pkgrel=1
pkgdesc="Parse geoinfo of IP Address without leaving your terminal"
arch=('any')
url="https://nali.skk.moe/"
license=('GPL')
depends=('nodejs')
optdepends=('bind-tools: nali-dig / nali-nslookup support'
            'iputils: nali-ping / nali-tracepath support'
            'traceroute: nali-traceroute support')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "$pkgname-$pkgver.LICENSE::https://github.com/SukkaW/nali-cli/raw/master/LICENSE")
noextract=($pkgname-$pkgver.tgz)
sha256sums=('ac25a6baefb1b02b233b8da53feaf5e2d53a939472ba2a940810659f76827d82'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 "$srcdir"/$pkgname-$pkgver.LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}