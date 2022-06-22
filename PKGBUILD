# Maintainer: Matt Cuneo <m@cuneo.au>

_pkgname=gitlab-gitaly
pkgname="${_pkgname}-git"
pkgver=15.1.0
pkgrel=2
pkgdesc="Speed up Git access using caching"
arch=('x86_64')
conflicts=("$_pkgname")
provides=("$_pkgname")
url="https://gitlab.com/gitlab-org/gitaly"
license=('MIT')
depends=(glibc ruby2.7 libxml2 libxslt libssh2)
options=(!buildflags)
makedepends=(go cmake git)
backup=("etc/gitlab-gitaly/config.toml")
_tag=v${pkgver}
source=("git+https://gitlab.com/gitlab-org/gitaly#branch=15-1-stable"
        "configs.patch"
        "gitlab-gitaly.service"
	      "ruby27.patch")
sha512sums=('SKIP'
            'ee8e6c43f9da4107b49886ef3bbeacaaf8a85fbdc82c464625bbccd75f53253834ce81ac9462643f4097f7d5d049160763fcd9d8450af93580167b00f7e5c150'
            '7f5cd528c873a5e43e18aa6a88bd7298422c047e0e61cf3208be7d9fcfdfdc8a844b5c439ab6afc2098c5c4c60ed9c3d167c2f87517f1e93b34f39be3d3dad09'
            '63cbe9bd53a20bf2c83e1bbe478273431ab11175fd943994a89b844166640b30500c95718ea9e102a9d94476e17282e0e609045f2e313816be181e75b637b74b')

pkgver() {
  cd gitaly
  cat VERSION | xargs
}

prepare() {
  cd gitaly

  patch -p1 < ../ruby27.patch

  patch -p1 < ../configs.patch
  # At this point the config file should not contain any references to '/home/git'

  # https://github.com/bundler/bundler/issues/6882
  sed -e '/BUNDLED WITH/,+1d' -i ruby/Gemfile.lock
}

build() {
  cd gitaly

  bundle-2.7 config force_ruby_platform true # build from sources as some prebuilt gems are not available for newer ruby
  make BUILD_TAGS="tracer_static tracer_static_jaeger"
}

package() {
  cd gitaly

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}"/etc/gitlab-gitaly
  mkdir -p "${pkgdir}"/usr/share/webapps/gitlab-gitaly
  cp -r ruby "${pkgdir}"/usr/share/webapps/gitlab-gitaly/ruby

  install -Dm644 config.toml.example "${pkgdir}"/etc/${_pkgname}/config.toml
  install -Dm644 "LICENSE" "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
  install -Dm644 "${srcdir}"/gitlab-gitaly.service "${pkgdir}"/usr/lib/systemd/system/gitlab-gitaly.service
}
