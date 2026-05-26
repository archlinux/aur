# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>
# Contributor: Luca Cesari < luca AT cesari DOT me>

pkgname=tmuxinator
pkgver=3.4.0
pkgrel=1
pkgdesc="Manage complex tmux sessions easily"
arch=(any)
url="https://github.com/aziz/tmuxinator"
license=(MIT)
depends=(
  'ruby'
  'ruby-erb'
  'ruby-erubi'
  'ruby-thor'
  'ruby-xdg'
)
makedepends=('ruby-bundler')
optdepends=('zsh-completions: for ZSH completion')
options=('!emptydirs')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "00-bump-gemspec-thor-dependency-to-1.5.0.patch"
)
sha256sums=('ea043d727660d4a10e0e851c0f44128849ac420b9fba477dad2a436b6f568173'
            'df2131d084feb55a679353b1098ca3b326b569f000980b84632ddcd934023cc9')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -N -i "${srcdir}/00-bump-gemspec-thor-dependency-to-1.5.0.patch"
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
