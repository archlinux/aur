_name='zsh-autosuggestions'
pkgname="${_name}-git"
pkgver=v0.4.3.r0.gd7c7967
pkgrel=1
pkgdesc='Fish shell like fast/unobtrusive autosuggestions for zsh'
url='https://github.com/zsh-users/zsh-autosuggestions'
arch=('any')
license=('Custom:MIT')
depends=('zsh')
makedepends=('git' 'ruby' 'tmux' 'ruby-rdoc')
provides=('zsh-autosuggestions')
install="${_name}.install"
source=("${_name}::${url//https/git}")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/${_name}"
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_name}"
    make -B zsh-autosuggestions.zsh
    install -d "${pkgdir}/usr/share/zsh/plugins/${_name}"
    cp -a --no-preserve=ownership "zsh-autosuggestions.zsh" "${pkgdir}/usr/share/zsh/plugins/${_name}"

    # license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

check() {
    cd "${srcdir}/${_name}"
    (
      # The test script uses Ruby Gems.
      # Avoid installing them in the user's real home.
      export HOME=$PWD/tmphome
      export GEM_HOME=$(ruby -e 'print Gem.user_dir')
      export PATH=$GEM_HOME/bin:$PATH
      gem install bundler
      bundle install

      make test
    )
}
