# Maintainer: David Runge <dvzrv@archlinux.org>

_name=editorconfig
pkgname=vim-editorconfig
_commit=0a3c1d8082e38a5ebadcba7bb3a608d88a9ff044  # refs/tags/v1.1.1
pkgver=1.1.1
pkgrel=2
pkgdesc="EditorConfig plugin for Vim"
arch=(any)
url="https://github.com/editorconfig/editorconfig-vim"
license=(
  BSD
  CCPL
  PSF
)
groups=(vim-plugins)
makedepends=(
  git
)
checkdepends=(
  editorconfig-core-c
  ruby-rake
  ruby-rspec
  ruby-vimrunner
  xorg-server-xvfb
)
source=(
  "git+$url.git#tag=$_commit"
  git+https://github.com/editorconfig/editorconfig-plugin-tests.git
  git+https://github.com/editorconfig/editorconfig-core-test.git
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd $_name-vim

  git submodule init
  git config submodule.tests/plugin/spec/plugin_tests.url "$srcdir/editorconfig-plugin-tests"
  git config submodule.tests/core/tests.url "$srcdir/editorconfig-core-test"
  git -c protocol.file.allow=always submodule update
}

# # tests hang forever: https://github.com/editorconfig/editorconfig-vim/issues/150
# check() {
#   cd $_name-vim
#   export EDITORCONFIG_VIM_EXTERNAL_CORE=/usr/bin/editorconfig
#   xvfb-run rspec tests/plugin/spec/editorconfig_spec.rb
# }

package() {
  # gvim, pulled in by ruby-vimrunner conflicts with vim
  depends+=(vim)

  cd $_name-vim
  install -vDm 644 autoload/${_name}{,_core}.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/"
  install -vDm 644 autoload/${_name}_core/*.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/${_name}_core"
  install -vDm 644 doc/$_name.txt -t "$pkgdir/usr/share/vim/vimfiles/doc"
  install -vDm 644 plugin/$_name.vim -t "$pkgdir/usr/share/vim/vimfiles/plugin"
  install -vDm 644 {CONTRIBUTORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
