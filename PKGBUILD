# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com> 
# Submitter: nontlikeuname

pkgname=meson-git
pkgver=1.10.0.r79.4a9075b86
pkgrel=1
pkgdesc="SCons-like build system that uses python as a front-end language and Ninja as a building backend"
arch=(any)
url="http://mesonbuild.com/"
license=('Apache')
depends=('python' 'ninja')
makedepends=('git' 'python-build' 'python-installer')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/mesonbuild/meson'
         'arch-meson')
b2sums=('SKIP'
        'f1b61b7e56e1ebde3dba2ee4b5fb45ef35d6c9f27dc5631fe7dc25bd97a39672a8f96e4b2c3055580e6c6dffa48575d4fab9e6ca2e5416234ea3dc8765c30955')

pkgver() {
	cd meson
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd meson
  python -m build --wheel --no-isolation
}

package() {
  cd meson
  python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  for _f in data/syntax-highlighting/vim/*/*; do
    install -Dt "${pkgdir}/usr/share/vim/vimfiles/$(basename "$(dirname "$_f")")" -m644 "$_f"
  done
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*

  # Arch packaging helper
  install -D ../arch-meson -t "${pkgdir}/usr/bin"
}


