# Maintainer: David Runge <dvzrv@archlinux.org>

_name=editorconfig
_tests_commit=cb7ae15d16ab3d72a1139f7a629b11cfe16d972f
pkgname=vim-editorconfig
pkgver=1.1.1
pkgrel=1
pkgdesc="EditorConfig plugin for Vim"
arch=('any')
url="https://github.com/editorconfig/editorconfig-vim"
license=('BSD' 'CCPL' 'PSF')
groups=('vim-plugins')
depends=('editorconfig-core-c')
checkdepends=('ruby-rake' 'ruby-rspec' 'ruby-vimrunner' 'xorg-server-xvfb')
provides=('editorconfig-vim')
conflicts=('editorconfig-vim')
replaces=('editorconfig-vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}-vim/archive/v${pkgver}.tar.gz"
        "${pkgname}-tests-${_tests_commit}.tar.gz::https://github.com/editorconfig/editorconfig-plugin-tests/archive/${_tests_commit}.tar.gz"
        "${pkgname}-1.1.1-tests.patch")
sha512sums=('7b94db4b2f641ecd2d2623bf55bf9b457c007b2b5c8553cba5b7a75bc34823d6995d3c9ed13febe0f59de6f87c52eb0367591213c43c6fcd7c331c529126f4d6'
            '0f003fbe538c03bc18fcda9c2f6f20d4f6c451b22f7957806487792bffe529ab5dd608a2b602f895f61b3c442237b2640918c7052b49f19b68297964d3db227c'
            '7147a4d0e1ad5604e045228229919559426aede27086e12bc9415c048af47038fcaa9380a1de6185dcd650417ebe088bb92140c4bb3185cc1aed32481deac1de')

prepare() {
  mv -v "${_name}-vim-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  mv -v "../${_name}-plugin-tests-${_tests_commit}/"* tests/plugin/spec/plugin_tests
  # some test files are seemingly missing:
  # https://github.com/editorconfig/editorconfig-vim/issues/150
  patch -Np1 -i "../${pkgname}-1.1.1-tests.patch"
}

check() {
  cd "$pkgname-$pkgver"
  export EDITORCONFIG_VIM_EXTERNAL_CORE=/usr/bin/editorconfig
  export DISPLAY=:99.0
  xvfb-run rspec tests/plugin/spec/editorconfig_spec.rb
}

package() {
  # gvim, pulled in by ruby-vimrunner conflicts with vim
  depends+=('vim')
  cd "$pkgname-$pkgver"
  # plugin files
  install -vDm 644 "autoload/${_name}"{,_core}.vim \
    -t "${pkgdir}/usr/share/vim/vimfiles/autoload"
  install -vDm 644 "autoload/${_name}_core/"*.vim \
    -t "${pkgdir}/usr/share/vim/vimfiles/autoload/${_name}_core"
  install -vDm 644 "doc/${_name}.txt" -t "${pkgdir}/usr/share/vim/vimfiles/doc"
  install -vDm 644 "plugin/${_name}.vim" \
    -t "${pkgdir}/usr/share/vim/vimfiles/plugin"
  # docs
  install -vDm 644 {CONTRIBUTORS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
