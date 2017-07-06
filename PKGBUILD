# $Id: PKGBUILD 206311 2017-01-10 00:36:50Z foutrelis $
# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Contributor: John Henderson <jw.hendy@gmail.com>

pkgname=taskjuggler3
pkgver=3.5.0
pkgrel=13
pkgdesc='Project Management Software'
arch=('any')
url='http://www.taskjuggler.org'
license=('GPL')
depends=('ruby-mail' 'ruby-term-ansicolor')
source=("http://rubygems.org/downloads/taskjuggler-${pkgver}.gem"
        'tj-ruby2.1.patch'
        'tj-system-dirs.patch')
noextract=("taskjuggler-${pkgver}.gem")
sha256sums=('42f2e81470be9b2486fc074ba6ff04180258f462fed5c46cba871b7518cd0465'
            'e59b510acd1d176ef384101b7eba541713775c8da06c503b48020e8726f8629c'
            '973f9b2d538e5caf7f05bccfe8c16cafba2222703315ab7ee7569738063eea6c')

prepare() {
  gem install -N -i . taskjuggler-${pkgver}.gem \
    --ignore-dependencies \
    --no-user-install

  cd gems/taskjuggler-${pkgver}
  patch -Np1 -i ../../tj-ruby2.1.patch
  patch -Np1 -i ../../tj-system-dirs.patch
}

package() {
  cd gems/taskjuggler-${pkgver}

  local _rubyver="$(ruby -e'puts RUBY_VERSION')"

  install -dm 755 "${pkgdir}"/usr/{lib/ruby/{gems/${_rubyver},vendor_ruby},share/{doc,taskjuggler,vim/vimfiles/{ftdetect,syntax}}}
  mv bin "${pkgdir}"/usr/
  mv lib "${pkgdir}"/usr/lib/ruby/vendor_ruby/${_rubyver}

# Gem compatibility
  mv ../../specifications "${pkgdir}"/usr/lib/ruby/gems/${_rubyver}/

# Vim syntax
  mv data/tjp.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/
  echo 'au! BufNewFile,BufRead *.tjp,*.tji set ft=tjp' > "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/tjp.vim

# Data
  mv data "${pkgdir}"/usr/share/taskjuggler/
  mv examples "${pkgdir}"/usr/share/taskjuggler/

# Documentation
  mv manual "${pkgdir}"/usr/share/doc/taskjuggler
}

# vim: ts=2 sw=2 et:
