# Maintainer: Ildus Kurbangaliev <i.kurbangaliev@gmail.com>

pkgname=verible-bin
pkgver=0.0.3247
pkgrel=1
pkgdesc='SystemVerilog parser, linter, formatter and etc from Google'
arch=('x86_64' 'aarch64')
url='https://github.com/google/verible'
license=('Apache License 2.0')
provides=('verible')
makedepends=('jq' 'wget')

source=("https://api.github.com/repos/chipsalliance/verible/releases/latest")
sha512sums=('SKIP')

prepare() {
  cat latest \
	| jq '.assets' \
	| grep -i --color=never browser_download_url \
	| grep -i --color=never centos \
	| grep -i --color=never "${CARCH}" \
	| awk '{print $2}' \
	| xargs wget -O - \
	| tar -xz
}

pkgver() {
  cat latest | jq '.tag_name' | grep -Eo '([0-9\.]+\-[0-9]+)' | tr '\-' '.'
}

package() {
  part=$(cat latest | jq '.tag_name' | grep -Eo '[^"]+')
  cd $srcdir/verible-${part}
  mkdir -p $pkgdir/usr/

  cp -R bin $pkgdir/usr/
  cp -R share $pkgdir/usr/
}
