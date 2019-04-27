# Maintainer: nroi <nroi@mailbox.org>
pkgname=cpcache-git
pkgver=0.1.0.r0.g9249d15
pkgrel=1
pkgdesc="central pacman cache"
arch=('x86_64')
url='https://github.com/nroi/cpcache'
license=('MIT')
makedepends=('erlang-nox' 'elixir')
install="${pkgname%-git}.install"
backup=('etc/cpcache/cpcache.toml')
source=('git+https://github.com/nroi/cpcache.git#tag=0.1.0'
        'sysuser.conf'
        'cpcache.install'
        'cpcache.service'
)
sha256sums=('SKIP'
            '0098e749b19617c0f7d619d47a3bc3015bab62e9ad0916087502daff672fb309'
            '3ca1bcfb52153bfee7b316174b02cb51e2468bbdc69a41821b96804678ab4d69'
            'a5d891b7d5cd282a3e7db445d8bbe14b230af7cb1a1e9536130e2f0e514d69bd'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  TMP="$(mktemp -d)"
  cd "${srcdir}/${pkgname%-git}/cpcache"
  HOME="$TMP" /usr/bin/mix local.hex --force
  HOME="$TMP" /usr/bin/mix local.rebar --force
  HOME="$TMP" /usr/bin/mix deps.get
  HOME="$TMP" MIX_ENV=prod /usr/bin/mix release --env=prod
  mkdir -p "${pkgdir}/usr/share/${pkgname%-git}"
  mkdir -p "${pkgdir}/var/lib/${pkgname%-git}"
  mkdir -p "${pkgdir}/etc/cpcache"
  cd "${pkgdir}/usr/share/${pkgname%-git}"
  tar xf "${srcdir}/${pkgname%-git}/cpcache/_build/prod/rel/${pkgname%-git}/releases/0.1.0/${pkgname%-git}.tar.gz"
  ln -s "/var/lib/${pkgname%-git}" var
  install -Dm644 "${srcdir}/cpcache.service" "${pkgdir}/usr/lib/systemd/system/cpcache.service"
  install -Dm644 "${srcdir}/sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/cpcache.conf"
  install -Dm644 "${srcdir}/cpcache/cpcache/conf/cpcache.toml" "${pkgdir}/etc/cpcache/cpcache.toml"
  rm -rf "$TMP"
}
