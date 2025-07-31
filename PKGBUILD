# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: winlu <derwinlu@gmail.com>

pkgname=rebar3-git
pkgver=5471.56c955c8
pkgrel=1
pkgdesc="Erlang build tool that makes it easy to compile and test Erlang applications and releases"
arch=('any')
url="https://github.com/erlang/rebar3"
license=('Apache-2.0')
depends=('erlang-common_test'
         'erlang-core'
         'erlang-dialyzer'
         'erlang-edoc'
         'erlang-erl_interface'
         'erlang-eunit'
         'erlang-parsetools')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
makedepends=('git')
source=("git+https://github.com/erlang/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  HOME="." ./bootstrap
}

check() {
  cd "${srcdir}/${pkgname%-git}"
  ./rebar3 ct
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -vDm755 -t "${pkgdir}/usr/bin" rebar3
  install -vDm644 -t "${pkgdir}/usr/lib/erlang/lib/rebar-${pkgver}/ebin" \
    _build/bootstrap/lib/rebar/ebin/*.beam \
    _build/bootstrap/lib/rebar/ebin/rebar.app

  install -vDm644 -t "${pkgdir}/usr/share/bash-completion/completions" \
    apps/rebar/priv/shell-completion/bash/rebar3
  install -vDm644 -t "${pkgdir}/usr/share/zsh/site-functions" \
    apps/rebar/priv/shell-completion/zsh/_rebar3
  install -vDm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" \
    apps/rebar/priv/shell-completion/fish/rebar3.fish

  install -vDm644 -t "${pkgdir}/usr/share/man/man1" manpages/rebar3.1
  install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" \
    README.md rebar.config.sample THANKS
}
