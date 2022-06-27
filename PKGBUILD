# Maintainer: nontlikeuname

pkgname=meson-git
pkgver=0.63.0rc1.r10.c2c9359d4
pkgrel=1
pkgdesc="SCons-like build system that use python as a front-end language and Ninja as a building backend"
arch=(any)
url="http://mesonbuild.com/"
license=('Apache')
depends=('python' 'ninja')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/mesonbuild/meson'
         'arch-meson')
md5sums=('SKIP'
         'e1a31b2f4993cf627c640cf6795a17f5')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  for _f in data/syntax-highlighting/vim/*/*; do
    install -Dt "${pkgdir}/usr/share/vim/vimfiles/$(basename "$(dirname "$_f")")" -m644 "$_f"
  done
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*

  # Arch packaging helper
  install -D ../arch-meson -t "${pkgdir}/usr/bin"
}
