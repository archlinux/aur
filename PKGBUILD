# Maintainer: nontlikeuname

pkgname=meson-git
pkgver=0.44.0.r291.1b7b7fed
pkgrel=1
pkgdesc="SCons-like build system that use python as a front-end language and Ninja as a building backend"
arch=(any)
url="http://mesonbuild.com/"
license=('Apache')
depends=('python' 'ninja')
makedepends=('git')
checkdepends=('gcc-objc' 'vala' 'rust' 'gcc-fortran' 'mono' 'boost' 'qt4' 'qt5-base' 'git'
              'cython' 'gtkmm3' 'gtest' 'gmock' 'protobuf' 'wxgtk' 'python-gobject' 'gobject-introspection'
              'itstool' 'gtk3' 'java-environment=8' 'gtk-doc' 'llvm' 'clang' 'sdl2' 'graphviz'
              'doxygen' 'vulkan-validation-layers' 'openmpi' 'openssh' 'mercurial' 'gtk-sharp-2'
              'qt5-tools' 'libwmf' 'dmd' 'valgrind')
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

check() {
	cd "$srcdir/${pkgname%-git}"
#	tests require a lot of dependencies
# # --as-needed breaks openmpi linking
  #LDFLAGS="${LDFLAGS/,--as-needed/}"

  # set for debug output
  #export MESON_PRINT_TEST_OUTPUT=1

  #export LC_CTYPE=en_US.UTF-8
  #./run_tests.py
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  for _f in data/syntax-highlighting/vim/*/*; do
    install -Dt "${pkgdir}/usr/share/vim/vimfiles/$(basename "$(dirname "$_f")")" -m644 "$_f"
  done
  install -Dt "${pkgdir}/usr/share/emacs/site-lisp" -m644 data/syntax-highlighting/emacs/*
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*

  # Arch packaging helper
  install -D ../arch-meson -t "${pkgdir}/usr/bin"
}
