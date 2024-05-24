# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Luca Cesari < luca AT cesari DOT me>

pkgname=tmuxinator
pkgver=3.2.1
pkgrel=1
pkgdesc="Manage complex tmux sessions easily"
arch=(any)
url="https://github.com/aziz/tmuxinator"
license=(MIT)
depends=(
  'ruby'
  'ruby-erubi'
  'ruby-thor'
  'ruby-xdg5'
)
makedepends=('ruby-bundler')
optdepends=('zsh-completions: for ZSH completion')
options=('!emptydirs')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "xdg.patch"
)
sha256sums=('56c0b26b37c801ba8dc95666e39bf69f4041817b34471bd915f587cface6220b'
            'bf91cc99026b1b465b00085512138df4717123ebb841acfb935c80162d14b0ba')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 < ../xdg.patch
}

build() {
  cd ${pkgname}-${pkgver}
  mkdir -p pkg
  gem build -o "pkg/${pkgname}-${pkgver}.gem"
}

package() {
  cd ${pkgname}-${pkgver}
  local _gemdir
  _gemdir="$( ruby -e 'puts Gem.default_dir' )"

  gem install \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "${pkgdir}/${_gemdir}" \
    --bindir "${pkgdir}/usr/bin" \
    "pkg/${pkgname}-${pkgver}.gem"

  mkdir -p "${pkgdir}/usr/share/tmuxinator"
  install -D -m 644 "${pkgdir}/${_gemdir}/gems/tmuxinator-${pkgver}/completion/tmuxinator.bash" "${pkgdir}/usr/share/bash-completion/completions/tmuxinator"
  install -D -m 644 "${pkgdir}/${_gemdir}/gems/tmuxinator-${pkgver}/completion/tmuxinator.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  # Provided by zsh-completions
  # install -D -m 644 "${pkgdir}/${_gemdir}/gems/tmuxinator-${pkgver}/completion/tmuxinator.zsh" "${pkgdir}/usr/share/zsh/site-functions/_tmuxinator"

  rm -rf "${pkgdir}/${_gemdir}/cache"
  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 :
