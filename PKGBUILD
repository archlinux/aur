# Contributor: Luca Cesari < luca AT cesari DOT me>
pkgname=tmuxinator
pkgver=2.0.2
pkgrel=3
pkgdesc="Manage complex tmux sessions easily"
arch=(any)
url="https://github.com/aziz/tmuxinator"
license=(MIT)
depends=(
  'ruby'
  'ruby-erubis'
  'ruby-thor'
  'ruby-xdg>=4.3.0'
  'ruby-rdoc'
)
makedepends=('ruby-bundler')
options=('!emptydirs')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "xdg.patch"
)
sha256sums=('2e473fc56f9491f682ec115b62c07b29bbfb79b2e5bb0cc33ea3c5e008e6f852'
            '565f40e0e314a82d5ce547333d6d912efa7c3e0bd6330892eea28319eef49316')

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
  install -D -m 644 "${pkgdir}/${_gemdir}/gems/tmuxinator-${pkgver}/completion/tmuxinator.bash" "${pkgdir}/usr/share/tmuxinator/completion.bash"
  install -D -m 644 "${pkgdir}/${_gemdir}/gems/tmuxinator-${pkgver}/completion/tmuxinator.fish" "${pkgdir}/usr/share/tmuxinator/completion.fish"
  install -D -m 644 "${pkgdir}/${_gemdir}/gems/tmuxinator-${pkgver}/completion/tmuxinator.zsh" "${pkgdir}/usr/share/tmuxinator/completion.zsh"
  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "${pkgdir}/${_gemdir}/cache"
  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 :
